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
        string match "*$GOROOT/bin*" $PATH
        or string match "*$GOPATH/bin*" $PATH
    end
    or begin
        set -gx PATH $GOROOT/bin $GOPATH/bin $PATH
    end
end

if test -d $HOME/.cargo
    begin
        string match "*$HOME/.cargo/bin*" $PATH
    end
    or begin
        # Set up Rust config, if installed
        # with Rustup, i.e. from Rustup script
        set -gx PATH $HOME/.cargo/bin $PATH
    end
end

if test (uname -s) = Darwin
    # Ugly MacOS specific config
    set -gx PATH $HOME/Library/Python/3.7/bin $PATH
end
