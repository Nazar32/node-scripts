docker-compose down && \
docker-compose pull && \
№docker-compose run --rm --entrypoint "./bin/run migrations:start" ironfish && \
docker-compose up -d
