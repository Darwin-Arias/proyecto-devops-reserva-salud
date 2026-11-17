# Reserva de horas médicas – Proyecto DevOps

Servicio web **estático** de reserva de horas médicas para una clínica ficticia (rubro salud), servido con **Nginx** dentro de un contenedor **Docker**. No usa API ni base de datos, y el formulario es solo una simulación: no guarda ni envía datos.

## Requisitos
- Docker Desktop instalado y abierto (en Windows, con WSL 2 activo).
- Git (para clonar el repositorio).

## Estructura
```
proyecto-devops/
├── src/
│   ├── index.html
│   └── styles.css
├── Dockerfile
├── docker-compose.yml
├── .env.example
├── .gitignore
├── README.md
└── .github/workflows/devops-automation.yml   (opcional)
```

## Instalación
```bash
git clone <URL-DEL-REPOSITORIO>
cd proyecto-devops
```
Opcional: si quieres cambiar el puerto, copia `.env.example` como `.env` y edita `HOST_PORT`.

## Ejecución
```bash
docker compose up -d --build
```
Luego abre en el navegador: **http://localhost:8080**

## Verificación
```bash
docker compose ps        # el servicio debe aparecer "running" (y luego "healthy")
docker compose logs      # registros de Nginx
docker stats --no-stream # uso de CPU y memoria
```
Qué debe verse en el navegador: el formulario de reserva, los datos de atención y el estado del servicio.

## Operación
```bash
docker compose stop      # detener
docker compose start     # volver a iniciar
docker compose restart   # reiniciar
docker compose down      # detener y eliminar el contenedor
```

## Construcción manual (sin Compose)
```bash
docker build -t reservas-salud:1.0 .
docker run -d --name reservas-salud-web -p 8080:80 reservas-salud:1.0
```

## Seguridad
- El repositorio no contiene credenciales, claves ni datos personales.
- `.env` está en `.gitignore`; solo se publica `.env.example` con valores de ejemplo.
- Los datos de la clínica (dirección, teléfono, correo) son ficticios.

## Automatización (opcional)
El archivo `.github/workflows/devops-automation.yml` revisa en GitHub Actions que existan los archivos obligatorios, valida el Compose, construye la imagen y comprueba que la página responde. No publica nada en servidores externos.

## Evidencias
Las evidencias (capturas, comandos y resultados) están integradas en el informe del proyecto.
