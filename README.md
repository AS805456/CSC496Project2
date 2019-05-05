To run Linpack, run the following commands:

sudo bash /local/repository/linpack/install_linpack.sh

sudo docker run -i -t --rm --privileged linpack

Run the benchmark with manual input for parameters.
The test case parameters were: 

Number of equations to solve: 45000

Leading dimension of array: 45000

Number of trials to run: 10

Data alignment alue (in Kbytes): 1


----------------------------------------------------------------

To run Stream, run the following commands:

sudo bash /local/repository/Stream/install_stream.sh

sudo docker run --rm --privileged stream

-----------------------------------------------------------------
