## FTAG - FZF Tagging TUI

### Preview
![ftag preview](https://lmburns.com/gallery/media/large/ftag.png)

### Usage

Parameters requiring arguments can be used with an equals sign (e.g., `--path=`).

```sh
FLAGS:
        -C, --color <color>      Specify list of colors to use (use -C ls|list to list colors)
        -N, --nofzf              No fzf, however not a wrapper
        -T, --lolcat             Color the header with lolcat
        -W, --wrapper <cmds>     No fzf, but is a wrapper and can use tag commands
        -b, --boxes              Add a box around header with boxes
        -c, --config <conf>      Specify configuration file
        -d, --dump               Dump configuration (mappings, actions, keyfile). Optional parameter of p|pager (no hyphen) to view in pager
        -f, --font <font>        Use custom font with figlet (some are provided)
        -h, --help               Display this help message
        -j, --jump               Use autojump to select directory to use tags (only shows tagged files)
        -l, --local              Use tag in a local directory
        -n, --nocolor            Don't use colored output
        -p, --path <path>        Enter a path for ftag to start
        -q, --query <query>      Start fzf with a query
        -s, --sort               Sort desc with d|desc|++, sort ascending with a|asc|+
        -t, --toilet             Color and format the header with toilet
        -v, --verbose            Display verbosity (-vvv is max; only used with wrapper as of now)
        -w, --wutag              Also tag files with wutag (-ww only uses wutag)
        -x, --xtrace             Most useful with wrapper
        -z, --zoxide             Use zoxide to select directory to use tags (only shows tagged files)
         - If a tag is searched for, it must be last and it must be exact (-q for fuzzy matching)
         - Figlet is ran if toilet isn't specified and vice-versa
         - The default printing (no flags specified and figlet installed) looks the nicest
         - Parameters requiring arguments can be used with an equal sign (e.g., --path=)
```

### Keybindings within `ftag`
```sh
INSIDE FZF:
        ?       Show key help message  ACTION_HELP
        A       Add/append tags  ACTION_ADD
        C-b     If git-dir, open dotbare to select action  ACTION_DOTBARE
        C-d     Open directory in dua interactive mode  ACTION_DUA
        C-e     Edit a gpg-encrypted file  ACTION_GPG_EDIT
        C-f     If git-dir, open forgit to select action  ACTION_FORGIT
        C-g     Encrypt or decrypt a file with gpg. If encryped, decrypted and vice versa  ACTION_GPG
        C-o     Open directory in finder  ACTION_FINDER
        C-p     Switch to custom path  ACTION_PATH
        C-r     Open directory with rg in an interactive mode  ACTION_RIPGREP
        C-s     Switch directories using dirstack  ACTION_DIRSTACK
        C-t     Open directory in twf to edit file  ACTION_TWF_EDIT
        C-v     Toggle a TUI program to view file  ACTION_EXTERNALVIEW
        C-w     Open directory with glow if dir contains markdown files  ACTION_GLOW
        C-y     Copy file or directory name  ACTION_COPY
        D       Delete/remove tags  ACTION_REMOVE
        E       Edit selected tags with $EDITOR  ACTION_EDIT
        F       Open directory with file manager in which tagged file resides  ACTION_FILEMANAGER
        G       Switch to global mode (i.e., default mode/all tags on filesystem)  ACTION_GLOBAL
        I       Open gitui/lazygit if directory is a git-dir  ACTION_GIT
        J       Switch to autojump query to select path to list tags  ACTION_AUTOJUMP
        L       Switch to local mode (i.e., current directory)  ACTION_LOCAL
        M-c     Copy/move/rsync/rclone/backup file or directory  ACTION_COPY_FILE
        M-d     Be prompted to delete file  ACTION_DELETE
        M-f     Use ffsend to upload file(s)  ACTION_FFSEND
        M-i     View director(y|ies) stats with tokei  ACTION_TOKEI
        M-p     Open a popup window to copy file with dragon  ACTION_DRAGON_SOURCE
        M-s     View directory size in dust  ACTION_DUST
        M-t     Open directory in vitag to edit tags  ACTION_VITAG
        M-w     Prompted with what to open file/dir with  ACTION_OPEN_WITH
        O       Open file in external program based on extension  ACTION_OPEN
        P       Toggle preview of file or directory  ACTION_PREVIEW
        Q       Quit ftag  ACTION_QUIT
        R       Reload the tag search  ACTION_RELOAD
        S       Set tags (overwrites)  ACTION_SET
        U       Show tag usage  ACTION_USAGE
        V       Toggle bat to view file  ACTION_VIEW
        Z       Switch to zoxide query to select path to list tags  ACTION_ZOXIDE
```

### Environment Variables and `zstyle`

The following settings can be specified using environment variables, `zstyle`, or a configuration file located at `$XDG_CONFIG_HOME/ftag/config.ini`. An example configuration file that has all available settings can be generated using `-g` or `--genconfig`. The order of precedence in which the configuration can be specified are:

1. The key-file specified with `zstyle ":ftag:" key-file <location>` or the variable `FTAG_KEYFILE`
2. All `zstyle` specifications
3. Environment variables

#### `FTAG_PAGER`
Pager to be used throughout the script. The default is either `bat --paging=always -f` or `less`. (It works best with `bat` installed.)

```sh
zstyle ":ftag:" pager <cmd>
```

#### `FTAG_COPY`
The copy command that is used to copy the path of the file to the clipboard. Since, as least for right now this is only applicable to `macOS`, this shouldn't be too much of a concern. The default is `pbcopy`; however, it still can be set to `xclip -sel primary` or `xsel -p`.

```sh
zstyle ":ftag:" copy-cmd <cmd>
```

#### `FTAG_FILEMANAGER`
The file-manager to open the directory where the file resides using `F` within `fzf`. The defaults are set to `lf`, falling back to `ranger`, falling back to `xplr`. There are plans to add all the file managers so it will choose the first one it comes across.

```sh
zstyle ":ftag:" file-manager <cmd>
```

#### `FTAG_COLORS`
A list of no more than 3 colors to be used in coloring `ftag`'s output. The first color specifies the tags, the second specifies the tag  separator, and the third specifies the color of the shortened `%DIR_MAP` array.

```sh
zstyle ":ftag:" colors <colors>
```

#### `FTAG_KEYFILE`
File of keybinding configuration (`-g`|`--genconfig` will generate an example at `$XDG_CONFIG_HOME/ftag/config.ini`)

```sh
zstyle ":ftag:" key-file <file_path>
```

#### `FTAG_NERDFONT`
Set to `1` if your terminal supports Nerd Font symbols, or `0` if not. The same can be done in the configuration file under the section `nerd_font`, as well as using the `zstyle` below.

```sh
zstyle ":ftag:" nerd_font <1|0>
```

#### `FTAG_DIR_MAP`
An array containing maps to directories for `ftag` to shorten. There are already several that are set. An array can be set in the format of:

```sh
"$HOME/.config/zsh"     %ZDOTDIR
"$HOME/.config"         %XDG_CONFIG_HOME
"$HOME/.cache"          %XDG_CACHE_HOME
"$HOME/.local/share"    %XDG_DATA_HOME
"$HOME/bin"             %XDG_BIN_HOME
```

There is no `zstyle` setting here. It can be specified in the key-file.

#### `FTAG_FILE_PREV`
The command to preview files with using `fzf`. The default is `bat --style=numbers --color=always`. There is no need to add empty brackets `{}` for `fzf`, it is added after the command is specified.

```sh
zstyle ":ftag:" fzf-file-preview <prev_cmd>
```

#### `FTAG_DIR_PREV`
The command to preview directories with using `fzf`. The default is `exa -TL 3 --color=always --icons` and falls back to using `tree -L 3`.

```sh
zstyle ":ftag:" fzf-dir-preview <prev_cmd>
```

#### `FTAG_MODIFIER`
The modifier to bind keys with in `fzf`. The default is `ctrl`.

```sh
zstyle ":ftag:" fzf-modifier <mod>
```

#### `FTAG_ALT`
The alt-key to bind with in `fzf`. The default is `alt`.

```sh
zstyle ":ftag:" fzf-alt <alt>
```

**Note:** The keybindings specified in the keyfile will have the `fzf-alt`/`fzf-modifier` that is also specified in the keyfile applied to them. All other keybindings will respect `zstyle`'s specification or the associated environment variables.

### `zstyle` only

These are additional `zstyle` settings.

#### Default `fzf` command

`fzf-tmux` or whatever else `fzf` wrapper can be used instead of the default. `skim` compatibility is in the works.

```sh
zstyle ":ftag:" fzf-command <cmd>
```

#### Additional `fzf` bindings

These are additional `fzf` bindings that are not actions. An example would be `ctrl-j:preview-down,ctrl-k:preview-up`.

```sh
zstyle ":ftag:" fzf-bindings <bindings>
```

#### Additional `fzf` flags

The source code can be peeked at to see the ones already in use. This option is here in case any additional would like to be added.

```sh
zstyle ":ftag:" fzf-flags <flags>
```

## Installation

### `zinit`

#### As a binary

```sh
zinit light-mode lucid null for \
    sbin"f*/ftag" lmburns/ftag

zinit light-mode lucid binary for \
    lbin"f*/ftag" lmburns/ftag
```

### As a plugin

```sh
# either or (can remove trigger-load as well)
zinit light-mode lucid for \
    nocompile'!' trigger-load'!ftag' blockf compile'f*/*~*.zwc' \
    lmburns/ftag

zinit light-mode lucid for \
    blockf compile'f*/*~*.zwc' \
    lmburns/ftag
```

### OhMyZsh

```sh
git clone https://github.com/lmburns/ftag $ZDOTDIR/.ohmyzsh/custom/plugins
```

### Manual

```sh
git clone https://github.com/lmburns/ftag <custom_location>

# Add to .zshrc
source ~/<custom_location>/ftag.plugin.zsh
```

### TODO

* Catch error on invalid flag
* Confirm support for file paths with spaces
* Fix alignment of output if path is not part of the mapping hash
* Find a way to display hidden tagged files
* Use `langinfo`, etc for all arrow symbols

* Add option for tag separator symbol
* Add option to permanently set notifications
* Add full support for yaml
* Switch to keyfile only (no support without one)
* Possibly use a cache file (use `sqlite3`)
* Submit `fzf` bug, regarding how `TUI` programs that are written in `go` work just fine, but ones written in `rust` do not
