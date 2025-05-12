# Uproszczony Dockerfile dla Taiga (backend + frontend)
FROM taigaio/taiga-back:6.7.0 as backend
FROM taigaio/taiga-front:6.7.0 as frontend

# Bazowy nginx container
FROM nginx:alpine

COPY --from=frontend /usr/share/nginx/html /usr/share/nginx/html
COPY --from=backend /taiga /taiga

# Konfiguracja nginx
COPY default.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
