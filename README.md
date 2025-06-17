# 🧪 Laboratorio Azure Blob Storage - GMTech

Este laboratorio práctico permite a los estudiantes crear y gestionar almacenamiento tipo **Blob** en Azure, aplicando conceptos clave como grupos de recursos, cuentas de almacenamiento, contenedores, etiquetado y limpieza automática. 

Está pensado para **usarse con muy bajo costo**, y completamente con **Azure CLI**.

---

## 📁 Estructura del laboratorio

lab_blob_storage/
│
├── crear_lab_blob.sh # Script para crear la infraestructura del laboratorio
├── eliminar_lab_blob.sh # Script para eliminar todo al finalizar
├── data/
│ └── ejemplo_log.txt # Archivo de prueba que se cargará al contenedor
└── README.md # Guía de uso


---

## ⚙️ Requisitos Previos

- Cuenta de Azure activa (ideal con créditos gratuitos).
- Azure CLI instalada y autenticada con `az login`.
- Acceso a Bash (Linux, WSL o Git Bash en Windows).
- Conexión a internet y permisos para crear recursos.

---

## 🚀 Instrucciones

### 1. Clonar el repositorio

```bash
git clone https://github.com/jgaragorry/laboratorios-linux-azure-gmtech.git
cd laboratorios-linux-azure-gmtech/lab_blob_storage


2. Ejecutar el laboratorio

bash crear_lab_blob.sh


Esto hará lo siguiente:

Crear un grupo de recursos: rg-lab-blob

Crear una cuenta de almacenamiento tipo Standard LRS

Crear un contenedor Blob público para prueba

Subir el archivo data/ejemplo_log.txt

Aplicar etiquetas:

docente=gmtech

proyecto=lab_blob_storage

3. Validar
Puedes verificar que el archivo fue subido correctamente con:

az storage blob list \
  --container-name contenedor-lab \
  --account-name cuentaalmacenamientolab \
  --auth-mode login \
  --output table


⚠️ Los nombres reales se generan automáticamente y aparecerán en la terminal durante la ejecución.

🧹 Limpieza del laboratorio
Para eliminar todos los recursos creados y evitar costos:

bash eliminar_lab_blob.sh

Esto eliminará el grupo de recursos completo, limpiando todo.

🧑‍🏫 Propósito del laboratorio
Introducir el uso de Azure Storage tipo Blob.

Promover la automatización con scripts Bash y Azure CLI.

Reforzar buenas prácticas: etiquetado, bajo costo, limpieza final.

Ideal para cursos introductorios en Cloud Computing, DevOps o Linux + Azure.

📄 Licencia
Distribuido bajo la licencia MIT.


---

¿Quieres que lo suba ahora mismo al repositorio y te diga los pasos o prefieres hacerlo tú?


