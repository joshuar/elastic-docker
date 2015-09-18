#!/usr/bin/env bash

TARGET_DIR=$1
TARGET_NAME=$2
BUILD_DIR=$(mktemp -d)

if [[ ! -d ${TARGET_DIR} ]]; then
    echo "Target directory not specified, bailing..."
    exit -1
fi

if [[ ! ${TARGET_NAME} ]]; then
    echo "Target name not specified, bailing..."
    exit -1
fi

if [[ ! -d ${BUILD_DIR} ]]; then
    echo "Build directory not created, bailing..."
    exit -1
fi

echo ${TARGET_DIR} ${TARGET_NAME} ${BUILD_DIR}

cp -rL ${TARGET_DIR}/* ${BUILD_DIR} \
    && cd ${BUILD_DIR} \
    && docker build -t ${TARGET_NAME} .

if [[ ! $? ]]; then
    echo "Build failed!"
fi

if [[ -d ${BUILD_DIR} ]]; then
    rm -fr ${BUILD_DIR}
fi

exit 0
