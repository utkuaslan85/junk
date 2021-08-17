import boto
import boto.s3.connection
access_key = 'A8D6CS8JLN7H5MMW8E1O'
secret_key = 'DDfeSHJba0t0TVCPTDrfEcOLZEaaEARg5WVT1gu1'

conn = boto.connect_s3(
        aws_access_key_id = access_key,
        aws_secret_access_key = secret_key,
        host = '10.240.242.105',
        #is_secure=False,               # uncomment if you are not using ssl
        calling_format = boto.s3.connection.OrdinaryCallingFormat(),
        )

for bucket in conn.get_all_buckets():
        print("{name}\t{created}".format(
                name = bucket.name,
                created = bucket.creation_date,
        ))