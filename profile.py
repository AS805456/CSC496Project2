# Import the Portal object.
import geni.portal as portal
# Import the ProtoGENI library.
import geni.rspec.pg as pg
import geni.rspec.igext as IG

# Create a portal context.
pc = portal.Context()

# Create a Request object to start building the RSpec.
request = pc.makeRequestRSpec()


tourDescription = \
"""
This profile provides the template for a compute node with Docker installed on Ubuntu 16.04
"""

#
# Setup the Tour info with the above description and instructions.
#  
tour = IG.Tour()
tour.Description(IG.Tour.TEXT,tourDescription)
request.addTour(tour)

prefixForIP = "192.168.1."

link = request.LAN("lan")

node = request.XenVM("head")

node.cores = 8
node.ram = 262144
node.disk = 8
node.routable_control_ip = "true"
 
node.disk_image = "urn:publicid:IDN+emulab.net+image+emulab-ops:UBUNTU16-64-STD"
  
iface = node.addInterface("if" + str(0))
iface.component_id = "eth1"
iface.addAddress(pg.IPv4Address(prefixForIP + str(0), "255.255.255.0"))
link.addInterface(iface)
  
node.addService(pg.Execute(shell="sh", command="sudo bash /local/repository/install_docker.sh"))
node.addService(pg.Execute(shell="sh", command="sudo bash /local/repository/linpack/install_linpack.sh"))
node.addService(pg.Execute(shell="sh", command="sudo bash /local/repository/Stream/install_stream.sh"))
  
# Print the RSpec to the enclosing page.
pc.printRequestRSpec(request)
