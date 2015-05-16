#!/bin/bash

# This scripts installs OVH's SSH key in order to give access to authorized
# admins without root password. 
# Please see http://help.ovh.co.uk/InstallOvhKey for further details.

whoami=`whoami`
if [ "$whoami"=="root" ]
then

	mkdir -p /root/.ssh
	chmod 700 /root/.ssh
	grep "\"213.186.50.100\"" /root/.ssh/authorized_keys2 1>>/dev/null || echo "from=\"213.186.50.100\" ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAIEAt3XaIhEoRK5sEKm6wtYyazLOx3w+Yv9+bpfEvLftHr2hxZ2TY2A655iwMbgvhHqsMuGEjK9yGkZIQbUgB6HvOgOWOwJSX6Gc9Ac7GuH11xSU8tHDuTQot6fVtgcm2Y/VUFi65Knz9rLHz7h/Zy29ek+UYav5T7juhBIuk57cDxs= root@cache.ovh.net" >> /root/.ssh/authorized_keys2
	grep "\"::ffff:213.186.50.100\"" /root/.ssh/authorized_keys2 1>>/dev/null || echo "from=\"::ffff:213.186.50.100\" ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAIEAt3XaIhEoRK5sEKm6wtYyazLOx3w+Yv9+bpfEvLftHr2hxZ2TY2A655iwMbgvhHqsMuGEjK9yGkZIQbUgB6HvOgOWOwJSX6Gc9Ac7GuH11xSU8tHDuTQot6fVtgcm2Y/VUFi65Knz9rLHz7h/Zy29ek+UYav5T7juhBIuk57cDxs= root@cache.ovh.net" >> /root/.ssh/authorized_keys2

	chmod 600 /root/.ssh/authorized_keys2

	echo "The key has been installed successfully."
	exit 0

else

	echo "You have to be root to install the key on the server."
	exit 1
fi
