function format-my-py
    set -l st 0 # Initialize a status variable to 0 (success)

    pycodestyle $argv
    if test $status -ne 0 # Check the exit status of pycodestyle
        set st 1 # If non-zero, set our status to 1
    end

    /home/iwarszawski/work/.venv/bin/ruff check --fix $argv 
    if test $status -ne 0 # Check the exit status of ruff check
        set st 1 # If non-zero, set our status to 1
    end

    return $st # Return the accumulated status
end
