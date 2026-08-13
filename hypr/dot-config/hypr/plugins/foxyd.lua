hl.on("window.open", function(w)
    if w.class ~= "mpv" then
        hl.exec_cmd(
            "python3 /home/addigoat/Projects/Code/python/foxyd/foxyd.py >> /tmp/foxyd.log 2>&1"
        )
    end
end)
