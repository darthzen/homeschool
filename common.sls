nvidia:
    pkgrepo.managed:
        - name: nvidia
        - humanname: nvidia
        - enabled: 1
        - baseurl: http://download.nvidia.com/opensuse/tumbleweed/
        - gpgcheck: 1
        - gpgkey: http://download.nvidia.com/opensuse/tumbleweed/repodata/repomd.xml.key

packman:
    pkgrepo.managed:
        - name: packman
        - humanname: packman
        - enabled: 1
        - baseurl: http://ftp.gwdg.de/pub/linux/misc/packman/suse/openSUSE_Tumbleweed/
        - gpgcheck: 1
        - gpgkey: https://ftp.gwdg.de/pub/linux/misc/packman/suse/openSUSE_Tumbleweed/repodata/repomd.xml.key

google-chrome-key:
    cmd.run:
        - name: rpm --import https://dl.google.com/linux/linux_signing_key.pub

google-chrome:
    pkgrepo.managed:
        - name: google-chrome
        - enabled: 1
        - baseurl: http://dl.google.com/linux/chrome/rpm/stable/x86_64
        - gpgcheck: 1
        - gpgkey: https://dl.google.com/linux/linux_signing_key.pub

zoom-key:
    cmd.run:
        - name: rpm --import https://zoom.us/linux/download/pubkey

zoom:
    cmd.run:
        - name: zypper --non-interactive --gpg-auto-import-keys in https://zoom.us/client/latest/zoom_openSUSE_x86_64.rpm

home:
    user.present:
        - fullname: Home School
        - shell: /bin/bash
        - home: /home/home
        - uid: 1000
        - gid: 100
        - groups:
            - wheel
            - video
        - password: $1$4CosACUh$voqenPtBnOC2AYmb8w7fn0
        - enforce_password: True

grant:
    user.present:
        - fullname: Grant Ashford
        - shell: /bin/bash
        - home: /home/grant
        - uid: 1001
        - gid: 100
        - groups:
            - wheel
            - video
        - password: $1$4CosACUh$voqenPtBnOC2AYmb8w7fn0
        - enforce_password: True

abby:
    user.present:
        - fullname: Abby Ashford
        - shell: /bin/bash
        - home: /home/abby
        - uid: 1002
        - gid: 100
        - groups:
            - wheel
            - video
        - password: $1$4CosACUh$voqenPtBnOC2AYmb8w7fn0
        - enforce_password: True

megan:
    user.present:
        - fullname: Megan Ashford
        - shell: /bin/bash
        - home: /home/megan
        - uid: 1003
        - gid: 100
        - groups:
            - wheel
            - video
        - password: $1$4CosACUh$voqenPtBnOC2AYmb8w7fn0
        - enforce_password: True

mallory:
    user.present:
        - fullname: Mallory Ashford
        - shell: /bin/bash
        - home: /home/mallory
        - uid: 1004
        - gid: 100
        - groups:
            - wheel
            - video
        - password: $1$4CosACUh$voqenPtBnOC2AYmb8w7fn0
        - enforce_password: True

grant-nfs:
    mount.mounted:
        - name: /home/grant
        - device: ark.ash4d.com:/data/homeschool/grant
        - fstype: nfs
        - opts:
            - defaults
        - mkmnt: True

abby-nfs:
    mount.mounted:
        - name: /home/abby
        - device: ark.ash4d.com:/data/homeschool/abby
        - fstype: nfs
        - opts:
            - defaults
        - mkmnt: True

megan-nfs:
    mount.mounted:
        - name: /home/megan
        - device: ark.ash4d.com:/data/homeschool/megan
        - fstype: nfs
        - opts:
            - defaults
        - mkmnt: True

mallory-nfs:
    mount.mounted:
        - name: /home/mallory
        - device: ark.ash4d.com:/data/homeschool/mallory
        - fstype: nfs
        - opts:
            - defaults
        - mkmnt: True

gnome-extensions:
    file.recurse:
        - source:
            - salt://gnome-extensions
        - name: /home/home/.local/share/gnome-shell/extensions
        - user: home
        - group: users

common:
    cmd.run: 
        - name: zypper --gpg-auto-import-keys refresh -r nvidia -r packman -r google-chrome

    pkg.installed:
        - pkgs:
            - nvidia-computeG05
            - htop
            - screen
            - terminator
            - dropbox-cli
            - nautilus-extension-dropbox
            - google-chrome-stable

