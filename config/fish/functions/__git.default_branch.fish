function __git.default_branch --description "Print the repo's default branch (origin/HEAD, else main/master)"
    set -l ref (command git symbolic-ref --quiet --short refs/remotes/origin/HEAD 2>/dev/null)
    and string replace -r '^origin/' '' -- $ref
    and return
    for b in main master trunk
        if command git show-ref -q --verify refs/heads/$b
            echo $b
            return
        end
    end
    echo main
end
