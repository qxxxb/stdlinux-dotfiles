# stdlinux dotfiles guide

This guide describes a simple way to get a fairly usable setup on the stdlinux
servers at OSU, using SSH without X11 forwarding (i.e. without a graphical
interface).

## shell

The first thing I want to change is the command prompt. The default command
prompt looks something like this:
```
[jeng.28@cse-std9 lab1]$
```

I don't like how it doesn't show full path (i.e. `~/Programs/cse-2421/lab1`
instead of `lab1`). I also prefer to have plenty of colors and other information
in my command prompt.

By default, the shell used on stdlinux is bash. I prefer zsh because it's
similar to bash, but has a ton of extra features, including better support for
creating fancy command prompts.

It turns out zsh is already installed on stdlinux, so you can start using it
simply by invoking the `zsh` command. You will be greeted by the following
screen:

```
This is the Z Shell configuration function for new users,
zsh-newuser-install.
You are seeing this message because you have no zsh startup files
(the files .zshenv, .zprofile, .zshrc, .zlogin in the directory
~).  This function can help you with a few settings that should
make your use of the shell easier.

This is the Z Shell configuration function for new users,
zsh-newuser-install.
You are seeing this message because you have no zsh startup files
(the files .zshenv, .zprofile, .zshrc, .zlogin in the directory
~).  This function can help you with a few settings that should
make your use of the shell easier.

You can:

(q)  Quit and do nothing.  The function will be run again next time.

(0)  Exit, creating the file ~/.zshrc containing just a comment.
     That will prevent this function being run again.

(1)  Continue to the main menu.

--- Type one of the keys in parentheses ---
```

For now, I suggest just pressing `q`. If you press `1`, you can configure some
zsh settings interactively, but you will probably end up changing those later
anyway.

After passing through the greeting, this is the prompt that I get:
```
[\u@\h \W]\$
```

Unfortunately this is not much of an improvement from bash. Luckily, zsh does
come with some nice prompts by default which you can try out.

To load the prompt theme system, run:
```zsh
autoload -U promptinit
promptinit
```

To list the available prompts, run:
```zsh
prompt -l
```

To use the `adam2` theme for example, run:
```zsh
prompt adam2
```

This particular prompt is pretty fancy and even has another prompt on the right.
To set it permanently, create a file `~/.zshrc` with the following contents:
```zsh
autoload -U promptinit
promptinit
prompt adam2
```

Now, if you run `exit` and then `zsh`, you can see that the `adam2` prompt is
automatically loaded.

Finally, to set `zsh` instead of `bash` by default, create a file `~/.profile`
with the following contents:
```sh
export SHELL=/bin/zsh
exec /bin/zsh -l
```

Usually you would use the `chsh` command to change shells, but since we don't
have root access, we have to use the workaround with `~/.profile`.

Note: since zsh is quite popular, there are lot of nice tools for further
improving your zsh environment, such as [oh my zsh](https://ohmyz.sh/) and
[zplug](https://github.com/zplug/zplug).

## editor

The next step for transitioning to a terminal-only SSH session is to learn a
editor that works on the command-line. I suggest Vim.

## multiplexer

According to the tmux wiki:

> tmux is a terminal multiplexer. It lets you switch easily between several
> programs in one terminal, detach them (they keep running in the background)
> and reattach them to a different terminal. And do a lot more.

Basically, it allows you to multi-task over one SSH connection. For example, you
can have one tmux pane running an editor, another pane compiling stuff, and
another pane with some man pages open.

tmux is already installed on stdlinux, so can run it with `tmux`. This will give
you a clean window, with a status bar on the bottom. You should be able to enter
shell commands as usual into the active window.

To create two side-by-side panes, you can hit `Ctrl-B %` (press `Ctrl-B`,
release, then enter `%`). To switch between the panes, use `Ctrl-B o`. More
information can be found with `man tmux` and online.

To exit a tmux pane or window, use the `exit` command.

---

At this point you should have a fairly usable setup. If you want to further
tweak your setup, you can start customizing configuration files such as
`~/.zshrc`, `~/.vimrc`, and `~/.tmux.conf`. You can find examples online and
also in this repository.
