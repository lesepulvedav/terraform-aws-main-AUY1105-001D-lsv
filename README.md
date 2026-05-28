# ev2codigo

Proyecto de infraestructura como código usando Terraform y módulos reutilizables.

## Descripción

Repositorio Terraform modular que define la infraestructura principal a través de módulos para VPC, S3, EC2 y ALB. El archivo raíz `main.tf` orquesta la composición de los módulos.

## Estructura

- `main.tf` - Entrada principal que monta los módulos.
- `modules/vpc_module/` - Módulo de red (VPC, subnets, route tables).
- `modules/s3_module/` - Módulo para buckets S3.
- `modules/ec2_module/` - Módulo para instancias EC2.
- `modules/alb_module/` - Módulo para Application Load Balancer.

## Requisitos

- Terraform >= 0.13 (recomendado usar 1.x).
- Proveedor de cloud configurado (p. ej. credenciales AWS en `~/.aws/credentials`).
- `aws` CLI (opcional, para ver/validar recursos fuera de Terraform).

## Uso rápido

1. Inicializar el proyecto:

```bash
terraform init
```

2. Validar y formatear:

```bash
terraform fmt -recursive
terraform validate
```

3. Planear los cambios:

```bash
terraform plan -out=tfplan
```

4. Aplicar:

```bash
terraform apply tfplan
```

Si quieres aplicar directamente:

```bash
terraform apply -auto-approve
```

## Variables y outputs

Los módulos exponen variables y outputs en sus archivos `variables.tf` y `outputs.tf`. Revisa cada módulo para conocer las variables requeridas y sus valores por defecto.

Recomendación: revisar [modules/vpc_module/README.md](modules/vpc_module/README.md) y los README de cada módulo para detalles específicos.

## Buenas prácticas

- Usa workspaces o estados remotos para ambientes (dev/stage/prod).
- No versionar archivos de estado (`*.tfstate`) ni credenciales.
- Lockea versiones de proveedores en `required_providers`.

## Contribuir

- Abrir issues para sugerencias o errores.
- Enviar pull requests con descripciones claras y pruebas cuando sea posible.

## Licencia

Sin licencia especificada. Añade un archivo `LICENSE` si quieres publicar bajo una licencia concreta.

---

Si quieres que incluya ejemplos de variables, outputs o comandos específicos para AWS, dímelo y los añado.
