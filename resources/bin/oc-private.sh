#!/bin/bash

set -eu

realpath() {
    [[ $1 = /* ]] && echo "$1" || echo "$PWD/${1#./}"
}

SCRIPT_PATH=$(realpath "$0");
SCRIPT_DIR=$(realpath $(dirname "$0"));

clean() {
    local tmpFile;

    tmpFile=$(mktemp);
    cp "$1" "$tmpFile";

    /usr/libexec/PlistBuddy "$tmpFile" \
        -c 'Set PlatformInfo:Generic:MLB **Redacted**';
    /usr/libexec/PlistBuddy "$tmpFile" \
        -c 'Set PlatformInfo:Generic:SystemSerialNumber **Redacted**';
    /usr/libexec/PlistBuddy "$tmpFile" \
        -c 'Set PlatformInfo:Generic:SystemUUID **Redacted**';
        /usr/libexec/PlistBuddy "$tmpFile" \
        -c "Set PlatformInfo:Generic:ROM $(printf '\x00')";
    cat "$tmpFile";
}

main() {
    clean "${SCRIPT_DIR}/../../OC/config.plist" > "${SCRIPT_DIR}/../../OC/config.redacted.plist"
}

main "$@"
