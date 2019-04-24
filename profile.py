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
Used to run KVM
"""

#
# Setup the Tour info with the above description and instructions.
#  
tour = IG.Tour()
tour.Description(IG.Tour.TEXT,tourDescription)
request.addTour(tour)

prefixForIP = "192.168.1."

link = request.LAN("lan")

node = request.RawPC("head")
node.cores = 4
node.ram = 16384
node.routable_control_ip = "true"
 
node.disk_image = "urn:publicid:IDN+emulab.net+image+emulab-ops:UBUNTU16-64-STD"
  
iface = node.addInterface("if")
iface.component_id = "eth1"
iface.addAddress(pg.IPv4Address(prefixForIP, "255.255.255.0"))
link.addInterface(iface)
  
node.addService(pg.Execute(shell="sh", command="sudo bash /local/repository/passwordless.sh"))
node.addService(pg.Execute(shell="sh", command="sudo bash /local/repository/install_kvm.sh"))
node.addService(pg.Execute(shell="sh", command="sudo bash /local/repository/install_linpack.sh"))
  
  
# Print the RSpec to the enclosing page.
pc.printRequestRSpec(request)
