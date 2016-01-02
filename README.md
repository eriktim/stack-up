# Stack-up

This project is used to set-up the configuration of a Debian based system to make daily back-ups to your Stack storage[1] via WebDAV.
The mount point is by default configured to be `/media/stack`.
Note that the Stack storage is mounted as a user (uid 1000) and hence not all files are readable.


## Pre-installation

The scripts assume the Stack storage is mounted on boot.
Firstly, install WebDAV by running `apt-get install webdav` as root.
Edit `/etc/davfs2/davfs2.conf` and set `use_locks` to `0`.
Edit `/etc/davfs2/secrets` and add the following line:

```
https://<username>.stackstorage.com/remote.php/webdav/ <username> <password>
```

Finally, add the following line to `/etc/fstab`:

```
https://<username>.stackstorage.com/remote.php/webdav /media/stack davfs uid=1000,gid=1000,rw,_netdev,auto 0 0
```

`_netdev` will ensure your Stack storage gets mounted on boot _after_ the network connection was set-up.


## Installation

Install by running `./install.sh` as root. Now edit your configuration in `/etc/stack-up.conf`.


## References

[1] <https://www.transip.nl/stack/>
