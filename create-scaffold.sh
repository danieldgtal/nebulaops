#!/bin/bash
set -e

# --- Run from repo root ---
ROOT_DIR="$(pwd)"
echo "🏗️  Creating NebulaOps project structure in root: $ROOT_DIR"

# --- Helper functions ---
create_dir() {
    mkdir -p "$1"
}

create_file() {
    if [ ! -f "$1" ]; then
        touch "$1"
        echo "Created file: $1"
    else
        echo "Skipped existing file: $1"
    fi
}

create_readme() {
    if [ ! -f "$1" ]; then
        echo -e "$2" > "$1"
        echo "Created README.md: $1"
    else
        echo "Skipped existing README.md: $1"
    fi
}

# --- Top-level directories ---
create_dir "$ROOT_DIR/.github/workflows"
create_dir "$ROOT_DIR/frontend/public"
create_dir "$ROOT_DIR/frontend/src/components"
create_dir "$ROOT_DIR/frontend/src/services"
create_dir "$ROOT_DIR/frontend/src/types"
create_dir "$ROOT_DIR/backend/app/api"
create_dir "$ROOT_DIR/backend/app/core"
create_dir "$ROOT_DIR/backend/app/schemas"
create_dir "$ROOT_DIR/workers/cmd"
create_dir "$ROOT_DIR/workers/internal/config"
create_dir "$ROOT_DIR/workers/internal/workflows"
create_dir "$ROOT_DIR/workers/activities"
create_dir "$ROOT_DIR/infrastructure/terraform"
create_dir "$ROOT_DIR/infrastructure/ansible/inventory"
create_dir "$ROOT_DIR/infrastructure/ansible/playbooks"
create_dir "$ROOT_DIR/scripts/setup"
create_dir "$ROOT_DIR/docs"

# --- Frontend placeholder files ---
create_file "$ROOT_DIR/frontend/public/favicon.ico"
create_file "$ROOT_DIR/frontend/src/components/LoginForm.tsx"
create_file "$ROOT_DIR/frontend/src/components/Dashboard.tsx"
create_file "$ROOT_DIR/frontend/src/components/ResourceForm.tsx"
create_file "$ROOT_DIR/frontend/src/components/WorkflowStatus.tsx"
create_file "$ROOT_DIR/frontend/src/services/api.ts"
create_file "$ROOT_DIR/frontend/src/types/auth.ts"
create_file "$ROOT_DIR/frontend/src/types/resource.ts"
create_file "$ROOT_DIR/frontend/src/types/workflow.ts"
create_file "$ROOT_DIR/frontend/src/App.tsx"
create_file "$ROOT_DIR/frontend/src/main.tsx"
create_file "$ROOT_DIR/frontend/index.html"
create_file "$ROOT_DIR/frontend/package.json"
create_file "$ROOT_DIR/frontend/tsconfig.json"
create_file "$ROOT_DIR/frontend/vite.config.ts"
create_file "$ROOT_DIR/frontend/tailwind.config.js"
create_file "$ROOT_DIR/frontend/.env.example"
create_readme "$ROOT_DIR/frontend/README.md" "# Frontend\n\nThis directory contains the React UI application including components, services, and types. Expand as needed."

# --- Backend placeholder files ---
create_file "$ROOT_DIR/backend/app/api/auth.py"
create_file "$ROOT_DIR/backend/app/api/resources.py"
create_file "$ROOT_DIR/backend/app/api/workflows.py"
create_file "$ROOT_DIR/backend/app/core/config.py"
create_file "$ROOT_DIR/backend/app/core/security.py"
create_file "$ROOT_DIR/backend/app/schemas/auth.py"
create_file "$ROOT_DIR/backend/app/schemas/resource.py"
create_file "$ROOT_DIR/backend/app/schemas/workflow.py"
create_file "$ROOT_DIR/backend/app/models.py"
create_file "$ROOT_DIR/backend/app/database.py"
create_file "$ROOT_DIR/backend/app/temporal_client.py"
create_file "$ROOT_DIR/backend/app/main.py"
create_file "$ROOT_DIR/backend/requirements.txt"
create_file "$ROOT_DIR/backend/Dockerfile"
create_file "$ROOT_DIR/backend/.env.example"
create_readme "$ROOT_DIR/backend/README.md" "# Backend\n\nThis directory contains the Python FastAPI backend, API endpoints, models, schemas, and Temporal client. Expand as needed."

