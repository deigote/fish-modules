#!/usr/local/bin/fish

function get_fish_home
	if test "$XDG_CONFIG_HOME" != ""
		echo $XDG_CONFIG_HOME
	else
		echo "$HOME/.config/fish"
	end
end

function get_modules_home
	echo (get_fish_home)/modules
end

function get_modules_definitions_file
	echo (get_fish_home)/modules_config.fish
end

function module
	set modules_home (get_modules_home)
	set module_def $argv_name
	set module_repo $argv[1]
	set module_path "$modules_home/$argv[2]"
	if test (count $argv) -gt 2
		set module_branch $argv[3]
	else
		set module_branch master
	end
	echo '###'
	if test -d $module_path
		echo "Pulling $module_path"
		cd $module_path ;and git pull; cd -
	else
		echo "Cloning $module_repo (branch $module_branch) into $module_path"
		git clone $module_repo -b $module_branch $module_path
	end
end

function update_modules
	set modules_definitions_file (get_modules_definitions_file)
	set modules_home (get_modules_home)
	if test ! -d "$modules_home"
		mkdir "$modules_home"
	end
	source "$modules_definitions_file"
end

update_modules
