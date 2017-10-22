#!/bin/bash

POSITIONAL=()
while [[ $# > 0 ]]; do
  key="$1"
  
  case $key in
    -d|--directory)
    DIR="$2"
    shift
    shift
    ;;
    -p|--pattern)
    PATTERN="$2"
    shift
    shift
    ;;
    -t|--target)
    TARGET="$2"
    shift
    shift
    ;;
    *)
    POSITIONAL+=("$1")
    shift
    ;;
    
  esac
done
set -- "${POSITIONAL[@]}"

echo Search directory is "${DIR}"
echo Search pattern is "${PATTERN}"
echo Replacement target is "${TARGET}"

if [ -n "${DIR}" ] && [ -n "${PATTERN}" ] && [ -n "${TARGET}" ]; then
  grep -r -l ${PATTERN} ${DIR} | xargs sed -i "s/${PATTERN}/${TARGET}/g"
fi
