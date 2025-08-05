#!/bin/bash

set -e

ROOT="terraform-gcp-cloudrun-pipeline"

echo "📁 Membuat folder proyek: $ROOT"

# Root files
mkdir -p $ROOT
touch $ROOT/{main.tf,variables.tf,outputs.tf,terraform.tfvars,backend.tf,cloudbuild.yaml,.gitignore}

# Module folders
MODULES=(
  "cloud_run"
  "artifact_registry"
  "cloud_build"
  "cloud_build_trigger"
)

for MODULE in "${MODULES[@]}"; do
  MODULE_PATH="$ROOT/modules/$MODULE"
  mkdir -p "$MODULE_PATH"
  touch "$MODULE_PATH/main.tf"
  touch "$MODULE_PATH/variables.tf"
  touch "$MODULE_PATH/outputs.tf"
  echo "✅ Modul dibuat: $MODULE_PATH"
done

echo "🎉 Struktur folder selesai dibuat di ./$ROOT"
