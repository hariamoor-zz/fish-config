bind -M emacs
bind \cH backward-kill-word

if test (which emacs)
    set -x EDITOR "emacsclient -t"
    set -x VISUAL "emacsclient -c -a emacs"
end

if test (which firefox)
    set -x BROWSER (which firefox)
end

if test -d /usr/local/go
    # Set up Golang config, if installed
    # with binary
    set -x GOFLAGS "-mod=vendor"
    set -x GOROOT "/usr/local/go"
    set -x GOPATH (go env GOPATH)

    begin
        contains "$GOROOT/bin" $PATH
        or contains "$GOPATH/bin" $PATH
    end
    or begin
        set -gx PATH $GOROOT/bin $GOPATH/bin $PATH
    end
end

if test -d $HOME/.cargo
    # Simply source stuff into your env
    source $HOME/.cargo/env
end

if test (uname -s) = Darwin
    # Ugly MacOS specific config
    set -gx PATH $HOME/Library/Python/3.7/bin $PATH
end

# Set up auxillary files (presently only vterm config)
if test (uname -s) = Linux
    source ~/.config/fish/vterm.fish
end
