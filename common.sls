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
        - password: school

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

