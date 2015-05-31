#include <stdio.h>
#include <stdlib.h>
#include <sys/ioctl.h>
#include <fcntl.h>
#include <linux/cdrom.h>

int main(int argc,char **argv) {
    int cdrom;
    int status=1;

    printf("Usage: trayopen [device]\n");
    printf("Result: Open tray exit code 0, closed tray exit code 1.\n");

    if ((cdrom = open(argv[1],O_RDONLY | O_NONBLOCK)) < 0) {
	printf("Unable to open device %s. Provide a device name (/dev/sr0, /dev/cdrom) as a parameter.\n",argv[1]);
	exit(1);
    }

    if (ioctl(cdrom,CDROM_DRIVE_STATUS) == CDS_TRAY_OPEN) {
	status=0;
    }

    close(cdrom);
    exit(status);
}
