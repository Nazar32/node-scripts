docker exec ironfish ./bin/run wallet:create $NODE_NAME && \
docker exec ironfish ./bin/run wallet:use $NODE_NAME && \
docker exec ironfish ./bin/run config:set nodeName $NODE_NAME && \
docker exec ironfish ./bin/run config:set blockGraffiti $NODE_NAME && \
docker exec ironfish ./bin/run config:set minerBatchSize 60000 && \
docker exec ironfish ./bin/run config:set enableTelemetry true
