#  ---------------------------------------------------------------------------
#
#  Description:  This file holds all my BASH configurations and aliases
#
#  Sections:
#  1.   Environment Configuration
#  2.   Make Terminal Better (remapping defaults and adding functionality)
#  3.   File and Folder Management
#  4.   Searching
#  5.   Process Management
#  6.   Networking
#  7.   System Operations & Information
#  8.   Web Development
#  9.   Tools
#
#  ---------------------------------------------------------------------------
#
#   -------------------------------
#   1.  ENVIRONMENT CONFIGURATION
#   -------------------------------
#
#   Bring in bashrc and .profile.  Becuase this is used cross machine, those 
#   places are where machine specific information can be found
#  ---------------------------------------------------------------------------
    
    [[ -r ~/.bashrc ]] && . ~/.bashrc
    [[ -r ~/.profile ]] && . ~/.profile

#   Set Paths
#   ------------------------------------------------------------
    
    if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi #add rbenv shims to the path
    export PATH=/usr/local/bin:$PATH #add homebrew packages to the path


#   Set Default Editor (change 'Nano' to the editor of your choice)
#   ------------------------------------------------------------
    export EDITOR=vim

#   Add this machines ssh key to the ssh-key manager
#   ------------------------------------------------------------
    ssh-add > /dev/null 2>&1

#   Set the lolcommits delay env var to 1 second, because I like wasting space 
#   in my configs on trivialities.
#   -----------------------------------------------------------

    export LOLCOMMITS_DELAY=2


#   -----------------------------
#   2.  MAKE TERMINAL BETTER
#   -----------------------------
    RED="\[\033[0;31m\]"
    YELLOW="\[\033[0;33m\]"
    GREEN="\[\033[0;32m\]"
    NO_COLOR="\[\033[0m\]"
    PURPLE="\e[0;35m"

    alias clear='clear && /usr/local/bin/fortune -a | cowsay -f stegosaurus' # add fortune and cowsay!
    alias cp='cp -i'                           # Preferred 'cp' implementation
    alias mv='mv -i'                           # Preferred 'mv' implementation
    alias mkdir='mkdir -pv'                    # Preferred 'mkdir' implementation
    alias ls='ls -AFGp'                        # Preferred 'ls' implementation
    alias less='less -Fc'                      # Preferred 'less' implementation
    cdd() { builtin cd "$@"; ls;  }            # 'cdd' can be used to cd and ls 
    alias cd..='cd ../'                        # Go back 1 directory level (for fast typers)
    alias ..='cd ../'                          # Go back 1 directory level
    alias ...='cd ../../'                      # Go back 2 directory levels
    alias .3='cd ../../../'                    # Go back 3 directory levels
    alias .4='cd ../../../../'                 # Go back 4 directory levels
    alias .5='cd ../../../../../'              # Go back 5 directory levels
    alias .6='cd ../../../../../../'           # Go back 6 directory levels
    alias f='open -a Finder ./'                # f:Opens current directory in MacOS Finder
    alias ~="cd ~"                             # ~:            Go Home
    alias c='clear'                            # c:            Clear terminal display
    mcd () { mkdir -p "$1" && cd "$1"; }       # mcd:          Makes new Dir and jumps inside   
    trash () { command mv "$@" ~/.Trash ; }    # trash:        Moves a file to the MacOS trash

    function parse_git_branch () {
      git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
    }

#   CDPATH -> put common directories here
#   -------------------------------------

    export CDPATH=.:~/Development


    # allow for git bash completion
    if [ -f `brew --prefix`/etc/bash_completion ]; then
       . `brew --prefix`/etc/bash_completion
    fi

    /usr/local/bin/fortune -a | cowsay -f stegosaurus

    function git_color {
      local git_status="$(git status 2> /dev/null)"

      if [[ ! $git_status =~ "working directory clean" ]]; then
        echo -e $RED
      elif [[ $git_status =~ "Your branch is ahead of" ]]; then
        echo -e $YELLOW
      elif [[ $git_status =~ "nothing to commit" ]]; then
        echo -e $GREEN
      else
        echo -e $PURPLE
      fi
    }

    PS1="$PURPLE\u@\h$NO_COLOR:\w$(git_color)\$(parse_git_branch)\$$NO_COLOR \n ᗧ ○ ○ "



    #   Things specific to my typical personal setup
    #   -----------------------------------------------

        alias ber='bundle exec rake'
        alias bundo='bundle exec'
        alias dev='cd ~/Development/'
        export CDPATH='.:~/Development/'

