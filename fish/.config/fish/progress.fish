#!/usr/bin/env fish

set total (git rev-list --all | wc -l)
set count 0

git rev-list --all | while read commit
    set count (math $count + 1)
    if test (math "$count % 1000") -eq 0
        echo "Processados $count de $total commits..."
    end
    git show --numstat --format="%aN" $commit
end | awk '
    NF==1 { author=$1 }
    NF==3 { add[author]+=$1; del[author]+=$2 }
    END {
        for (a in add) {
            printf "%-20s +%-8d | -%-8d | total: %-8d\n", a, add[a], del[a], add[a]-del[a]
        }
    }
' | sort -k5 -nr
