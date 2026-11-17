# Imagen base ligera con Nginx
FROM nginx:alpine

# Copia el sitio estático al directorio que sirve Nginx
COPY src/ /usr/share/nginx/html/

# Nginx escucha en el puerto 80 dentro del contenedor
EXPOSE 80

# Verifica que el servicio responde (Docker marcará el contenedor como "healthy")
HEALTHCHECK --interval=30s --timeout=5s --retries=3 \
  CMD wget -q --spider http://127.0.0.1/ || exit 1
