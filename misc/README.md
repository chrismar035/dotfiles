# Misc

This directory contains various utility scripts and other files that don't belong elsewhere.

## colors.sh

A 24-bit color (truecolor) test scripts for your terminal. Sourced from
[the delta docs](https://github.com/dandavison/delta#24-bit-color-truecolor).
If you do not see smooth color gradients, see the discussion at 
[tmux#696](https://github.com/tmux/tmux/issues/696). The short version is you
need something like this in your `~/.tmux.conf`:
```
set -ga terminal-overrides ",xterm-256color:Tc"
```
and you may then  need to quit tmux completely for it to take effect.
