#!/usr/bin/env bash

echo "Publishing sqs-connector""
janeway run-task jvm-build-runner --cluster-name flotilla-prod \
 -e SOURCE_REPO="sqs-kafka-connect" \
 -e SOURCE_BRANCH="master" \
 -e COMMAND="sbt -mem 8192 -Dsbt.log.noformat=true -DscalaVersion=2.11.8 clean prepCreds publish"

