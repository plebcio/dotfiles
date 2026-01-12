function clean_master
    git reset --hard HEAD && git checkout master && git reset --hard HEAD~6 && git pull
end
