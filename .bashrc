



# If not running interactively, don't do anything
[ -z "$PS1" ] && return

export HISTCONTROL=ignoredups:erasedups
export JAVA_HOME=/usr/lib/jvm/jdk1.8.0_221




shopt -s histappend


unset color_prompt force_color_prompt


if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'

    # on physical TTY, change dark blue to lighter
    tty | grep /dev/tty/ -q && LS_COLORS+="di=0;44"

    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi


alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'


        . /etc/bash_completion



export HISTFILESIZE=50000
export HISTSIZE=50000
GPG_TTY=`tty`
export GPG_TTY



alias grep="grep --color -D skip"
alias wget_null="wget -O /dev/null --no-check-certificate"
alias cal='ncal -M -3 -b'
function dt { dig +nodnssec +trace -4  @8.8.8.8  $@; }
alias s=ssh
function p { ping -n $@; }


=() {
    local calc=$(echo "$@" | sed "s/,/./g" ) 
        echo -ne "$calc\n quit" | gcalccmd | sed 's:^> ::g'
        #echo  "scale=10;$calc"|bc -l; 
}

#   31..36
NUM_UNIQUE=$(( 31 + $(stat -c %Y /etc/hostname ) % 6 ))

prompt_command () {
    local rts=$?
    local w=$(echo "${PWD/#$HOME/\~}" | sed 's@.*/\(.*/.*/.*/.*\)$@< \1@') 
    # pwd max length L, prefix shortened pwd with m
    local L=30 m='<'
    [ ${#w} -gt $L ] && { local n=$((${#w} - $L + ${#m}))
    local w="${m}${w:$n}" ; }  ||   local w="${w}"
    # different colors for different return status
    [ $rts -eq 0 ] && PS1='\[\e[1;'$NUM_UNIQUE'm\]\u@\h ['${w}']\$\[\e[0m\] '
}

if [ $SHLVL -lt 2 ]
then    PROMPT_COMMAND=prompt_command
fi

if echo $TERM | grep ^screen -q
then
    PS1='\[\033k\033\\\]'$PS1
fi





unset HTTP_PROXY
unset command_not_found_handle
export VISUAL=vi
export EDITOR=vi




function view_crt() {
    openssl x509 -noout -text -in $1 | less
}


strip_comments() {
if [[ -f "$1" ]]
then    cat "$1"
else cat
fi  | /bin/grep -v '^\s*#' | /bin/grep -vP '^\s*$'
}


#if [[ -z $MC_TMPDIR ]]; then
bind 'Control-o: menu-complete'
bind 'Control-p: menu-complete-backward'
#fi

bind 'set show-all-if-ambiguous on'
bind 'set show-all-if-unmodified on'
bind 'set menu-complete-display-prefix on'
#bind 'set completion-prefix-display-length 2'
bind 'set colored-stats on'
bind 'set page-completions off'
bind 'set skip-completed-text on'
bind 'Control-h: complete-hostname'
bind "set enable-bracketed-paste off"


paste_my_cat() {
    F=` mktemp ` ;
    cat > $F
    echo;
    cat $F | nc termbin.com 9999 ;
    echo ;
    rm $F;
}

paste_my_vim() {
    F=` mktemp ` ;
    vim $F;
    echo;
    cat $F | nc termbin.com 9999 ;
    echo ;
    rm $F;
}


alias rs=reset


function toplargefiles {
    du -am ${1:-/var} | sort -n -r | head -n 20
}



findf() { find "${@:-.}" -type f  | sort ; }




alias dhclient_fake=fake_dhclient

fake_dhclient() {
local iface=$1

ip li set dev $iface up

sudo nmap --script broadcast-dhcp-discover -e $iface
}

alias cx="chmod +x"

alias jf='journalctl -f'

function systemctl() {
    case $1 in
        edit)   /bin/systemctl "$@"    ;;
        *)    /bin/systemctl -l --no-pager $@   ;;
    esac
}



