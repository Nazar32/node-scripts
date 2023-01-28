docker-compose down && \
docker-compose pull && \
wget -O $HOME/.ironfish/hosts.json https://raw.githubusercontent.com/DOUBLE-TOP/guides/main/ironfish/hosts.json && \
docker-compose run --rm --entrypoint "./bin/run migrations:start" ironfish && \
docker-compose up -d
