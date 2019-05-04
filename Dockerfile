
FROM ubuntu

RUN apt-get update
ADD linpack_10.3.4/benchmarks/linpack/
CMD numactl /xlinpack_xeon64
