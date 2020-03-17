#!/usr/bin/env bash

OUPTUT_DIR="$(pwd)"
BASE_URL="covid19app.github.io/covid19app-expo/dist"

mkdir -p "${OUPTUT_DIR}/images"
qrencode -o "${OUPTUT_DIR}/images/android-qr-code.png" "exps://${BASE_URL}/android-index.json"
qrencode -o "${OUPTUT_DIR}/images/ios-qr-code.png" "exps://${BASE_URL}/ios-index.json"

mv "${OUPTUT_DIR}/dist" "${OUPTUT_DIR}/dist.old.$(date +%Y%m%d_%H%M%S)"
pushd ../covid19app
expo export --output-dir "${OUPTUT_DIR}/dist" --public-url "https://${BASE_URL}"
popd
