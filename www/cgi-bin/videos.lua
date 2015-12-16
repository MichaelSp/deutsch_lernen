#!/usr/bin/lua

-- video_dir = '../../videos'
videos_dir = '/www/videos'
url_path= '/videos'

function scandir(directory)
    local i, t, popen = 0, {}, io.popen
    for filename in popen('ls -a "'..directory..'"'):lines() do
        if not(filename == '.' or filename == '..') then
            i = i + 1
            t[i] = filename
        end
    end
    return t
end

io.write([[
Content-type: text/html; charset=UTF-8\r\n\r\n

<!DOCTYPE html>
<html lang="auto">
<head>
    <meta charset="utf-8">
    <title>Deutsch lernen</title>
    <!--[if lt IE 9]>
    <script src="/luci-static/bootstrap/html5.js"></script>
    <![endif]-->
    <meta name="viewport" content="initial-scale=1.0">
    <link rel="stylesheet" href="/luci-static/bootstrap/cascade.css">
    <link rel="stylesheet" media="only screen and (max-device-width: 854px)" href="/luci-static/bootstrap/mobile.css"
          type="text/css"/>
    <link rel="shortcut icon" href="/luci-static/bootstrap/favicon.ico">
    <style type="text/css">
        footer {
            background: #c2ffff;
            width: 100%;
            bottom: 0;
            position: fixed;
            padding: 10px;
        }
        main {
            padding-bottom: 40px;
        }

        main video {
            width: 100%;
            background: black;
            border-radius: 5px;
            box-shadow: 10px 10px 40px 0px;
        }

        #videos {
            display: flex;
            flex-wrap: wrap;
        }

        #videos li {
            text-indent: -40px;
            padding-left: 40px;
            border: 1px solid rgba(255, 255, 255, 1);
        }
        #videos li:hover {
            background-color: rgba(118, 214, 255, 0.38);
            border: 1px solid rgba(118, 214, 255, 1);
            border-radius: 5px;
        }

        #videos li:before {
            background-image: url('/luci-static/Video-film.png');
            background-size: 30px;
            width: 30px;
            height: 25px;
            content: " ";
            position: absolute;
            margin-top: 5px;
            margin-left: -80px;
        }
    </style>

</head>
<body>
<div id="wrapper">

    <main class="container">
        <h1>Deutsch lernen</h1>
        <hr/>
        <video controls="controls">
            Your browser doesn't support HTML5 videos.
        </video>
        <hr />
        <section id="videos">
            <ul class="unstyled">
]])

for k,filename in pairs(scandir(videos_dir)) do
    io.write(string.format("\t<li><a href=\"%s/%s\" data-file=\"%s\"><h2>%s</h2></a></li>", url_path, filename, filename, filename))
end

io.write(string.format([[
            </ul>
        </section>
    </main>

    <!-- Footer -->
    <footer id="footer">
        <a href="/cgi-bin/luci" class="btn">Admin Interface</a>
    </footer>

</div>

<!-- Scripts -->
<script>
    NodeList.prototype.forEach = Array.prototype.forEach;
    HTMLCollection.prototype.forEach = Array.prototype.forEach;

    var video = document.querySelector('main video');
    document.querySelectorAll('#videos a').forEach(function(e){e.addEventListener('click', function(evt){
        evt.preventDefault();
        video.src = "%s/" + e.dataset.file;
        video.play();
    })});
</script>

</body>
</html>
]], url_path))