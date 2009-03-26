module URLs (nvnewsUrls, nvidiaUrls) where
import NVVersionParser
import Data.Map (Map, fromList)

nvnews ver post =
    (Version ver,
     "http://www.nvnews.net/vbulletin/showthread.php?p=" ++ show post)

nvnewsUrls = fromList [
    nvnews "180.29"         1927376,
    nvnews "180.41"         1963540,
    nvnews "185.13"         1957328,
    nvnews "96.43.11"       1941228,
    nvnews "71.86.09"       1951145
 ]

nvidia foo ver =
    (Version ver,
     ("http://www.nvidia.com/object/linux_display_" ++ foo ++ "_" ++ ver ++ ".html",
      "http://www.nvidia.com/object/linux_display_amd64_" ++ ver ++ ".html"))

nvidiaUrls = fromList [
    nvidia "ia32"           "180.29",
    nvidia "ia32"           "173.14.18",
    nvidia "x86"            "96.43.11",
    nvidia "x86"            "71.86.09"
 ]
