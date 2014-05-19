function get_fish_home
        if test "$XDG_CONFIG_HOME" != ""
                echo $XDG_CONFIG_HOME
        else
                echo "$HOME/.config/fish"
        end
end

function add_modules_to_path
	set fish_home (get_fish_home)
	for module_dir in (find $fish_home -type d -mindepth 1 -maxdepth 1) 
		if test -d $module_dir/functions
			set fish_function_path $fish_function_path $module_dir/functions
		end
		if test -d $module_dir/completions
			set fish_complete_path $fish_complete_path $module_dir/completions
		end
	end
end

add_modules_to_path
