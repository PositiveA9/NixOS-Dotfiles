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
	
	programs.fastfetch = {
		enable = true;
		settings = {
			logo = {
				source = "~/nixos/assets/icons/nix-lavender.png";
				padding = {
					top = 2;
					left = 3;
					right = 0;
				};
				width = 20;
			};
			modules = [
				"break"
				{
					type = "custom";
					format = "──────────────────────Hardware──────────────────────";
				}

				{
					type = "cpu";
					key = " ";
					showPeCoreCount = true;
					keyColor = "33";
				}
				{
					type = "gpu";
					key = " 󰍛";
					keyColor = "33";
				}
				{
					type = "memory";
					key = " ";
					keyColor = "33";
				}
				{
					type = "custom";
					format = "────────────────────────────────────────────────────";
				}
				"break"
				{
					type = "custom";
					format = "──────────────────────Software──────────────────────";
				}
				{
					type = "os";
					key = " 󱄅";
					keyColor = "yellow";
				}
				{
					type = "kernel";
					key = " ";
					keyColor = "yellow";
				}
				{
					type = "packages";
					key = " ";
					keyColor = "yellow";
				}
				{
					type = "wm";
					key = " 󰇄";
					keyColor = "33";
				}
				{
					type = "lm";
					key = " 󰍂";
					keyColor = "33";
				}
				{
					type = "terminal";
					key = " ";
					keyColor = "33";
				}
				{
					type = "shell";
					key = " ";
					keyColor = "33";
				}
				{
					type = "custom";
					format = "────────────────────────────────────────────────────";
				}
				"break"
				{
					type = "custom";
					format = "────────────────────Uptime / Age────────────────────";
				}
				{
					type = "command";
					key = "  OS Age ";
					keyColor = "33";
					text = "birth_install=$(stat -c %W /); current=$(date +%s); time_progression=$((current - birth_install)); days_difference=$((time_progression / 86400)); echo $days_difference days";
				}
				{
					type = "uptime";
					key = "  Uptime ";
					keyColor = "33";
				}
				{
					type = "custom";
					format = "────────────────────────────────────────────────────";
				}
				"break"
			];
		};
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

}
