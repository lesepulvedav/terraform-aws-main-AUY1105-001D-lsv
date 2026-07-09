Este documento refleja las mejores prácticas para proyectos de infraestructura como código (IaC), destacando los módulos de AWS y las integraciones de integración continua (CI/CD) que tienes configuradas.

```markdown
# Terraform AWS Infrastructure - AUY1105-001D-lsv-develop

Este repositorio contiene la configuración de Infraestructura como Código (IaC) utilizando Terraform para provisionar y administrar de manera automatizada recursos en AWS. El proyecto está diseñado con una arquitectura modular para facilitar la escalabilidad, el mantenimiento y la reutilización del código.

## 🏗️ Arquitectura y Módulos

El proyecto está dividido en los siguientes módulos principales dentro del directorio `/modules`:

*   **`vpc_module`**: Configuración de la red base, incluyendo la Virtual Private Cloud (VPC), subredes públicas/privadas, tablas de enrutamiento y gateways.
*   **`ec2_module`**: Aprovisionamiento de instancias de cómputo EC2, configuraciones de seguridad y perfiles de instancia.
*   **`alb_module`**: Configuración del Application Load Balancer (ALB), target groups y listeners para distribuir el tráfico de manera eficiente.
*   **`s3_module`**: Creación y gestión de buckets S3 para almacenamiento de objetos, políticas de bucket y versionado.

## ⚙️ Requisitos Previos

Antes de ejecutar este proyecto, asegúrate de tener instalado y configurado lo siguiente:
*   [Terraform](https://www.terraform.io/downloads.html) (v1.x o superior recomendado).
*   [AWS CLI](https://aws.amazon.com/cli/) configurado con las credenciales adecuadas.
*   Permisos necesarios en AWS para aprovisionar VPCs, EC2, ALB y S3.

## 🚀 Uso y Despliegue

Los despliegues se manejan por entorno utilizando archivos de variables específicos. Actualmente, el entorno de desarrollo está configurado en `dev.tfvars`.

1. **Inicializar el directorio de trabajo:**
   ```bash
   terraform init

```

2. **Generar el plan de ejecución:**
Revisa los cambios que se aplicarán antes de confirmarlos, guardando el output en un archivo (como se observa en tu `plan-dev.out`):
```bash
terraform plan -var-file="dev.tfvars" -out="plan-dev.out"

```


3. **Aplicar la infraestructura:**
Ejecuta el plan previamente guardado:
```bash
terraform apply "plan-dev.out"

```



## 🔄 CI/CD y Automatización (GitHub Actions)

El ciclo de vida de la infraestructura está automatizado mediante flujos de trabajo de GitHub Actions ubicados en `.github/workflows/`:

* **`terraform.yml` / `main.yml**`: Automatiza las fases de `terraform fmt`, `init`, `plan` y `apply` dependiendo de la rama en la que se integren los cambios.
* **`checkov.yml`**: Integra escaneos de seguridad estática con Checkov para garantizar que las configuraciones de Terraform cumplan con las políticas de seguridad y cumplimiento antes de ser desplegadas.

## 📂 Estructura del Repositorio

```text
.
├── .github/workflows/       # Pipelines de CI/CD (Checkov, Terraform, Main)
├── modules/                 # Módulos reutilizables de Terraform
│   ├── alb_module/          # Módulo de Load Balancer
│   ├── ec2_module/          # Módulo de Instancias
│   ├── s3_module/           # Módulo de Almacenamiento
│   └── vpc_module/          # Módulo de Redes
├── .gitignore               # Archivos ignorados por Git
├── .terraform.lock.hcl      # Bloqueo de dependencias de proveedores
├── CHANGELOG.md             # Historial de cambios del proyecto
├── dev.tfvars               # Variables para el entorno de desarrollo
├── import.tf                # Bloques para importar recursos existentes
├── main.tf                  # Archivo principal de ejecución
├── variables.tf             # Declaración de variables globales
└── README.md                # Documentación del proyecto

```

```

Si necesitas agregar detalles específicos sobre parámetros requeridos en tu archivo `variables.tf` o instrucciones particulares sobre cómo manejar los estados remotos, dime y lo ajustamos.

```
