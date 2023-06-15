# shell.d

## Quick Start

```bash
cd $HOME
git clone git@github.com:fatehks/shell.d.git .shell.d
ln -s .shell.d/bash_profile .bash_profile

# add customizations (see "Customizing For Your Environment")
```


## Customizing For Your Environment

```bash
cd $HOME/.shell.d
ls available/
### symlink what you need, for example, to enable the k8s.bash file
ln -s available/k8s.bash
```

## Why Do It This Way?

I like to keep things simple.  I tried bash-it, and a couple other
ways to manage my shell customizations, but, it almost always followed
the pattern, like this

1. create a file with the customizations, for example, k8s or java
2. edit `.bash_profile` and add a line in there to source the new
   customizations
3. restart bash

A side benefit of managing my customizations this way is that I can
profile the customizations and optimize them for quick startup.  Take
a look at the bash_profile `timeload` function that uses the internal
Bash variable for timing the loads.  You will notice a few of my
customizations contain statements that render the bash completion code
into a file rather than sourcing from a command line.  This is the
result of profiling those command line "inline" sourcing versus
sourcing a file that has the completion code saved into it.

## Contributing

Fork this repo, create a branch in your forked repo, make changes, and
submit a Pull Request.

## License

This repository is licensed under BSD 2-Clause License - see
[`LICENSE`](LICENSE) for more details.