# --- Workers placeholder files ---
create_file "$ROOT_DIR/workers/cmd/main.go"
create_file "$ROOT_DIR/workers/internal/config/config.go"
create_file "$ROOT_DIR/workers/internal/workflows/provision.go"
create_file "$ROOT_DIR/workers/activities/terraform.go"
create_file "$ROOT_DIR/workers/activities/ansible.go"
create_file "$ROOT_DIR/workers/go.mod"
create_file "$ROOT_DIR/workers/go.sum"
create_file "$ROOT_DIR/workers/Dockerfile"
create_file "$ROOT_DIR/workers/.env.example"
create_readme "$ROOT_DIR/workers/README.md" "# Workers\n\nThis directory contains Go Temporal workers, workflows, and activities to execute infrastructure provisioning asynchronously."

# --- Infrastructure placeholder files ---
create_file "$ROOT_DIR/infrastructure/terraform/backend.tf"
create_file "$ROOT_DIR/infrastructure/terraform/providers.tf"
create_file "$ROOT_DIR/infrastructure/terraform/main.tf"
create_file "$ROOT_DIR/infrastructure/terraform/variables.tf"
create_file "$ROOT_DIR/infrastructure/terraform/outputs.tf"
create_file "$ROOT_DIR/infrastructure/ansible/ansible.cfg"
create_file "$ROOT_DIR/infrastructure/ansible/inventory/hosts.yml"
create_file "$ROOT_DIR/infrastructure/ansible/playbooks/configure-webserver.yml"
create_readme "$ROOT_DIR/infrastructure/README.md" "# Infrastructure\n\nContains Terraform and Ansible files for provisioning and configuring cloud resources."

# --- GitHub workflows placeholders ---
create_file "$ROOT_DIR/.github/workflows/backend-ci.yml"
create_file "$ROOT_DIR/.github/workflows/frontend-ci.yml"
create_file "$ROOT_DIR/.github/workflows/workers-ci.yml"
create_file "$ROOT_DIR/.github/workflows/deploy.yml"
create_readme "$ROOT_DIR/.github/workflows/README.md" "# .github/workflows\n\nContains GitHub Actions workflows for CI/CD."

# --- Scripts placeholders ---
create_file "$ROOT_DIR/scripts/setup/install-deps.sh"
create_file "$ROOT_DIR/scripts/setup/init-db.sh"
create_readme "$ROOT_DIR/scripts/README.md" "# Scripts\n\nContains setup and utility scripts to initialize the project."

# --- Docs placeholders ---
create_file "$ROOT_DIR/docs/SETUP.md"
create_file "$ROOT_DIR/docs/ARCHITECTURE.md"
create_readme "$ROOT_DIR/docs/README.md" "# Docs\n\nContains project documentation like setup instructions and architecture diagrams."

# --- Root files ---
create_file "$ROOT_DIR/Makefile"
create_file "$ROOT_DIR/README.md"
create_file "$ROOT_DIR/.gitignore"
create_file "$ROOT_DIR/.env.example"

# --- Root README.md content ---
cat << EOF > "$ROOT_DIR/README.md"
# 🌌 NebulaOps — Hybrid Compute Platform (PoC)

This repository is a proof-of-concept hybrid compute platform scaffold.

## Directory Structure

Each major directory has its own README.md explaining its purpose.

- \`frontend/\` → React UI
- \`backend/\` → Python FastAPI backend
- \`workers/\` → Go Temporal workers
- \`infrastructure/\` → Terraform & Ansible
- \`scripts/\` → Setup and utility scripts
- \`docs/\` → Documentation
- \`.github/workflows\` → CI/CD pipelines

## Quick Start

To create the full scaffold (if not already present), run:

\`\`\`bash
./create-scaffold.sh
\`\`\`

This will generate the complete project structure in the root directory of the repository.
EOF

echo "✅ NebulaOps scaffold with README.md files created successfully!"

