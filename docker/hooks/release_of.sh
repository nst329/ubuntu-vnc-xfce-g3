#!/bin/bash -e

main() {
    local result=""

    case "$1" in

        chromium-1804 )
            # result=$(wget -qO- \
            result=$(curl -sL \
                http://archive.ubuntu.com/ubuntu/pool/universe/c/chromium-browser/ \
		| grep chromium-browser \
		| grep 0ubuntu0.18.04.\*_amd64.deb \
		| sed -E 's/[^_]*_([0-9.]+-0ubuntu0\.18\.04\.[^_"]*)_[^"]*.*/\1/'
            )
            ;;

        * )
            echo "Unknown key '$1'"
            return 1
            ;;

    esac

    echo "${result}"
}

main $@
