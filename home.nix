{ config, pkgs, ... }:


{
	home.username = "nix";
	home.homeDirectory = "/home/nix";
	programs.git.enable = true;
	home.stateVersion = "25.11";
	

	home.pointerCursor = {
	name = "Bibata-Modern-Ice";
	package = pkgs.bibata-cursors;
	size = 24;
	gtk.enable = true;
        };
	
	programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "ls -l";
      edit = "sudo -e";
      update = "sudo nixos-rebuild switch --flake /etc/nixos#nixos";
      bash = "zsh";
      pipes = "cd ~/pipes.sh && ./pipes.sh";
      home = "sudo vim /etc/nixos/home.nix";
      config = "sudo vim /etc/nixos/configuration.nix";
      flake = "sudo vim /etc/nixos/flake.nix";
      noctalia = "sudo vim /etc/nixos/noctalia.nix";
      niriconfig = "vim ~/.config/niri/config.kdl";
      balatro = "wine64 ~/Downloads/Balatro/Balatro.exe";
    };

    history.size = 10000;
    history.ignoreAllDups = true;
    history.path = "$HOME/.zsh_history";
    history.ignorePatterns = ["rm *" "pkill *" "cp *"];

    initContent = '' 
	fastfetch
    '';
  };

	home.file.".config/alacritty/alacritty.toml".text = ''
		[window] 	
		opacity = 0.85
		
		[window.padding]
		x = 0
		y = 10

		[general]
		import = ["~/.config/alacritty/themes/noctalia.toml"]

		[font]
		normal.family = "JetBrains Mono Nerd Font"
		bold.family = "JetBrains Mono Nerd Font"
		italic.family = "JetBrains Mono Nerd Font"
		bold_italic.family = "JetBrains Mono Nerd Font"
	'';

	home.file.".config/fastfetch/config.jsonc".text = ''
		{
			"modules": [
				"Title",
				"Separator",
				"OS",
				"Host",
				"Kernel",
				"Uptime",
				"Packages",
				"Shell",
				"Display",
				"WM",
				"Terminal",
				"CPU",
				"GPU",
				"Memory",
				"Swap",
				"Disk"
			]
		}
	'';

}
