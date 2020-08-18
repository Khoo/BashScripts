#!/bin/bash

ACCTN=ak5446
HOST="gadi.nci.org.au"
GROUP=q97

ANGLE=15
PROCS=192
DIST=2000
THICKNESS=25

PAT=/scratch/${GROUP}/${ACCTN}/tracerClone/congested-subduction

FOLDER=${PAT}/output-1e-06-${ANGLE}-${THICKNESS}128x48x48_np${PROCS}

SCRIPT="cd ${FOLDER};
	ls *proj* *field* velocityField-* pressureField-* *mesh* *.xmf ba_subsurf-* ba_subsurf_* | xargs tar -zcf 3d-${ANGLE}.tar.gz;
	ls | grep *.tar.gz"

ssh -l ${ACCTN} ${HOST} "${SCRIPT}"


##scp ${ACCTN}@${HOST}:"'${FOLDER}':*.tar.gz" .

scp ${ACCTN}@${HOST}:"/scratch/q97/ak5446/tracerClone/congested-subduction/output-1e-06-${ANGLE}-${THICKNESS}128x48x48_np${PROCS}/*.tar.gz" .
##/scratch/q97/ak5446/tracerClone/congested-subduction/output-1e-06-15-25128x48x48_np192


##/scratch/q97/ak5446/new/congested-subduction/output-1e-06-15-128x48x48_np192
