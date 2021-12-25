# hd-idle-systemd
Starting/stopping [hd-idle](https://github.com/adelolmo/hd-idle) on Raspberry Pi 
via systemd, to keep your external hard drives from spinning 24/7.

A typical application of hd-idle would be to spin down an external hard drive that
is attached to a Raspberry Pi and used for storing backup data. Since that hard drive
is not in use most of the time, it can be safely spun down.


## Determine UUID

It is best to use hd-idle via UUIDs, especially if you have multiple hard drives 
attached to the Pi (and it is not guaranteed which drive will get `/dev/sda` assigned).

You can determine the UUID of the partition on the hard drive that you want to spin 
down using `lsblk`:

```bash
lsblk -o PATH,UUID
```


## Installation

* download and install hd-idle release

  https://github.com/adelolmo/hd-idle/releases

* copy `hd-idle.sh` into:

  ```commandline
  /usr/local/bin
  ```

* edit `hd-idle.sh`, adjusting the parameters (variable `PARAMS`) passed to 
  hd-idle executable to suit your needs:

* copy `hd-idle.service` into:

  ```commandline
  /etc/systemd/system
  ```

* enable service

  ```commandline
  sudo systemctl enable hd-idle
  ```

