#!/bin/bash

RECURSO="rg-lab-storage"

echo "⚠️ Esto eliminará TODO el grupo de recursos: $RECURSO"
read -p "¿Deseas continuar? (s/n): " CONFIRMAR

if [[ "$CONFIRMAR" == "s" || "$CONFIRMAR" == "S" ]]; then
  az group delete --name $RECURSO --yes --no-wait
  echo "🧹 Eliminación en curso..."
else
  echo "❌ Operación cancelada."
fi
