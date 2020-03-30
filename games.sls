games:
    pkgrepo.managed:
        - name: games
        - humanname: Games
        - enabled: 1
        - baseurl: http://download.opensuse.org/repositories/games/openSUSE_Tumbleweed/
        - gpgcheck: 1
        - gpgautoimport: 1
        - gpgkey: http://download.opensuse.org/repositories/games/openSUSE_Tumbleweed/repodata/repomd.xml.key

    cmd.run: 
        - name: zypper --gpg-auto-import-keys refresh -r games

    pkg.installed:
        - pkgs:
            - Minecraft
            - alienarena
            - supertuxkart
            - tuxpuck
            - extreme-tuxracer
            - heroes-tron
            - armagetron
            - asteroids3D
            - asteroid
            - battleship
            - doomretro
            - frozen-bubble
            - neverball
            - sdl-ball
