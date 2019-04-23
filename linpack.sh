sudo su
singularity pull docker://godlovedc/easybuild 
singularity run docker://godlovedc/easybuild 
git clone -b docker --single-branch https://github.com/AS805456/cluster-template
cd cluster-template
#docker build -t linpack ./
#docker run -it --rm linpack
