# Commands

function __fish_rails_needs_command
  set cmd (commandline -opc)
  if [ (count $cmd) -eq 1 -a $cmd[1] = 'rails' ]
    return 0
  end
  return 1
end

function __fish_rails_using_command
  set cmd (commandline -opc)
  if [ (count $cmd) -gt 1 ]
    if [ $argv[1] = $cmd[2] ]
      return 0
    end
  end
  return 1
end

set --local available_databases mysql oracle postgresql sqlite3 frontbase ibm_db jdbcmysql jdbcsqlite3 jdbcpostgresql jdbc

complete -f -c rails -n '__fish_rails_needs_command' -s v -l version  -x -d 'Show Rails version'

complete -f -c rails -n '__fish_rails_needs_command' -a generate    -d "Generate new code"
complete -f -c rails -n '__fish_rails_needs_command' -a console     -d "Start the Rails console"

complete -f -c rails -n '__fish_rails_needs_command' -a server      -d "Start the Rails server"
complete -f -c rails -n '__fish_rails_using_command server' -s d -l daemon         -d 'Make server run as a Daemon.'
complete -f -c rails -n '__fish_rails_using_command server' -s u -l debugger       -d 'Enable ruby-debugging for the server.'
complete -f -c rails -n '__fish_rails_using_command server' -s p -l port        -x -d 'Runs Rails on the specified port.'
complete -f -c rails -n '__fish_rails_using_command server' -s b -l binding     -x -d 'Binds Rails to the specified ip.'
complete -f -c rails -n '__fish_rails_using_command server' -s P -l pid         -x -d 'Specifies the PID file.'
complete -f -c rails -n '__fish_rails_using_command server' -s c -l config      -x -d 'Use custom rackup configuration file'
complete -f -c rails -n '__fish_rails_using_command server' -s e -l environment -x -d 'Specifies the environment to run this server under (test/development/production)'

complete -f -c rails -n '__fish_rails_needs_command' -a dbconsole   -d "Start a console for the database specified in config/database.yml"
complete -f -c rails -n '__fish_rails_needs_command' -a application -d "Generate the Rails application code"
complete -f -c rails -n '__fish_rails_needs_command' -a destroy     -d "Undo code generated with generate"
complete -f -c rails -n '__fish_rails_needs_command' -a benchmarker -d "See how fast a piece of code runs"
complete -f -c rails -n '__fish_rails_needs_command' -a profiler    -d "Get profile information from a piece of code"
complete -f -c rails -n '__fish_rails_needs_command' -a plugin      -d "Install a plugin"

complete -f -c rails -n '__fish_rails_needs_command' -a runner      -d "Run a piece of code in the application environment"
complete -f -c rails -n '__fish_rails_using_command runner' -s e -l environment -x -d 'Specifies the environment to run this runner under (test/development/production)'


complete -f -c rails -n '__fish_rails_needs_command' -a new         -d "Create a new Rails application"
complete -f -c rails -n '__fish_rails_using_command new' -s r -l ruby                -r -d 'Path to the Ruby binary of your choice'
complete -f -c rails -n '__fish_rails_using_command new' -s b -l builder             -r -d 'Path to an application builder (can be a filesystem path or URL)'
complete -f -c rails -n '__fish_rails_using_command new' -s t -l template            -r -d 'Path to an application template (can be a filesystem path or URL)'
complete -f -c rails -n '__fish_rails_using_command new' -s d -l database            -a "$available_databases" -d 'Preconfigure for selected database'
complete -f -c rails -n '__fish_rails_using_command new' -l dev                      -x -d 'Setup the application with Gemfile pointing to your Rails checkout'
complete -f -c rails -n '__fish_rails_using_command new' -l edge                     -x -d 'Setup the application with Gemfile pointing to Rails repository'
complete -f -c rails -n '__fish_rails_using_command new' -l skip-gemfile             -x -d 'Don\'t create a Gemfile'
complete -f -c rails -n '__fish_rails_using_command new' -s O -l skip-active-record  -x -d 'Skip Active Record files'
complete -f -c rails -n '__fish_rails_using_command new' -s T -l skip-test-unit      -x -d 'Skip Test::Unit files'
complete -f -c rails -n '__fish_rails_using_command new' -s J -l skip-prototype      -x -d 'Skip Prototype filess'
complete -f -c rails -n '__fish_rails_using_command new' -s G -l skip-git            -x -d 'Skip Git ignores and keeps'
complete -f -c rails -n '__fish_rails_using_command new' -s f -l force               -x -d 'Overwrite files that already exist'
complete -f -c rails -n '__fish_rails_using_command new' -s p -l pretend             -x -d 'Run but do not make any changes'
complete -f -c rails -n '__fish_rails_using_command new' -s q -l quiet               -x -d 'Supress status output'
complete -f -c rails -n '__fish_rails_using_command new' -s s -l skip                -x -d 'Skip files that already exist'
