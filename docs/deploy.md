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

If you're running macOS, Linux or WSL, run this command in a terminal:

```sh
bash deploy.sh
```
