# hook

Reel in your crazy wild fish configurations into this community supported fish script system.

### Installation

Clone this repo somewhere. A good place to put it might be in `~/config/fish/hook`.

```
⇒  git clone https://github.com/hornairs/hook ~/config/fish/hook
```

-----

Then, source the `hook.fish` file from the root of the repo. The relevant line of fish script is:

```fish
. path/to/hook/hook.fish
```

One liner:

```
⇒  echo `. ~/config/fish/hook/hook.fish` >> ~/config/fish/config.fish
```

-----

Next, Enable the hooks you want to use! Do this by calling the `fish_hook_enable` function with the name of the hooks you which to enable in your `config.fish`:

```fish
fish_hook_enable rake rbenv autojump
```

To see the list of all available hooks, use the `fish_hook_list_available_hooks` function in a fish shell with hook installed:

```
⇒  fish_hook_list_available_hooks
rake
rbenv
autojump
...
```

A one liner to enable all hooks:

```
echo `fish_hook_enable (fish_hook_list_available_hooks)` >> ~/config/fish/config.fish
```


### Adding new hooks

A hook is just a folder in the root of the `hook` project with a `functions` folder and or a `completions` folder, which follow the same conventions as the `functions` and `completions` folder of a vanilla fish setup. That is, files in `functions` should define one function with exactly the same name as the file itself, and files in the `completions` folder should call `complete` a bunch of times for the command with the exact same name as the file.

To get me to add a hook, just make a pull request :)


### How it works

`hook` just adds your hook's `functions` and `completions` folder to fish's handy `$fish_functions_path` and `$fish_completions_path` special path variables. Easy peasy lemon squeazy.

### Included hooks

#### autojump

Adds the `j` function and completions which the `autojump` library adds stuff for for both zsh and bash, but not for fish. Also hooks in to watch what directories you cd into and update autojump's database.

#### brew

Automatically includes homebrew's included fish completions if they exist.

#### debugging

Right now, just adds an err_echo function, which echos to stderr. Handy for debugging fish scripts and completions.

#### git

Adds in a slimmer, less correct version of the `__git_ps1` function included in git's built in bash completions.

#### ln

Adds completions for the dastardly hard-to-remember `ln` syntax.

#### rake

Adds completions for the available rake tasks in a particular directory. It figures out these tasks by running `rake -T` and then caches them. To update the cache run `clean_rake_cache`.

#### rbenv

Adds completions and path shims for rbenv, which unfortunately doesn't spit out a handy init script for fish.
