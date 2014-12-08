DATE=`date +%Y-%m-%d`
NAME=ChrootX
VERSION=0.0.7

requirements::
	apt-get install bash-static busybox-static debootstrap rinse qemu-utils
	cpan JSON DateTime Time::HiRes

jchroot::
	git clone https://github.com/vincentbernat/jchroot
	cd jchroot; make; cp -f jchroot /usr/sbin/

install::
	cp -f chrootx /usr/sbin/
	cp -f chrootx.conf /etc/
	mkdir -p /var/lib/chrootx
	cp -rp templates /var/lib/chrootx
	cp -f fstab.chrootx /var/lib/chrootx/fstab

deinstall::
	rm -f /usr/sbin/chrootx
	rm -rf /var/lib/chrootx

edit::
	dee4 chrootx Makefile templates/* fstab.chrootx README.md TODO LICENSE

backup::
	cd ..; tar cfvz ${NAME}-${VERSION}.tar.gz ${NAME}; scp ${NAME}-${VERSION}.tar.gz the-labs.com:Backup/; mv ${NAME}-${VERSION}.tar.gz ~/ownCloud/Backup/

push::
	git remote set-url origin git@github.com:Spiritdude/ChrootX.git
	git push -u origin master

pull::
	git remote set-url origin git@github.com:Spiritdude/ChrootX.git
	git pull -u origin master

