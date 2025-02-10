# Deployment Instructions

## 1. Set environment variables

Create a file in the `tuft-forgehack-2025` folder named `.env`, and add these
lines:

```sh
FORGE_API_TOKEN='<insert key here>'
FORGE_EMAIL='<insert atlassian account email here>'
DEPLOYMENT_TARGET='<insert deployment target here>'
```

Substitute in the relevant values, and ensure that the single quote marks are
intact.

## 2. Run deployment script

If you're running macOS, Linux or WSL, run this command in a terminal from
the `tuft-forgehack-2025` directory:

```sh
bash deploy.sh
```

Ensure you have the `forge` utilities installed before continuing.

## 2.1. Manual deployment

Run these commands in the `tuft-forgehack-2025` directory:

1. `forge deploy` to deploy onto your organisation.
2. `forge install` to install and active the application.

If you already have an application installed, run:

1. `forge install list` to see the current installation ID,
2. `forge uninstall <id>` to uninstall that instance, and
3. `forge install` to re-install.
