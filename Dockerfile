
FROM ubuntu

RUN apt-get update
CMD numactl /xlinpack_xeon64
