# Deployment

1. Configure environment variables in `.env` and GitHub secrets:
   - `VITE_API_BASE_URL` in `.env` for local dev.
   - `OVH_HOST`, `OVH_USER`, `OVH_PASSWORD` secrets for SFTP.
2. Install dependencies and build:
   ```bash
   npm ci
   npm run build
   ```
3. Deploy by pushing to `main` or running the `Deploy Sonopresta to OVH` workflow.
   The workflow builds the front and mirrors `dist/` to `/home/<OVH_USER>/www/` on OVH via `lftp`.
4. After deployment, a health check ensures `https://sonopresta.com/` responds with `200`.