#   Convenience Commands -> Specific to my preferred setup
#   ------------------------------------------------------

    alias dev='cd ~/Development'
    alias ber='bundle exec rake'
    alias bundo='bundle exec'

#   lr:  Full Recursive Directory Listing
#   ------------------------------------------
    alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'

#   mans:   Search manpage given in agument '1' for term given in argument '2' (case insensitive)
#           displays paginated result with colored search terms and two lines surrounding each hit.             Example: mans mplayer codec
#   --------------------------------------------------------------------
    mans () {
        man $1 | grep -iC2 --color=always $2 | less
    }

#   showa: to remind yourself of an alias (given some part of it)
#   ------------------------------------------------------------
    showa () { /usr/bin/grep --color=always -i -a1 $@ ~/Library/init/bash/aliases.bash | grep -v '^\s*$' | less -FSRXc ; }

#   -------------------------------
#   3.  FILE AND FOLDER MANAGEMENT
#   -------------------------------

    zipf () { zip -r "$1".zip "$1" ; }          # zipf:         To create a ZIP archive of a folder

#   extract:  Extract most know archives with one command
#   ---------------------------------------------------------
    extract () {
        if [ -f $1 ] ; then
          case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar e $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)     echo "'$1' cannot be extracted via extract()" ;;
          esac
         else
             echo "'$1' is not a valid file"
         fi
    }

#   ---------------------------
#   4.  SEARCHING
#   ---------------------------

    
#   ---------------------------
#   5.  PROCESS MANAGEMENT
#   ---------------------------

#   memHogsTop, memHogsPs:  Find memory hogs    
#   -------------------------------------------------HogsTop='top -l 1 -o rsize | head -20'
    alias memHogsPs='ps wwaxm -o pid,stat,vsize,rss,time,command | head -10'

#   cpuHogs:  Find CPU hogs
#   -----------------------------------------------------
    alias cpu_hogs='ps wwaxr -o pid,stat,%cpu,time,command | head -10'

#   topForever:  Continual 'top' listing (every 10 seconds)
#   -----------------------------------------------------
    alias topForever='top -l 9999999 -s 10 -o cpu'

#   ttop:  Recommended 'top' invocation to minimize resources
#   ------------------------------------------------------------
#       Taken from this macosxhints article
#       http://www.macosxhints.com/article.php?story=20060816123853639
#   ------------------------------------------------------------
    alias ttop="top -R -F -s 10 -o rsize"

#   my_ps: List processes owned by my user:
#   ------------------------------------------------------------
    my_ps() { ps $@ -u $USER -o pid,%cpu,%mem,start,time,bsdtime,command ; }
    

#   ---------------------------
#   6.  NETWORKING
#   ---------------------------

    alias myip='curl ip.appspot.com'                    # myip:         Public facing IP Address
    alias lsock='sudo /usr/sbin/lsof -i -P'             # lsock:        Display open sockets
    alias lsockU='sudo /usr/sbin/lsof -nP | grep UDP'   # lsockU:       Display only open UDP sockets
    alias lsockT='sudo /usr/sbin/lsof -nP | grep TCP'   # lsockT:       Display only open TCP sockets
   

#   ---------------------------------------
#   7.  SYSTEMS OPERATIONS & INFORMATION
#   ---------------------------------------

#   cleanupDS:  Recursively delete .DS_Store files
#   -------------------------------------------------------------------
    alias cleanupDS="find . -type f -name '*.DS_Store' -ls -delete"

#   finderShowHidden:   Show hidden files in Finder
#   finderHideHidden:   Hide hidden files in Finder
#   -------------------------------------------------------------------
    alias finderShowHidden='defaults write com.apple.finder ShowAllFiles TRUE'
    alias finderHideHidden='defaults write com.apple.finder ShowAllFiles FALSE'

#   cleanupLS:  Clean up LaunchServices to remove duplicates in the "Open With" menu
#   -----------------------------------------------------------------------------------
    alias cleanupLS="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"

#    screensaverDesktop: Run a screensaver on the Desktop
#   -----------------------------------------------------------------------------------
    alias screensaverDesktop='/System/Library/Frameworks/ScreenSaver.framework/Resources/ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine -background'

#   ---------------------------------------
#   8.  WEB DEVELOPMENT
#   ---------------------------------------


#   ---------------------------------------
#   9.  TOOLS
#   ---------------------------------------


#   Number conversions
#   ---------------------------------------

    from_hex() {
      echo "$((0x$1))"
    }
    
    to_hex() {
      printf '%x\n' "$1"
    }

    from_binary() {
      echo "$((2#$1))"
    }

    to_binary() {
      ruby -e "puts $1.to_s(2)"
    }


