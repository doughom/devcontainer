#!/bin/bash
set -eu

pi_version="$1"
pi_x64_hash="$2"
pi_arm64_hash="$3"

case "$(arch)" in
    x86_64)
        archSuffix=x64
        hash="$pi_x64_hash"
        ;;
    aarch64)
        archSuffix=arm64
        hash="$pi_arm64_hash"
        ;;
    *)
        echo "Unknown architecture: $(arch)"
        exit 1
        ;;
esac

url="https://github.com/earendil-works/pi/releases/download/$pi_version/pi-linux-$archSuffix.tar.gz"
archive="pi.tar.gz"

curl --location --silent --show-error --output "$archive" "$url"
echo "$hash  $archive" > SHA256SUMS
sha256sum --check SHA256SUMS

tar xzf "$archive"
rm "$archive"
mkdir -p /pi-agent
mv pi/theme pi/pi /pi-agent/
