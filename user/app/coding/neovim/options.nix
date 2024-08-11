{config, pkgs, ...}:
{
	programs.nixvim = {
		clipboard = {
     			 # Use system clipboard
      			register = "unnamedplus";
        };

        globals = {
            # Set <space> as the leader key
            # See `:help mapleader`
            mapleader = " ";
            maplocalleader = " ";

            # Set to true if you have a Nerd Font installed and selected in the terminal
            have_nerd_font = true;
        };

		opts = {
			updatetime = 100; # Faster completion
            timeoutlen = 300;

      			# Line numbers
      			relativenumber = false; # Relative line numbers
      			number = true; # Display the absolute line number of the current line
      			hidden = false; # Keep closed buffer open in the background
      			mouse = "a"; # Enable mouse control
      			mousemodel = "extend"; # Mouse right-click extends the current selection
      			splitbelow = true; # A new window is put below the current one
      			splitright = true; # A new window is put right of the current one
                breakindent = true;

      			swapfile = false; # Disable the swap file
      			modeline = true; # Tags such as 'vim:ft=sh'
      			modelines = 100; # Sets the type of modelines
      			undofile = true; # Automatically save and restore undo history
      			incsearch = true; # Incremental search: show match for partly typed search command
      			inccommand = "split"; # Search and replace: preview changes in quickfix list
      			ignorecase = true; # When the search query is lower-case, match both lower and upper-case
      			#   patterns
      			smartcase = true; # Override the 'ignorecase' option if the search pattern contains upper
      			#   case characters
      			scrolloff = 8; # Number of screen lines to show around the cursor
      			cursorline = true; # Highlight the screen line of the cursor
      			cursorcolumn = false; # Highlight the screen column of the cursor
      			signcolumn = "yes"; # Whether to show the signcolumn
      			colorcolumn = "100"; # Columns to highlight
      			laststatus = 3; # When to use a status line for the last window
      			fileencoding = "utf-8"; # File-content encoding for the current buffer
      			termguicolors = true; # Enables 24-bit RGB color in the |TUI|
      			spell = false; # Highlight spelling mistakes (local to window)
      			wrap = true; # Prevent text from wrapping
			showmode = false;
                hlsearch = true;
			
      			# Tab options
      			tabstop = 4; # Number of spaces a <Tab> in the text stands for (local to buffer)
      			shiftwidth = 4; # Number of spaces used for each step of (auto)indent (local to buffer)
      			expandtab = true; # Expand <Tab> to spaces in Insert mode (local to buffer)
      			autoindent = true; # Do clever autoindenting
			
      			textwidth = 0; # Maximum width of text that is being inserted.  A longer line will be
      			#   broken after white space to get this width.
			
      			# Folding
      			foldlevel = 99; # Folds with a level higher than this number will be closed

			list = true; # How some characters are displayed
			listchars = {
				tab = "» ";
				trail = "·"; 
				nbsp = "␣";
			};	
		};

        autoGroups = {
            kickstart-highlight-yank = {
                clear = true;
            };
        };

        autoCmd = [
        # Highlight when yanking (copying) text
        #  Try it with `yap` in normal mode
        #  See `:help vim.highlight.on_yank()`
            {
                event = ["TextYankPost"];
                desc = "Highlight when yanking (copying) text";
                group = "kickstart-highlight-yank";
                callback.__raw = ''
                function()
                    vim.highlight.on_yank()
                end
                '';
            }
        ];

        # https://nix-community.github.io/nixvim/NeovimOptions/index.html?highlight=extraplugins#extraconfigluapre
        extraConfigLuaPre = ''
        if vim.g.have_nerd_font then
            require('nvim-web-devicons').setup {}
        end
        '';

        # The line beneath this is called `modeline`. See `:help modeline`
        # https://nix-community.github.io/nixvim/NeovimOptions/index.html?highlight=extraplugins#extraconfigluapost
        extraConfigLuaPost = ''
        -- vim: ts=2 sts=2 sw=2 et
        '';
	};
}
