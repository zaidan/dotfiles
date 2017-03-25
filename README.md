# dotfiles
This is a collection of my configuration files.

## Install

* Install [rcm](https://github.com/thoughtbot/rcm)
* Clone this repository to `~/dotfiles`
* Run:
```shell
$ env RCRC=$HOME/dotfiles-local/rcrc rcup
```

## Update

Run:

```shell
$ rcup
```

## Local dotfiles (optionally)
Clone or create your `dotfiles-local` repository to `~/dotfiles-local`.  You
can use this repository for your custom dotfiles, that are more general - e.g.
not bound to a single device or user account. If you want to share some
dotfiles, place them here.

See [zaidan/dotfiles-local](https://github.com/zaidan/dotfiles-local) for an example.

## Private dotfiles (optionally)
Clone or create your `dotfiles-private` repository to `~/dotfiles-private`.
You can use this repository to maintain your private stuff that is more
general.

## Private local dotfiles (optionally)
Clone or create your `dotfiles-private-local` repository to
`~/dotfiles-private-local`.  You can use this repository to maintain your
private stuff that is bound to a single device or user account.

## X11 dotfiles (optionally)
Clone or create your `dotfiles-x11` repository to
`~/dotfiles-x11`.  You can use this repository to maintain your
X11 config files.

## Create your own RCRC
In some cases you need a custom `rcrc` file (e.g. to add more dotfiles
repositories).  You can place your custom `rcrc` to one of your dotfiles
repositories and run this command with the path to `YOUR-CUSTOM-REPOSITORY`:

```shell
$ env RCRC=$HOME/YOUR-CUSTOM-REPOSITORY/rcrc rcup
```

This will symlink your `rcrc` file to `~/.rcrc`. Make sure you have added
`YOUR-CUSTOM-REPOSITORY` to the beginning of `DOTFILES_DIRS`. Otherwise your
symlink will be replaced with a link to `~/dotfiles/rcrc`.

## License

See `LICENSE` file.
