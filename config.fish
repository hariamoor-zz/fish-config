if test (which emacs)
    set -x EDITOR "emacsclient -t"
    set -x VISUAL "emacsclient -c -a emacs"
end

if test -d /usr/local/go
    # Set up Golang config, if installed
    # with binary
    set -x GOFLAGS "-mod=vendor"
    set -x GOROOT "/usr/local/go"
    set -x GOPATH (go env GOPATH)

    set -gx PATH $GOROOT/bin $GOPATH/bin $PATH
end

if test -d $HOME/.cargo
    # Set up Rust config, if installed
    # with Rustup, i.e. from Rustup script
    set -gx PATH $HOME/.cargo/bin $PATH
end

if test (uname -s) = Darwin
    # Ugly MacOS specific config
    set -gx PATH $HOME/Library/Python/3.7/bin $PATH
end
