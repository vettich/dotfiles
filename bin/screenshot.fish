#!/usr/bin/fish
#
# Take a screenshot, either a full screen or a selection.

argparse h/help a/all e/edit -- $argv
or return

if set -ql _flag_help
    echo "screenshot.fish [-h|--help] [-a|--all] [-e|--edit]"
    return 0
end


set -l filename ~/Изображения/screen-"$(date +%s)".png
if set -ql _flag_all
    if set -ql _flag_edit
        grim - | swappy -f -
    else
        grim $filename
    end
else
    if set -ql _flag_edit
        grim -g "$(slurp)" - | swappy -f -
    else
        grim -g "$(slurp)" $filename
    end
end
