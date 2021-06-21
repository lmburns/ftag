## FTAG - FZF Tagging TUI

### Usage

```sh
USAGE:
        ftag  [wsh] <tag>
        ftag is an FZF TUI for jdberry's tag on macOS
        It uses 'figlet' by default to display headers, though it is not needed
        <tag> is optional argument, and if used, it must be exact. There
        are zsh completions to complete tags. For a fuzzy search, use the -q flag
FLAGS:
        -w,--wutag              Also tag files with wutag (-ww only uses wutag)
        -q,--query <query>      Start fzf with a query
        -z,--zoxide             Use zoxide to select directory to use tags (only shows tagged files)
        -j,--jump               Use autojump to select directory to use tags (only shows tagged files)
        -h,--help               Display this help message
FORMAT:
        -b,--boxes              Add a box around header with boxes
        -c,--lolcat             Color the header with lolcat
        -t,--toilet             Color and format header with toilet
        -l,--local              Use tags in local directory
        The above flags can be used in any combination. Figlet is ran if toilet isn't
        specified and vice-versa. Although figlet doesn't have a flag, it is ran by default.
        The default printing (no flags specified and figlet installed) looks the nicest.
```

### Keybindings within `ftag`
```sh
INSIDE FZF:
        A       Add/append tags ACTION_ADD
        S       Set tags (overwrites)   ACTION_SET
        D       Delete/remove tags      ACTION_REMOVE
        R       Reload the tag search   ACTION_RELOAD
        U       Show tag usage  ACTION_USAGE
        E       Edit selected tags with $EDITOR ACTION_EDIT
        F       Open directory with file manager in which tagged file resides   ACTION_FILEMANAGER
        Ctrl-w  Open directory with glow if dir contains markdown files ACTION_GLOW
        I       Open gitui/lazygit if directory is a git-dir    ACTION_GIT
        L       Switch to local mode (i.e., current directory)  ACTION_LOCAL
        G       Switch to global mode (i.e., default mode/all tags on file system)      ACTION_GLOBAL
        Z       Switch to zoxide query (i.e., select dir and list tags) ACTION_ZOXIDE
        J       Switch to autojump query (i.e., select dir and list tags)       ACTION_AUTOJUMP
        Ctrl-e  Edit a gpg-encrypted file       ACTION_GPG_EDIT
        Ctrl-g  Encrypt or decrypt a file with gpg. If encrypted, decrypt and vice versa        ACTION_GPG
        Ctrl-d  Open directory in dua interactive mode  ACTION_DUA
        Ctrl-t  Open directory in twf to edit file      ACTION_TWF_EDIT
        Ctrl-r  Open directory in rg interactive search ACTION_RIPGREP
        Ctrl-f  If git-dir, open forgit to select action        ACTION_FORGIT
        Ctrl-b  If git-dir, open dotbare to select action       ACTION_DOTBARE
        Ctrl-n  Open directory in finder        ACTION_FINDER
        P       Toggle preview of file or directory     ACTION_PREVIEW
        V       Toggle bat to view file (requires bat)  ACTION_VIEW
        Ctrl-y  Copy the file or directory      ACTION_COPY
        ?       Show keys       ACTION_HELP
```

### Environment Variables

#### `FTAG_PAGER`
Pager to view the current file or to view the `fzf` usage keys within. The script sets it to `bat` and if `bat` is unavailable, then it uses `less`. If `vimpager`, `more`, etc. wants to be used, this environment variable can be set. The script works best with `bat` installed.

#### `FTAG_COPY`
The copy command that is used to copy the path of the file to the clipboard. Since, as least for right now this is only applicable to `macOS`, this shouldn't be too much of a concern. The default is `pbcopy`; however, it still can be set to `xclip -sel primary` or `xsel -p`.

#### `FTAG_MODIFIER`
The modifier to bind keys with in `fzf`. The default is `ctrl`.

### `FTAG_FMANAGER`
The file-manager to open the directory in using `F` within `fzf`. The defaults are set to `lf`, falling back to `ranger`, falling back to `xplr`. There are plans to add all the file managers so it will choose the first one it comes across. If you have more than one file-manager installed and do not like the one that is chosen, this environment variable can be set.

#### `FTAG_FILE_PREV`
The command to preview files with using `fzf`. The default is `bat --style=numbers --color=always`.

#### `FTAG_DIR_PREV`
The command to preview directories with using `fzf`. The default is `exa -TL 3`.

## Installation

### Zinit

```sh
zinit light-mode lucid null for \
    sbin"f*/ftag" lmburns/ftag

# either or (can remove trigger-load as well)
zinit light-mode lucid for \
    nocompile'!' trigger-load'!ftag' blockf compile'f*/*~*.zwc' \
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
