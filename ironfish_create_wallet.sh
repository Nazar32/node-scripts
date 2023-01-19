ironfish wallet:create $NODE_NAME && \
ironfish wallet:use $NODE_NAME && \
ironfish config:set nodeName $NODE_NAME && \
ironfish config:set blockGraffiti $NODE_NAME && \
ironfish config:set minerBatchSize 60000 && \
ironfish config:set enableTelemetry true
