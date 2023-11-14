#!/usr/bin/env bash

# VMWare Fusion (for Mac) easy commands via functions
vmup() {
    [ $1 ] && /Applications/VMware\ Fusion.app/Contents/Library/vmrun -T fusion start ~/Virtual\ Machines.localized/$1.vmwarevm/$1.vmx nogui || echo "Please provide VM name"
}

vmdown() {
    [ $1 ] && /Applications/VMware\ Fusion.app/Contents/Library/vmrun -T fusion stop ~/Virtual\ Machines.localized/$1.vmwarevm/$1.vmx soft=True || echo "Please provide VM name"
}

vmlist() {
  vmls=`ls ~/Virtual\ Machines.localized/ | sed 's/\.vmwarevm$//' | tr "/\n" " "`
  echo "All available VMs: ${vmls}"  vmrn=`/Applications/VMware\ Fusion.app/Contents/Library/vmrun -T fusion list | grep vm | cut -d'/' -f6 | sed 's/\.vmx$//' | tr "/\n" " "`
  echo "All running VMs: ${vmrn}"
}


