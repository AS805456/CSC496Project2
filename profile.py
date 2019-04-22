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
"""

#
# Setup the Tour info with the above description and instructions.
#  
tour = IG.Tour()
tour.Description(IG.Tour.TEXT,tourDescription)
request.addTour(tour)

prefixForIP = "192.168.1."

link = request.LAN("lan")

for i in range(5):
  if i == 0:
    node = request.XenVM("head")
  else:
    node = request.XenVM("worker-" + str(i))
  node.cores = 4
  node.ram = 4096
  node.routable_control_ip = "true"
 
  node.disk_image = "https://www.utah.cloudlab.us/image_metadata.php?uuid=89e6d902-cd87-11e4-9fb8-3548323d6d11"
  
  iface = node.addInterface("if" + str(i))
  iface.component_id = "eth1"
  iface.addAddress(pg.IPv4Address(prefixForIP + str(i + 1), "255.255.255.0"))
  link.addInterface(iface)
  
  node.addService(pg.Execute(shell="sh", command="sudo bash /local/repository/passwordless.sh"))
  node.addService(pg.Execute(shell="sh", command="sudo bash /local/repository/install_kvm.sh"))
  node.addService(pg.Execute(shell="sh", command="sudo bash /local/repository/install_linpack.sh"))
  
  
# Print the RSpec to the enclosing page.
pc.printRequestRSpec(request)
