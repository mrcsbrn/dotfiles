# Minhas funções

# variables ===================================================================
_aurmanager=/bin/trizen
_dotfiles_path=${HOME}/workspace/outros/dotfiles
# =============================================================================

# Chech if programs exists. Dot not remove this function
_exists(){ which "$1" >/dev/null 2>&1; }

# suckless ====================================================================
cp-st() {cp -r $_dotfiles_path/data/suckless/st .}
cp-dwm() {cp -r $_dotfiles_path/data/suckless/dwm .}
cp-dmenu() {cp -r $_dotfiles_path/data/suckless/dmenu .}
cp-ricer() {cp -r $_dotfiles_path/data/ricer .}
# =============================================================================

# templates ===================================================================
ctemplate(){
    file="$1"; [ -f $file ] && echo "file already exists" && return 1
    cat << EOF > $file
#include<stdio.h>

int main(){

    return 0;
}
EOF
}
bashtemplate(){
    file="$1"; [ -f $file ] && echo "file already exists" && return 1
    cat << EOF > $file
#!/usr/bin/env bash


EOF
    chmod +x $file
}
pythontemplate(){
    file="$1"; [ -f $file ] && echo "file already exists" && return 1
    cat << EOF > $file
#!/usr/bin/env python


def main():


if __name__ == '__main__':
    main()
EOF
    chmod +x $file
}
# =============================================================================

# redshift ====================================================================
redshift-lavras() { redshift -l -21.27:-45.04 -t 6500:4500 &; }
# =============================================================================

# Utilidades===================================================================
if _exists exa; then
    alias ls='exa -F --color=auto --group-directories-first'
    alias sl='exa -F --color=auto --group-directories-first'
    alias lsd='exa -l | grep "^d"'
    alias la='exa -la --group-directories-first'
else
    alias ls='/usr/bin/ls -hNFG --color=auto --group-directories-first'
    alias sl='/usr/bin/ls -hNFG --color=auto --group-directories-first'
    alias lsd='ls -lh | grep "^d"'
