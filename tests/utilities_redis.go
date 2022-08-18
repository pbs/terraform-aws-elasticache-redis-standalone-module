package test

import (
	"fmt"
	"strconv"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func testTemplate(t *testing.T, variant string) {
	t.Parallel()

	terraformDir := fmt.Sprintf("../examples/%s", variant)

	terraformOptions := &terraform.Options{
		TerraformDir: terraformDir,
		LockTimeout:  "5m",
	}

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

	name := terraform.Output(t, terraformOptions, "name")
	arn := terraform.Output(t, terraformOptions, "arn")
	SGIDs := terraform.Output(t, terraformOptions, "sg_ids")
	engineVersionActual := terraform.Output(t, terraformOptions, "engine_version_actual")
	memberClusters := terraform.Output(t, terraformOptions, "member_clusters")
	primaryEndpointAddress := terraform.Output(t, terraformOptions, "primary_endpoint_address")
	readerEndpointAddress := terraform.Output(t, terraformOptions, "reader_endpoint_address")

	accountID := getAWSAccountID(t)
	region := getAWSRegion(t)

	expectedName := fmt.Sprintf("ex-tf-redis-%s", variant)
	expectedARN := fmt.Sprintf("arn:aws:elasticache:%s:%s:replicationgroup:%s", region, accountID, expectedName)
	expectedMinimumEngineVersionActual := 6.2
	expectedMemberClusters := fmt.Sprintf("[%s-001 %s-002]", expectedName, expectedName)
	expectedPartialPrimaryEndpointAddress := expectedName
	expectedPartialReaderEndpointAddress := expectedName

	engineVersionActualFloat, _ := strconv.ParseFloat(engineVersionActual, 64)

	assert.Equal(t, expectedName, name)
	assert.Equal(t, expectedARN, arn)
	assert.NotNil(t, SGIDs)
	assert.GreaterOrEqual(t, engineVersionActualFloat, expectedMinimumEngineVersionActual)
	assert.Equal(t, expectedMemberClusters, memberClusters)
	assert.Contains(t, primaryEndpointAddress, expectedPartialPrimaryEndpointAddress)
	assert.Contains(t, readerEndpointAddress, expectedPartialReaderEndpointAddress)
}
