#!/bin/sh
docker-machine -D create --driver amazonec2 \
  --engine-storage-driver aufs \
  --amazonec2-access-key $AWS_ACCESS_KEY_ID \
  --amazonec2-secret-key $AWS_SECRET_ACCESS_KEY \
  --amazonec2-subnet-id $SUBNET_ID \
  --amazonec2-vpc-id $VPC_ID $1

