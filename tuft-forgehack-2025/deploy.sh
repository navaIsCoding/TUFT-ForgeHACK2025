#!/usr/bin/env bash
set -e

## load environment variables from .env file
set -a
source .env
set +a

# check for environment variables
if ! env | grep FORGE_API_TOKEN >/dev/null; then
    echo "Missing environment variable: FORGE_API_TOKEN"
    exit 1
elif ! env | grep FORGE_EMAIL >/dev/null; then
    echo "Missing environment variable: FORGE_EMAIL"
    exit 1
elif ! env | grep FORGE_DEPLOYMENT_TARGET >/dev/null; then
    echo "Missing environment variable: FORGE_DEPLOYMENT_TARGET"
    exit 1
else
    echo -e "\e[1;32m[  OK  ]\e[0m Environment"
fi

# find forge
if ! command -v forge >/dev/null; then
    echo "Could not find forge installed."
    exit 1
else
    echo -e "\e[1;32m[  OK  ]\e[0m Forge"
fi

# deploy forge
forge deploy
echo -e "\e[1;32m[  OK  ]\e[0m Deployment"

# install forge, checking for existing installs
if forge install list | grep Confluence >/dev/null; then
    
    read -e -p ":: Application already installed. Reinstall? [y/N] " choice
    if [[ "$choice" == [Yy]* ]]; then

        # grab id from installation list
        id="$(forge install list | grep Confluence | awk ' { print $2 } ')"
    
        # uninstall with id
        forge uninstall "$id"
    else
        echo -e "\e[1;33m[ SKIP ]\e[0m Installation"
        exit 0
    fi
fi
echo ":: Interactive prompt coming up, please reply 'Yes'."
forge install --site "$FORGE_DEPLOYMENT_TARGET" --product Confluence
echo -e "\e[1;32m[  OK  ]\e[0m Installation"