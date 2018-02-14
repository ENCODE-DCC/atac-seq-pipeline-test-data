#!/bin/bash

CROMWELL_JAR=$(which cromwell-30.1.jar)
WDL=$CODE/atac-seq-pipeline/atac.wdl
INPUT=$CODE/atac-seq-pipeline-test-data/scripts/ENCSR356KRQ_subsample_xcor.json
WF_OPT=$CODE/atac-seq-pipeline/workflow_opts/docker.json
BACKEND_CONF=$CODE/atac-seq-pipeline/backends/backend.conf
BACKEND=Local

mkdir -p ENCSR356KRQ_subsample_xcor && cd ENCSR356KRQ_subsample_xcor
java -Dconfig.file=${BACKEND_CONF} -Dbackend.default=${BACKEND} -jar ${CROMWELL_JAR} run ${WDL} -i ${INPUT} -o ${WF_OPT}
find $PWD -name '*.cc.qc' | grep -v glob | grep shard-0
cd ..