fi
cl(){ builtin cd "$@" && /usr/bin/ls -hNFG --color=auto --group-directories-first; }
cmkdir(){ mkdir -p "$@" && builtin cd "$@"; }
surfraw(){ /usr/bin/surfraw -browser=$BROWSER $@ ;}
sr(){ /usr/bin/sr -browser=$BROWSERCLI $@ ; }
givegit(){ git clone https://github.com/$1.git ;}
weather(){ curl -s wttr.in | sed -n "1,7p";}
bigfiles(){
    if [ $# -eq 1 ]; then
        du -hsx "$1"/* | sort -rh | head -10
    else
        du -hsx * | sort -rh | head -10
    fi
}

v(){
    if [ $# -eq 0 ]; then
        vim .;
    else
        vim "$@";
    fi
}

display-truecolors(){
    awk 'BEGIN{
        s="/\\/\\/\\/\\/\\"; s=s s s s s s s s;
        for (colnum = 0; colnum<77; colnum++) {
            r = 255-(colnum*255/76);
            g = (colnum*510/76);
            b = (colnum*255/76);
            if (g>255) g = 510-g;
            printf "\033[48;2;%d;%d;%dm", r,g,b;
            printf "\033[38;2;%d;%d;%dm", 255-r,255-g,255-b;
            printf "%s\033[0m", substr(s,colnum+1,1);
        }
        printf "\n";
    }'
}

# =============================================================================


# att hosts file ==============================================================
att-hosts(){
webfile="https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-porn/hosts"
tmpfile=/tmp/hoststmp
finalfile=/etc/hosts

cat > $tmpfile << EOF
# mrcsbrn hosts file
# generated by a script
# ===============================================================

127.0.0.1 localhost
127.0.0.1 localhost.localdomain
127.0.0.1 local
255.255.255.255 broadcasthost
::1 localhost
fe80::1%lo0 localhost
0.0.0.0 0.0.0.0
127.0.1.1 sbc
127.0.0.53 sbc

# MEU CUSTOM
# — Spotify Ad Block
0.0.0.0 media-match.com
0.0.0.0 adclick.g.doublecklick.net
0.0.0.0 googleads.g.doubleclick.net
0.0.0.0 http://www.googleadservices.com
0.0.0.0 pagead2.googlesyndication.com
0.0.0.0 desktop.spotify.com
0.0.0.0 pubads.g.doubleclick.net
0.0.0.0 audio2.spotify.com
0.0.0.0 crashdump.spotify.com
0.0.0.0 adeventtracker.spotify.com
0.0.0.0 log.spotify.com
0.0.0.0 analytics.spotify.com
0.0.0.0 ads-fa.spotify.com
0.0.0.0 audio-ec.spotify.com
0.0.0.0 heads-ec.spotify.com
0.0.0.0 prod.spotify.map.fastlylb.net
0.0.0.0 sto3.spotify.com
0.0.0.0 spclient.wg.spotify.com
0.0.0.0 upgrade.spotify.com
# — Spotify Ads Block End

# — Youtube Shit Block
0.0.0.0 redirector.googlevideo.com
0.0.0.0 r3---sn-hp57knsl.googlevideo.com
0.0.0.0 r6---sn-vgqseney.googlevideo.com
0.0.0.0 r5---sn-hp57kn6e.googlevideo.com
0.0.0.0 r2---sn-hp57yne7.googlevideo.com
0.0.0.0 r7---sn-8p8v-bg0d.googlevideo.com
0.0.0.0 r8---sn-8p8v-bg0d.googlevideo.com
0.0.0.0 r4---sn-vgqs7nez.googlevideo.com
0.0.0.0 r4.sn-vgqs7nez.googlevideo.com
0.0.0.0 www.youtube-nocookie.com
0.0.0.0 i1.ytimg.com
0.0.0.0 r17---sn-vgqsenes.googlevideo.com
0.0.0.0 r2---sn-vgqs7n7k.googlevideo.com
0.0.0.0 clients6.google.com
0.0.0.0 r1---sn-vgqsen7z.googlevideo.com
0.0.0.0 r1.sn-vgqsen7z.googlevideo.com
0.0.0.0 r20---sn-vgqs7ne7.googlevideo.com
0.0.0.0 r20.sn-vgqs7ne7.googlevideo.com
0.0.0.0 pagead2.googlesyndication.com
0.0.0.0 youtube.com/api/stats/ads
0.0.0.0 ads.doubleclick.net
0.0.0.0 s.ytimg.com
0.0.0.0 ad.youtube.com
0.0.0.0 ads.youtube.com
0.0.0.0 www.gstatic.com
0.0.0.0 gstatic.com
0.0.0.0 clients1.google.com
0.0.0.0 dts.innovid.com
0.0.0.0 googleads.g.doubleclick.net
0.0.0.0 googleads4.g.doubleclick.net
0.0.0.0 pagead2.googlesyndication.com
0.0.0.0 pixel.moatads.com
0.0.0.0 rtd.tubemogul.com
0.0.0.0 s.youtube.com
0.0.0.0 s.innovid.com
0.0.0.0 pubads.g.doubleclick.net
0.0.0.0 ssl.google-analytics.com
0.0.0.0 www-google-analytics.l.google.com
0.0.0.0 stats.g.doubleclick.net
0.0.0.0 clients.l.google.com
0.0.0.0 pagead.l.doubleclick.net
0.0.0.0 www-googletagmanager.l.google.com
0.0.0.0 googleadapis.l.google.com
0.0.0.0 s0.2mdn.net
0.0.0.0 googleads.g.doubleclick.net
0.0.0.0 ad.doubleclick.net
0.0.0.0 files.adform.net
0.0.0.0 secure-ds.serving-sys.com
0.0.0.0 securepubads.g.doubleclick.net
0.0.0.0 s.youtube.com
0.0.0.0 apis.google.com
0.0.0.0 2975c.v.fwmrm.net
0.0.0.0 static.doubleclick.net
0.0.0.0 googleadservices.com
0.0.0.0 ad-g.doubleclick.net
0.0.0.0 ad.doubleclick.net
0.0.0.0 ad.mo.doubleclick.net
0.0.0.0 doubleclick.net
0.0.0.0 googleads.g.doubleclick.net
0.0.0.0 pagead.googlesyndication.com
0.0.0.0 pagead1.googlesyndication.com
0.0.0.0 pagead2.googlesyndication.com
0.0.0.0 www.googleadservices.com
0.0.0.0 youtube-nocookie.com
0.0.0.0 www.youtube-nocookie.com
0.0.0.0 analytic-google.com
0.0.0.0 www.analytic-google.com
0.0.0.0 www.googletagservices.com
0.0.0.0 fwmrm.net
0.0.0.0 innovid.com
0.0.0.0 2mdn.net
0.0.0.0 0.0.0.0
0.0.0.0 fwmrm.net
0.0.0.0 innovid.com
0.0.0.0 2mdn.net
0.0.0.0 akamaitechnologies.com
0.0.0.0 akamaiedge.net
0.0.0.0 ocsp.comodoca.com
# — Youtube Shit Block End

# MEU CUSTOM TERMINA AQUI

EOF

curl $webfile | sed -E '/[0-9]\s(local|broad|ip6|0\.0)/d' >> $tmpfile
sudo mv -v $tmpfile $finalfile
echo "StevenBlack hosts date: $(cat /etc/hosts | grep 'Date:' | sed 's/#\sDate:\s//')"

}
# =============================================================================

# list pacman and aur updates =================================================
list-updates(){
    pac=$(checkupdates | wc -l)
    aur=$($_aurmanager -Su --aur --quiet | wc -l)
    if [ -z "$aur" ]; then
        $aur = "0"
    fi
    echo "pacman: $pac aur: $aur"
}
# =============================================================================

# youtube-dl ==================================================================
ytmp3(){
    youtube-dl --extract-audio --audio-format mp3 --audio-quality 0 $@
}
# =============================================================================

# Surfraw =====================================================================
surfraw(){ /usr/bin/surfraw -browser=$BROWSER $@ ;}
sr(){ /usr/bin/sr -browser=$BROWSERCLI $@ ; }
# =============================================================================

# aur manager =================================================================
uu(){ $_aurmanager --noedit -Syu "$@";}
npac(){ $_aurmanager --noedit --noconfirm --needed -S "$@";}
pacs(){ $_aurmanager -Ss "$@";}
pacq(){
    if which ag >/dev/null 2>&1; then
        $_aurmanager -Q | ag "$@"
    else
        $_aurmanager -Q | grep "$@"
    fi
}
# =============================================================================

# Taskspooler ==================================================================
# https://youtu.be/WiP1OM7Kf10
tsp-ranger() { TS_SOCKET=/tmp/ranger tsp $@; }
tsp-w3m() { TS_SOCKET=/tmp/w3m tsp $@; }
tsp-torr() { TS_SOCKET=/tmp/torrent tsp $@; }

# ==============================================================================

ezthumb-movie (){
    ezthumb  --time-end "25%" "$@";
}

rsync-ssh () { rsync -avzh -e "ssh -p $1" $(realpath $2) $3@$4:$5;}

# Reload files ================================================================
rld-syncaf (){ $(which python3) $(realpath ~/.scripts/syncaf.py);}
rld-zshrc (){ source $(realpath ~/.zshrc);}
rld-zfunctions (){ source $(realpath $_dotfiles_path/data/zsh/functions.zsh) ;}
rld-font () { fc-cache -v -f;}
rld-tmux () { tmux source-file ~/.tmux.conf;}
rld-Xdefaults () { xrdb -load ~/.Xdefaults;}
# =============================================================================


# Screencast with ffmpeg ======================================================
# ffmpeg -i ARQUIVO.MP3 -acodec copy -ss 3.7  -t duration teste.mp3
sc-ffmpeg () {
    # https://youtu.be/386Z2yeQ5fo
    if [ ! -d "$HOME/workspace/screencast_videos" ]; then
        mkdir -p -v "$HOME/workspace/screencast_videos"
    fi
    builtin cd  "$HOME/workspace/screencast_videos"
    while [[ -f ./screencast$n.mkv ]]
    do
        n=$((n+1))
    done
    filename="screencast$n.mkv"
    ffmpeg -y \
        -f x11grab \
        -s $(xdpyinfo | grep dimensions | awk '{print $2;}') \
        -i :0.0 \
        -thread_queue_size 1024 \
        -f alsa -ar 44100 -i default \
        -c:v libx264 -r 30 -c:a flac $filename
}
# =============================================================================

#-------- Copy Move {{{
#------------------------------------------------------
cpr() {
	if [ $# -lt 1 ]; then
        echo -e "rsync copying files using task spooler queue"
        echo -e "\nUsage:\n$0 [-h help] [-t task-spooler] <source> <destination>"
        echo -e "\nInclude Parent Folder:\n$0 <source> <destination>"
        echo -e "\nExclude Parent Folder:\n$0 <source>/ <destination>"
        echo -e "\nRequirements: rsync task-spooler"
        return 1
	else
		case "$1" in
		  -t) tsp rsync -a "$@" ;;
		  -h) $0 ;;
		  -*) $0 ;;
		  *) rsync -avh --progress "$@" ;;
		esac
	fi
}
mvr() {
	if [ $# -lt 1 ]; then
        echo -e "rsync moving files using task spooler queue"
        echo -e "\nUsage:\n$0 [-h help] [-t task-spooler] <source> <destination>"
        echo -e "\nInclude Parent Folder:\n$0 <source> <destination>"
        echo -e "\nExclude Parent Folder:\n$0 <source>/ <destination>"
        echo -e "\nRequirements: rsync task-spooler"
        return 1
	else
		case "$1" in
		  -t) tsp rsync -a --remove-source-files "$@" ;;
		  -h) $0 ;;
		  -*) $0 ;;
		  *) rsync -avh --progress --remove-source-files "$@" ;;
		esac
	fi
}
# }}}
#
# sync windos-music mrcshd-music
music-sync-HD () {
    rsync -avh --progress --delete /media/win/Users/Marcus/Desktop/Media/Music /run/media/mrcsbrn/mrcshd/
}


lns () {
    if [ $# -lt 1 ]; then
        echo -e 'Short for "ln -s". Get full path from relative.'
        echo -e "\nUsage:\n$0 ./file_to_symlink.txt ~/.config/destination"
        return 1
    else
        rp=$(which realpath)
        ln -s $($rp "$1") $($rp "$2")
    fi
}

my-ip () {
	echo "--------------- Network Information ---------------"
	echo "router ip:" $(netstat -rn | awk 'FNR == 3 {print $2}')
	ip addr | awk '/global/ {print $1,$2}' | cut -d\/ -f1
	ip addr | awk '/global/ {print $3,$4}'
	ip addr | awk '/ether/ {print $1,$2}'
	ip addr | awk '/scope link/ {print $1,$2}' | cut -d\/ -f1
	ifconfig | awk '/inet addr/ {print $1,$2}' | awk -F: '{print $1,$2}'
	ifconfig | awk '/Bcast/ {print $3}' | awk -F: '{print $1,$2}'
	ifconfig | awk '/inet addr/ {print $4}' | awk -F: '{print $1,$2}'
	ifconfig | awk '/HWaddr/ {print $4,$5}'
	ifconfig | awk '/Scope:Link/ {print $1,$3}' | cut -d\/ -f1
	echo external ip: $(curl -s http://ipecho.net/plain)
	echo "---------------------------------------------------"
}

#-------- Wget (Retrieve Files From The Web) {{
##------------------------------------------------------
wget-extension() {
    if [ $# -lt 2 ]; then
        echo -e "Download all files with specific extension on a webpage"
        echo -e "\nUsage: $0 <file_extension> <url>"
        echo -e "\nExample:\n$0 mp4 http://example.com/files/"
        echo -e "$0 mp3,ogg,wma http://samples.com/files/"
        echo -e "\nGoogle: http://lmgtfy.com/?q=intitle%3Aindex.of+mp3+-html+-htm+-php+-asp+-txt+-pls+madonna"
        return 1
    fi

    outputdir_name=$(echo "$2" | rev | cut -d\/ -f2 | rev)
    mkdir -pv "$outputdir_name"
    cd "$outputdir_name" && wget -r -l1 -H -t1 -nd -N -np -A "$1" -erobots=off "$2"
}
# }}}

#-------- Transmission CLI v2 {{{
#------------------------------------------------------
# DEMO: http://www.youtube.com/watch?v=ee4XzWuapsE
# DESC: lightweight torrent client; interface from cli, webui, ncurses, and gui
# WEBUI:  http://localhost:9091/transmission/web/
# 	  http://192.168.1.xxx:9091/transmission/web/

tsm-clearcompleted() {
  transmission-remote -l | grep 100% | grep Done | \
  awk '{print $1}' | xargs -n 1 -I % transmission-remote -t % -r
}

# display numbers of ip being blocked by the blocklist (credit: smw from irc #transmission)
tsm-count() {
  echo "Blocklist rules:" $(curl -s --data \
  '{"method": "session-get"}' localhost:9091/transmission/rpc -H \
  "$(curl -s -D - localhost:9091/transmission/rpc | grep X-Transmission-Session-Id)" \
  | cut -d: -f 11 | cut -d, -f1)
}

# DEMO: http://www.youtube.com/watch?v=TyDX50_dC0M
# DESC: merge multiple ip blocklist into one
# LINK: https://github.com/gotbletu/shownotes/blob/master/blocklist.sh
tsm-blocklist() {
  echo "${Red}>>>Stopping Transmission Daemon ${Color_Off}"
    killall transmission-daemon
  echo "${Yellow}>>>Updating Blocklist ${Color_Off}"
    ~/.scripts/blocklist.sh
  echo "${Red}>>>Restarting Transmission Daemon ${Color_Off}"
    transmission-daemon
    sleep 3
  echo "${Green}>>>Numbers of IP Now Blocked ${Color_Off}"
    tsm-count
}
tsm-altdownloadspeed() { transmission-remote --downlimit "${@:-300}" ;}	# download default to 900K, else enter your own
tsm-altdownloadspeedunlimited() { transmission-remote --no-downlimit ;}
tsm-limitupload() { transmission-remote --uplimit "${@:-0}" ;}	# upload default to 10kpbs, else enter your own
tsm-limituploadunlimited() { transmission-remote --no-uplimit ;}
tsm-askmorepeers() { transmission-remote -t"$1" --reannounce ;}
tsm-daemon() { transmission-daemon ;}
tsm-quit() { killall transmission-daemon ;}
tsm-add() {
    if [ $# -lt 2 ]; then
        mpath=$(realpath ~/Downloads)
    else
        if [ ! -d "$2" ]; then
            echo "\"$2\" is not a valid directory"
            return 1
        fi
        mpath=$(realpath "$2")
    fi
    echo "Downloading to \"$mpath\""
    transmission-remote --add "$1" -w "$mpath"
}
tsm-hash() { transmission-remote --add "magnet:?xt=urn:btih:$1" ;}       # adding via hash info
tsm-verify() { transmission-remote --verify "$1" ;}
tsm-pause() { transmission-remote -t"$1" --stop ;}		# <id> or all
tsm-start() { transmission-remote -t"$1" --start ;}		# <id> or all
tsm-purge() { transmission-remote -t"$1" --remove-and-delete ;} # delete data also
tsm-remove() { transmission-remote -t"$1" --remove ;}		# leaves data alone
tsm-speed() { while true;do clear; transmission-remote -t"$1" -i | grep Speed;sleep 1;done ;}
tsm-grep() { transmission-remote --list | grep -i "$1" ;}
tsm() { transmission-remote --list ;}
tsm-show() { transmission-show "$1" ;}                          # show .torrent file information
_tsm-getid(){
    op=$(transmission-remote -l | grep 'Down' | wc -l)
    if  [ $op -eq 2 ] && [ $# -lt 1 ] ; then
        id=$(transmission-remote -l | grep 'Down' | grep -v -w 'Done' | awk '{print  $1}')
    else
        id="$@"
    fi
    echo "$id"
}
tsm-info(){
    id=$(_tsm-getid "$@")
    transmission-remote -t"$id" --info;
}

# DEMO: http://www.youtube.com/watch?v=hLz7ditUwY8
# LINK: https://github.com/fagga/transmission-remote-cli
# DESC: ncurses frontend to transmission-daemon
tsm-ncurse() { transmission-remote-cli ;}
