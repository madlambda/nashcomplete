# autocomplete of system-wide binaries

fn nash_complete_program(line, pos) {
	var paths <= _nash_complete_programs_paths()
	var choice, status <= (
		find $paths -maxdepth 1 -type f -follow
						>[2=] |
		sed "s#/.*/##g" |
		sort --unique |
		fzf --query "^"+$line
				--select-1
				--exit-0
				--header "Looking for system-wide binaries"
				--prompt "(λ programs)>"
				--reverse
				
	)

	if $status != "0" {
		return ()
	}

	choice <= diffword($choice, $line)

	return ($choice+" " "0")
}


fn _nash_complete_programs_paths() {
        var path <= _nash_complete_programs_clean_path()
        var paths <= split($path, ":")
        var validPaths = ()

        for path in $paths {
                var _, status <= ls $path
                if $status == "0" {
                        validPaths <= append($validPaths, $path)
                }
        }
	return $validPaths
}

fn _nash_complete_programs_clean_path() {
	var ret <= echo $PATH | sed "s/^://g" | sed "s/:$//g"
	return $ret
}
