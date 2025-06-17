#!/bin/bash

# Parámetros
RECURSO="rg-lab-storage"
UBICACION="eastus"
STORAGE_NAME="storbloblab$(date +%s)"  # Nombre único
CONTENEDOR="logs"
ETIQUETA_DOCENTE="gmtech"
ETIQUETA_PROYECTO="lab-blob"

echo "✅ Iniciando sesión en Azure..."
az login --only-show-errors

echo "📦 Creando grupo de recursos: $RECURSO..."
az group create --name $RECURSO --location $UBICACION \
  --tags docente=$ETIQUETA_DOCENTE proyecto=$ETIQUETA_PROYECTO

echo "💾 Creando cuenta de almacenamiento de bajo costo..."
az storage account create \
  --name $STORAGE_NAME \
  --resource-group $RECURSO \
  --location $UBICACION \
  --sku Standard_LRS \
  --access-tier Cool \
  --tags docente=$ETIQUETA_DOCENTE proyecto=$ETIQUETA_PROYECTO

echo "📂 Creando contenedor blob..."
CONN=$(az storage account show-connection-string --name $STORAGE_NAME --resource-group $RECURSO --query connectionString -o tsv)
az storage container create --name $CONTENEDOR --connection-string "$CONN"

echo "📄 Subiendo archivo de ejemplo..."
az storage blob upload \
  --container-name $CONTENEDOR \
  --file ./data/ejemplo_log.txt \
  --name ejemplo_log.txt \
  --connection-string "$CONN"

echo "🔍 Listando blobs en el contenedor:"
az storage blob list --container-name $CONTENEDOR --connection-string "$CONN" --output table

echo "🏷️ Recursos con etiqueta 'proyecto=$ETIQUETA_PROYECTO':"
az resource list --tag proyecto=$ETIQUETA_PROYECTO --output table

echo "✅ Laboratorio creado correctamente."
