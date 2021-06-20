## FTAG - FZF Tagging TUI

### Usage

```sh
USAGE:
        ftag  [wsh] <tag>
        ftag is an fzf TUI type for tags on macOS
        It uses 'figlet' by default to display headers, though it is not needed
        <tag> is optional (has to be an exact match)
FLAGS:
        -w,--wutag              Also tag files with wutag (-ww only uses wutag)
        -q,--query <query>      Start fzf with a query
        -h,--help               Display this help message
        -z,--zoxide             Use zoxide to select directory to use tags (only shows tagged files)
        -j,--jump               Use autojump to select directory to use tags (only shows tagged files)
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
        I       Open gitui/lazygit if directory is a git-dir    ACTION_GIT
        L       Switch to local mode (i.e., current directory)  ACTION_LOCAL
        G       Switch to global mode (i.e., default mode/all tags on file system)      ACTION_GLOBAL
        Z       Switch to zoxide query (i.e., select dir and list tags) ACTION_ZOXIDE
        J       Switch to autojump query (i.e., select dir and list tags)       ACTION_AUTOJUMP
        Ctrl-e  Edit a gpg-encrypted file       ACTION_GPG_EDIT
        Ctrl-g  Encrypt or decrypt a file with gpg. If encrypted, decrypt and vice versa        ACTION_GPG
        Ctrl-d  Open directory in dua interactive mode  ACTION_DUA
        Ctrl-t  Open directory in twf to edit file      ACTION_TWF_EDIT
        P       Toggle preview of file or directory)    ACTION_PREVIEW
        Ctrl-y  Copy the file or directory)     ACTION_COPY
        V       Toggle bat to view file (requires bat)  ACTION_VIEW
        ?       Show keys       ACTION_HELP
ENVIRONMENT VARIABLES:
        FTAG_PAGER      Pager to view file in or usage (default: bat, less)
        FTAG_COPY       Copy command to copy path to clipboard (default: pbcopy)
        FTAG_MODIFIER   Modifier to bind with fzf (default: ctrl)
        FTAG_FMANAGER   File manager to open when using 'F' in fzf (default: lf, ranger, xplr)
        FTAG_FILE_PREV  Fzf preview for files (default: bat)
        FTAG_DIR_PREV   Fzf preview for directories (default: exa)
```

## Installation

* Add zsh plugin
