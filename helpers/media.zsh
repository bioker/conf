abbr -S -g --force --quiet fprb='ffprobe -hide_banner'

function optimizevideo {
    in_file_arg=${in_file:-"video.mp4"}
    out_file_arg=${out_file:-"optimized-video.mp4"}
    resoultion_arg=${res:-"1080x720"}
    frate_arg=${rate:-"30"}
    brate_arg=${bitrate:-"3500K"}
    ffmpeg -i $in_file_arg -s $resoultion_arg -r $frate_arg -b:v $brate_arg $out_file_arg
}
