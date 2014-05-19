# fish-modules

A small fish script for managing Git-based modules. An introduction on why and how can be found in the link [Fish shell - using modules to import functions](http://blog.deigote.com/2014/05/19/fish-shell-using-modules-to-import-functions).

### Getting fish-modules

First step for using fish-modules is to clone the project. The destination is irrelevant, but I find convenient to add it as a submodule of my Git fish configuration project. To do so:

    cd $HOME/.config/fish
    git submodule add git@github.com:deigote/fish-modules.git fish-modules
    git ci fish-modules .gitmodules -m 'Added fish-modules as a submodule for convenience'
    
### Creating a fish module

Creating a module is as easy as creating a git repository with a functions directory (and, optionally, its analogue completions directory) in where functions are defined in a one-per-file basis (same as default fish functions directory). An example of a fish module is [the GitHub Issues Flow module](https://github.com/deigote/gh-issues-flow).

### Using existing modules in your fish shell

  - Create a file in fish home (defaults to $HOME/.config/fish) called **modules_config.fish** and add each module configuration with the format *module <git_repository_url> <relative_path> [<branch>]*.  The branch is optional and defaults to master. An example of a possible modules config file is:

    module "git@github.com:deigote/fish-common.git" fish-common
    module "git@github.com:deigote/gh-issues-flow.git" gh-issues-flow

  - Then init or update the modules with the following command (adjust the fish-modules path to where you installed it if necessary):

    ~/.config/fish/fish-modules/update_modules.fish
    
 - Add the following line to your config.fish file (which by default can be found in $HOME/.config/fish/config.fish):

    # Fish modules
    source $HOME/.config/fish/fish-modules/add_modules_to_path.fish
    
