function add_modules_to_path
        if test "$XDG_CONFIG_HOME" != ""
                set fish_home "$XDG_CONFIG_HOME"
        else
                set fish_home "$HOME/.config/fish"
        end
	for module_dir in (find $fish_home/modules -type d -mindepth 1 -maxdepth 1)
		if test -d $module_dir/functions
			set fish_function_path $fish_function_path $module_dir/functions
		end
		if test -d $module_dir/completions
			set fish_complete_path $fish_complete_path $module_dir/completions
		end
	end
end
add_modules_to_path
