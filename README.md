+++
date = '2024-05-15T10:00:00-05:00'
draft = false
title = 'My Dotfiles Setup: A Simple and Powerful Way to Manage Your Shell'
+++

# My Dotfiles Setup: A Simple and Powerful Way to Manage Your Shell

Over many years of working on the command line, I've tried numerous ways to manage my shell environment. I've used frameworks like `bash-it`, and I've tried keeping everything in a single `.bash_profile`. Each approach had its own set of trade-offs. Frameworks were often too bloated for my taste, and a single file became unwieldy.

This article describes the simple, modular, and powerful system I've developed to manage my shell configuration. It's a system that has evolved to meet my needs, and I hope it can be a useful starting point for you to build your own perfect shell environment.

My requirements are simple:

-   Easy to read and understand
-   Easy to set up on any Linux environment
-   A straightforward method for adding or modifying configurations
-   Primary shell is `bash`, because it's ubiquitous.

## Why Do It This Way?

The core idea is to break down shell customizations into self-contained files. Instead of having one massive `.bash_profile`, I have a directory of small, focused configuration files for different tools like `git`, `k8s`, `java`, etc.

This approach has several advantages:

1.  **Simplicity and Organization:** It's much easier to find and edit a specific setting when your configurations are organized by topic.
2.  **Modularity:** You can easily enable or disable a set of configurations by creating or removing a symbolic link. This makes it trivial to tailor your shell for different machines or projects.
3.  **Performance:** By breaking up the configuration, you can profile the load time of each file and optimize your shell's startup speed. The `timeload` function in my `bash_profile` is a testament to this. I've found that for some tools, pre-rendering bash completion code into a file is faster than sourcing it from a command-line tool on every shell startup.
4.  **Portability:** Your entire shell setup is in a single Git repository, making it easy to clone and set up on a new machine.

## Quick Start

Here’s how you can get up and running with this system. I recommend forking my repository so you can customize it to your heart's content.

1.  **Clone your forked repository**

    We'll clone the repository into a hidden directory in your home folder called `.shell.d`.

    ```bash
    cd $HOME
    git clone git@github.com:<your-username>/shell.d.git .shell.d
    ```

2.  **Back up your existing `.bash_profile`**

    It's always a good idea to make a backup of your existing configuration.

    ```bash
    mv .bash_profile .bash_profile.BAK
    ```

3.  **Activate your new configuration**

    Create a symbolic link from the repository's `bash_profile` to your home directory. This makes `.bash_profile` a gateway to your new modular setup.

    ```bash
    ln -s .shell.d/bash_profile .bash_profile
    ```

4.  **Add local customizations**

    The `local.bash` file is for machine-specific settings. For example, you might set environment variables with secrets that you don't want to check into Git. The `.shell.d/bash_profile` will automatically source this file if it exists.

    ```bash
    edit .shell.d/local.bash
    ```

    Start with the bare minimum here to bootstrap the rest of your customizations.

## Customizing Your Environment

Now for the fun part: tailoring the shell to your needs.

The `.shell.d/available` directory contains all the possible configurations you can enable. To enable a configuration, you create a symbolic link to it in the `.shell.d/enabled` directory. The `bash_profile` will source all the files in the `enabled` directory.

For example, to enable the Kubernetes (`k8s`) configuration:

```bash
cd $HOME/.shell.d
ln -s available/k8s.bash enabled/k8s.bash
```

To disable it, you would simply remove the symbolic link:

```bash
rm .shell.d/enabled/k8s.bash
```

This makes it incredibly easy to turn configurations on and off without having to edit any files.

## Extending Your Environment

The true power of this system comes from how easy it is to add your own customizations. If you find a tool or workflow that isn't covered in the `available` directory, you can create a new file with your desired configuration.

When creating your own files, keep these principles in mind:

*   **Keep it modular:** Each file should be self-contained and focus on a single tool or concept. For example, a `java.bash` file should contain only Java-related aliases and functions.
*   **Keep it simple:** Write your shell code to be as clear and understandable as possible. This will make it easier to maintain in the future.
*   **Keep it fast:** Your shell's startup time is precious. Use the `timeload` function in the `bash_profile` to measure how long your new file takes to load and optimize it if necessary.

Once you've created your new file in the `available` directory, you can enable it by creating a symbolic link, just as you did in the "Customizing Your Environment" section. For example, to add a new set of aliases for Python, you would create a new file, add your aliases, and then enable it:

```bash
# 1. Create the new file
touch .shell.d/available/python.bash

# 2. Add your aliases and functions to the file...

# 3. Enable it by creating a symlink
cd $HOME/.shell.d
ln -s available/python.bash enabled/python.bash
```

That's all it takes to extend your shell with new functionality.

## Conclusion

This modular approach to managing a shell environment has served me well. It's simple, organized, and makes it easy to manage configurations across multiple machines. By keeping configurations in self-contained files, you can easily add, remove, and profile them.

I encourage you to take this setup and make it your own. Fork the repository, add your own configurations, and build the shell environment that works for you. Happy scripting!
