DATE=`date +%Y-%m-%d`
NAME=ChrootX
VERSION=0.0.4

requirements::
	apt-get install bash-static busybox-static debootstrap
	git clone https://github.com/vincentbernat/jchroot; cd jchroot; make
	cpan JSON DateTime Time::HiRes

install::
	cp -f chrootx /usr/sbin/
	cp -f jchroot/jchroot /usr/sbin/
	mkdir -p /var/lib/chrootx/templates
	cp -rp templates /var/lib/chrootx
	cp -f fstab.chrootx /var/lib/chrootx/fstab

deinstall::
	rm -f /usr/sbin/chrootx
	rm -rf /var/lib/chrootx

edit::
	dee4 chrootx Makefile templates/* fstab.chrootx README.md TODO LICENSE

backup::
	cd ..; tar cfvz ${NAME}-${VERSION}.tar.gz ${NAME}; scp ${NAME}-${VERSION}.tar.gz the-labs.com:Backup/; mv ${NAME}-${VERSION}.tar.gz ~/ownCloud/Backup/

