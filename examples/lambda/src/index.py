import os
import redis

REDIS_PRIMARY_ENDPOINT = os.getenv('REDIS_PRIMARY_ENDPOINT')
REDIS_READER_ENDPOINT = os.getenv('REDIS_READER_ENDPOINT')

redisPrimary = redis.Redis(host=REDIS_PRIMARY_ENDPOINT, port=6379, db=0)
redisReader = redis.Redis(host=REDIS_READER_ENDPOINT, port=6379, db=0)


def handler(event, context):
    redisPrimary.set('foo', 'bar')
    assert redisReader.get('foo') == b'bar'
