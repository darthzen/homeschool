education:
    pkgrepo.managed:
        - name: education
        - humanname: Education
        - enabled: 1
        - baseurl: http://download.opensuse.org/repositories/Education/openSUSE_Tumbleweed/
        - gpgcheck: 1
        - gpgautoimport: 1
        - gpgkey: http://download.opensuse.org/repositories/Education/openSUSE_Tumbleweed/repodata/repomd.xml.key

science:
    pkgrepo.managed:
        - name: science
        - humanname: Science
        - enabled: 1
        - baseurl: http://download.opensuse.org/repositories/science/openSUSE_Tumbleweed/
        - gpgcheck: 1
        - gpgautoimport: 1
        - gpgkey: http://download.opensuse.org/repositories/science/openSUSE_Tumbleweed/repodata/repomd.xml.key

school:
    cmd.run: 
        - name: zypper --gpg-auto-import-keys refresh -r education -r science

    pkg.installed:
        - pkgs:
            - gcompris 
            - gnuchess
            - celestia
            - kstars
            - stellarium
