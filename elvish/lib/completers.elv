edit:completion:arg-completer[rustup] = [@words]{
    fn spaces [n]{
        repeat $n ' ' | joins ''
    }
    fn cand [text desc]{
        edit:complex-candidate $text &display-suffix=' '(spaces (- 14 (wcswidth $text)))$desc
    }
    command = 'rustup'
    for word $words[1:-1] {
        if (has-prefix $word '-') {
            break
        }
        command = $command';'$word
    }
    completions = [
        &'rustup'= {
            cand -v 'Enable verbose output'
            cand --verbose 'Enable verbose output'
            cand -h 'Prints help information'
            cand --help 'Prints help information'
            cand -V 'Prints version information'
            cand --version 'Prints version information'
            cand dump-testament 'Dump information about the build'
            cand show 'Show the active and installed toolchains'
            cand install 'Update Rust toolchains'
            cand uninstall 'Uninstall Rust toolchains'
            cand update 'Update Rust toolchains and rustup'
            cand default 'Set the default toolchain'
            cand toolchain 'Modify or query the installed toolchains'
            cand target 'Modify a toolchain''s supported targets'
            cand component 'Modify a toolchain''s installed components'
            cand override 'Modify directory toolchain overrides'
            cand run 'Run a command with an environment configured for a given toolchain'
            cand which 'Display which binary will be run for a given command'
            cand doc 'Open the documentation for the current toolchain'
            cand man 'View the man page for a given command'
            cand self 'Modify the rustup installation'
            cand set 'Alter rustup settings'
            cand completions 'Generate completion scripts for your shell'
            cand help 'Prints this message or the help of the given subcommand(s)'
        }
        &'rustup;dump-testament'= {
            cand -h 'Prints help information'
            cand --help 'Prints help information'
            cand -V 'Prints version information'
            cand --version 'Prints version information'
        }
        &'rustup;show'= {
            cand -h 'Prints help information'
            cand --help 'Prints help information'
            cand -V 'Prints version information'
            cand --version 'Prints version information'
            cand active-toolchain 'Show the active toolchain'
            cand help 'Prints this message or the help of the given subcommand(s)'
        }
        &'rustup;show;active-toolchain'= {
            cand -h 'Prints help information'
            cand --help 'Prints help information'
            cand -V 'Prints version information'
            cand --version 'Prints version information'
        }
        &'rustup;show;help'= {
            cand -h 'Prints help information'
            cand --help 'Prints help information'
            cand -V 'Prints version information'
            cand --version 'Prints version information'
        }
        &'rustup;install'= {
            cand --no-self-update 'Don''t perform self-update when running the `rustup install` command'
            cand --force 'Force an update, even if some components are missing'
            cand -h 'Prints help information'
            cand --help 'Prints help information'
            cand -V 'Prints version information'
            cand --version 'Prints version information'
        }
        &'rustup;uninstall'= {
            cand -h 'Prints help information'
            cand --help 'Prints help information'
            cand -V 'Prints version information'
            cand --version 'Prints version information'
        }
        &'rustup;update'= {
            cand --no-self-update 'Don''t perform self update when running the `rustup update` command'
            cand --force 'Force an update, even if some components are missing'
            cand -h 'Prints help information'
            cand --help 'Prints help information'
            cand -V 'Prints version information'
            cand --version 'Prints version information'
        }
        &'rustup;default'= {
            cand -h 'Prints help information'
            cand --help 'Prints help information'
            cand -V 'Prints version information'
            cand --version 'Prints version information'
        }
        &'rustup;toolchain'= {
            cand -h 'Prints help information'
            cand --help 'Prints help information'
            cand -V 'Prints version information'
            cand --version 'Prints version information'
            cand list 'List installed toolchains'
            cand install 'Install or update a given toolchain'
            cand uninstall 'Uninstall a toolchain'
            cand link 'Create a custom toolchain by symlinking to a directory'
            cand help 'Prints this message or the help of the given subcommand(s)'
        }
        &'rustup;toolchain;list'= {
            cand -h 'Prints help information'
            cand --help 'Prints help information'
            cand -V 'Prints version information'
            cand --version 'Prints version information'
        }
        &'rustup;toolchain;install'= {
            cand --no-self-update 'Don''t perform self update when running the `rustup toolchain install` command'
            cand -h 'Prints help information'
            cand --help 'Prints help information'
            cand -V 'Prints version information'
            cand --version 'Prints version information'
        }
        &'rustup;toolchain;uninstall'= {
            cand -h 'Prints help information'
            cand --help 'Prints help information'
            cand -V 'Prints version information'
            cand --version 'Prints version information'
        }
        &'rustup;toolchain;link'= {
            cand -h 'Prints help information'
            cand --help 'Prints help information'
            cand -V 'Prints version information'
            cand --version 'Prints version information'
        }
        &'rustup;toolchain;help'= {
            cand -h 'Prints help information'
            cand --help 'Prints help information'
            cand -V 'Prints version information'
            cand --version 'Prints version information'
        }
        &'rustup;target'= {
            cand -h 'Prints help information'
            cand --help 'Prints help information'
            cand -V 'Prints version information'
            cand --version 'Prints version information'
            cand list 'List installed and available targets'
            cand add 'Add a target to a Rust toolchain'
            cand remove 'Remove a target from a Rust toolchain'
            cand help 'Prints this message or the help of the given subcommand(s)'
        }
        &'rustup;target;list'= {
            cand --toolchain 'Toolchain name, such as ''stable'', ''nightly'', or ''1.8.0''. For more information see `rustup help toolchain`'
            cand --installed 'List only installed targets'
            cand -h 'Prints help information'
            cand --help 'Prints help information'
            cand -V 'Prints version information'
            cand --version 'Prints version information'
        }
        &'rustup;target;add'= {
            cand --toolchain 'Toolchain name, such as ''stable'', ''nightly'', or ''1.8.0''. For more information see `rustup help toolchain`'
            cand -h 'Prints help information'
            cand --help 'Prints help information'
            cand -V 'Prints version information'
            cand --version 'Prints version information'
        }
        &'rustup;target;remove'= {
            cand --toolchain 'Toolchain name, such as ''stable'', ''nightly'', or ''1.8.0''. For more information see `rustup help toolchain`'
            cand -h 'Prints help information'
            cand --help 'Prints help information'
            cand -V 'Prints version information'
            cand --version 'Prints version information'
        }
        &'rustup;target;help'= {
            cand -h 'Prints help information'
            cand --help 'Prints help information'
            cand -V 'Prints version information'
            cand --version 'Prints version information'
        }
        &'rustup;component'= {
            cand -h 'Prints help information'
            cand --help 'Prints help information'
            cand -V 'Prints version information'
            cand --version 'Prints version information'
            cand list 'List installed and available components'
            cand add 'Add a component to a Rust toolchain'
            cand remove 'Remove a component from a Rust toolchain'
            cand help 'Prints this message or the help of the given subcommand(s)'
        }
        &'rustup;component;list'= {
            cand --toolchain 'Toolchain name, such as ''stable'', ''nightly'', or ''1.8.0''. For more information see `rustup help toolchain`'
            cand --installed 'List only installed components'
            cand -h 'Prints help information'
            cand --help 'Prints help information'
            cand -V 'Prints version information'
            cand --version 'Prints version information'
        }
        &'rustup;component;add'= {
            cand --toolchain 'Toolchain name, such as ''stable'', ''nightly'', or ''1.8.0''. For more information see `rustup help toolchain`'
            cand --target 'target'
            cand -h 'Prints help information'
            cand --help 'Prints help information'
            cand -V 'Prints version information'
            cand --version 'Prints version information'
        }
        &'rustup;component;remove'= {
            cand --toolchain 'Toolchain name, such as ''stable'', ''nightly'', or ''1.8.0''. For more information see `rustup help toolchain`'
            cand --target 'target'
            cand -h 'Prints help information'
            cand --help 'Prints help information'
            cand -V 'Prints version information'
            cand --version 'Prints version information'
        }
        &'rustup;component;help'= {
            cand -h 'Prints help information'
            cand --help 'Prints help information'
            cand -V 'Prints version information'
            cand --version 'Prints version information'
        }
        &'rustup;override'= {
            cand -h 'Prints help information'
            cand --help 'Prints help information'
            cand -V 'Prints version information'
            cand --version 'Prints version information'
            cand list 'List directory toolchain overrides'
            cand set 'Set the override toolchain for a directory'
            cand unset 'Remove the override toolchain for a directory'
            cand help 'Prints this message or the help of the given subcommand(s)'
        }
        &'rustup;override;list'= {
            cand -h 'Prints help information'
            cand --help 'Prints help information'
            cand -V 'Prints version information'
            cand --version 'Prints version information'
        }
        &'rustup;override;set'= {
            cand --path 'Path to the directory'
            cand -h 'Prints help information'
            cand --help 'Prints help information'
            cand -V 'Prints version information'
            cand --version 'Prints version information'
        }
        &'rustup;override;unset'= {
            cand --path 'Path to the directory'
            cand --nonexistent 'Remove override toolchain for all nonexistent directories'
            cand -h 'Prints help information'
            cand --help 'Prints help information'
            cand -V 'Prints version information'
            cand --version 'Prints version information'
        }
        &'rustup;override;help'= {
            cand -h 'Prints help information'
            cand --help 'Prints help information'
            cand -V 'Prints version information'
            cand --version 'Prints version information'
        }
        &'rustup;run'= {
            cand --install 'Install the requested toolchain if needed'
            cand -h 'Prints help information'
            cand --help 'Prints help information'
            cand -V 'Prints version information'
            cand --version 'Prints version information'
        }
        &'rustup;which'= {
            cand -h 'Prints help information'
            cand --help 'Prints help information'
            cand -V 'Prints version information'
            cand --version 'Prints version information'
        }
        &'rustup;doc'= {
            cand --toolchain 'Toolchain name, such as ''stable'', ''nightly'', or ''1.8.0''. For more information see `rustup help toolchain`'
            cand --path 'Only print the path to the documentation'
            cand --alloc 'The Rust core allocation and collections library'
            cand --book 'The Rust Programming Language book'
            cand --cargo 'The Cargo Book'
            cand --core 'The Rust Core Library'
            cand --edition-guide 'The Rust Edition Guide'
            cand --nomicon 'The Dark Arts of Advanced and Unsafe Rust Programming'
            cand --proc_macro 'A support library for macro authors when defining new macros'
            cand --reference 'The Rust Reference'
            cand --rust-by-example 'A collection of runnable examples that illustrate various Rust concepts and standard libraries'
            cand --rustc 'The compiler for the Rust programming language'
            cand --rustdoc 'Generate documentation for Rust projects'
            cand --std 'Standard library API documentation'
            cand --test 'Support code for rustc''s built in unit-test and micro-benchmarking framework'
            cand --unstable-book 'The Unstable Book'
            cand --embedded-book 'The Embedded Rust Book'
            cand -h 'Prints help information'
            cand --help 'Prints help information'
            cand -V 'Prints version information'
            cand --version 'Prints version information'
        }
        &'rustup;man'= {
            cand --toolchain 'Toolchain name, such as ''stable'', ''nightly'', or ''1.8.0''. For more information see `rustup help toolchain`'
            cand -h 'Prints help information'
            cand --help 'Prints help information'
            cand -V 'Prints version information'
            cand --version 'Prints version information'
        }
        &'rustup;self'= {
            cand -h 'Prints help information'
            cand --help 'Prints help information'
            cand -V 'Prints version information'
            cand --version 'Prints version information'
            cand update 'Download and install updates to rustup'
            cand uninstall 'Uninstall rustup.'
            cand upgrade-data 'Upgrade the internal data format.'
            cand help 'Prints this message or the help of the given subcommand(s)'
        }
        &'rustup;self;update'= {
            cand -h 'Prints help information'
            cand --help 'Prints help information'
            cand -V 'Prints version information'
            cand --version 'Prints version information'
        }
        &'rustup;self;uninstall'= {
            cand -y 'y'
            cand -h 'Prints help information'
            cand --help 'Prints help information'
            cand -V 'Prints version information'
            cand --version 'Prints version information'
        }
        &'rustup;self;upgrade-data'= {
            cand -h 'Prints help information'
            cand --help 'Prints help information'
            cand -V 'Prints version information'
            cand --version 'Prints version information'
        }
        &'rustup;self;help'= {
            cand -h 'Prints help information'
            cand --help 'Prints help information'
            cand -V 'Prints version information'
            cand --version 'Prints version information'
        }
        &'rustup;set'= {
            cand -h 'Prints help information'
            cand --help 'Prints help information'
            cand -V 'Prints version information'
            cand --version 'Prints version information'
            cand default-host 'The triple used to identify toolchains when not specified'
            cand help 'Prints this message or the help of the given subcommand(s)'
        }
        &'rustup;set;default-host'= {
            cand -h 'Prints help information'
            cand --help 'Prints help information'
            cand -V 'Prints version information'
            cand --version 'Prints version information'
        }
        &'rustup;set;help'= {
            cand -h 'Prints help information'
            cand --help 'Prints help information'
            cand -V 'Prints version information'
            cand --version 'Prints version information'
        }
        &'rustup;completions'= {
            cand -h 'Prints help information'
            cand --help 'Prints help information'
            cand -V 'Prints version information'
            cand --version 'Prints version information'
        }
        &'rustup;help'= {
            cand -h 'Prints help information'
            cand --help 'Prints help information'
            cand -V 'Prints version information'
            cand --version 'Prints version information'
        }
    ]
    $completions[$command]
}
