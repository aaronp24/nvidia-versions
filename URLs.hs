module URLs (nvnewsUrls, nvidiaUrls) where
import NVVersionParser
import Data.Map (Map, fromList, assocs)

nvnews ver post =
    (Version ver,
     "http://www.nvnews.net/vbulletin/showthread.php?p=" ++ show post)

-- TODO: Find the post IDs for these.
nvnewsThread ver thread =
    (Version ver,
     "http://www.nvnews.net/vbulletin/showthread.php?t=" ++ show thread)

nvnewsUrls = fromList [
    nvnews "180.29"                     1927376,
    nvnews "180.41"                     1963540,
    nvnews "180.44"                     1971469,
    nvnews "180.50"                     1984723,
    nvnews "180.51"                     1985816,
    nvnews "185.13"                     1957328,
    nvnews "185.19"                     1976912,
    nvnews "96.43.11"                   1941228,
    nvnews "71.86.09"                   1951145,

    nvnewsThread "1.0-4349"                9360,
    nvnewsThread "1.0-4363"               10719,
    nvnewsThread "1.0-4496"               15556,
    nvnewsThread "1.0-5328"               22598,
    nvnewsThread "1.0-5332"               23864,
    nvnewsThread "1.0-5336"               24074,
    nvnewsThread "1.0-6111"               34004,
    nvnewsThread "1.0-6111"               34005,
    nvnewsThread "1.0-6629"               42964,
    nvnewsThread "1.0-6629"               46676,
    nvnewsThread "1.0-6629"               40107,
    nvnewsThread "1.0-7167"               47405,
    nvnewsThread "1.0-7174"               48489,
    nvnewsThread "1.0-7174"               48490,
    nvnewsThread "1.0-7182"               72482,
    nvnewsThread "1.0-7182"               72481,
    nvnewsThread "1.0-7184"               75603,
    nvnewsThread "1.0-7184"               75602,
    nvnewsThread "1.0-7185"               90079,
    nvnewsThread "71.86.01"               99185,
    nvnewsThread "71.86.04"              107084,
    nvnewsThread "71.86.06"              116406,
    nvnewsThread "71.86.07"              122140,
    nvnewsThread "71.86.08"              126955,
    nvnewsThread "71.86.09"              129639,
    nvnewsThread "1.0-6629"               40106,
    nvnewsThread "1.0-7664"               51392,
    nvnewsThread "1.0-7664"               51393,
    nvnewsThread "1.0-7667"               52387,
    nvnewsThread "1.0-7667"               52386,
    nvnewsThread "1.0-7676"               56150,
    nvnewsThread "1.0-8174"               61051,
    nvnewsThread "1.0-8174"               61050,
    nvnewsThread "1.0-8174"               61052,
    nvnewsThread "1.0-8178"               62021,
    nvnewsThread "1.0-8178"               62015,
    nvnewsThread "1.0-8178"               62016,
    nvnewsThread "1.0-8756"               67865,
    nvnewsThread "1.0-8756"               67864,
    nvnewsThread "1.0-8762"               70547,
    nvnewsThread "1.0-8762"               70546,
    nvnewsThread "1.0-8762"               72488,
    nvnewsThread "1.0-8774"               75601,
    nvnewsThread "1.0-8774"               75600,
    nvnewsThread "1.0-8776"               78529,
    nvnewsThread "1.0-8776"               78530,
    nvnewsThread "1.0-9629"               79720,
    nvnewsThread "1.0-9629"               79719,
    nvnewsThread "1.0-9631"               87961,
    nvnewsThread "1.0-9639"               81668,
    nvnewsThread "1.0-9746"               82822,
    nvnewsThread "96.43.01"               99186,
    nvnewsThread "96.43.05"              107083,
    nvnewsThread "96.43.07"              116407,
    nvnewsThread "96.43.09"              122139,
    nvnewsThread "96.43.10"              126954,
    nvnewsThread "96.43.11"              128942,
    nvnewsThread "1.0-9655"               87714,
    nvnewsThread "100.14.03"              90139,
    nvnewsThread "100.14.06"              91893,
    nvnewsThread "100.14.06"              91896,
    nvnewsThread "100.14.11"              92953,
    nvnewsThread "100.14.19"              98635,
    nvnewsThread "169.04"                102509,
    nvnewsThread "169.07"                104706,
    nvnewsThread "169.09"                106661,
    nvnewsThread "169.12"                108875,
    nvnewsThread "169.12"                108879,
    nvnewsThread "171.06"                109422,
    nvnewsThread "173.08"                111460,
    nvnewsThread "173.13"                114955,
    nvnewsThread "173.14.05"             113919,
    nvnewsThread "173.14.09"             114873,
    nvnewsThread "173.14.12"             117036,
    nvnewsThread "173.14.15"             122423,
    nvnewsThread "173.14.16"             126937,
    nvnewsThread "173.14.17"             128941,
    nvnewsThread "177.61.02"             121763,
    nvnewsThread "177.67"                118085,
    nvnewsThread "177.68"                118244,
    nvnewsThread "177.70"                118602,
    nvnewsThread "177.76"                119682,
    nvnewsThread "177.78"                120052,
    nvnewsThread "177.80"                120679,
    nvnewsThread "177.82"                122931,
    nvnewsThread "180.08"                123265,
    nvnewsThread "180.11.02"             124813,
    nvnewsThread "180.11"                124059,
    nvnewsThread "180.16"                124599,
    nvnewsThread "180.18"                125134,
    nvnewsThread "180.22"                125903,
    nvnewsThread "180.25"                126934,
    nvnewsThread "180.27"                127073,
    nvnewsThread "180.35"                128939,
    nvnewsThread "180.37"                129638
 ]

nvidia foo ver =
    (Version ver,
     ("http://www.nvidia.com/object/linux_display_" ++ foo ++ "_" ++ ver ++ ".html",
      "http://www.nvidia.com/object/linux_display_amd64_" ++ ver ++ ".html"))

nvidiaUrls = fromList [
    nvidia "ia32"           "180.29",
    nvidia "ia32"           "180.44",
    nvidia "ia32"           "173.14.18",
    nvidia "x86"            "96.43.11",
    nvidia "x86"            "71.86.09"
 ]

main = do
    putStrLn $ "<ul>"
    mapM_ (\(ver, url) -> do
        putStr "  <li><a href="
        putStr (show url)
        putStr ">"
        putStr (show ver)
        putStrLn "</a>"
     ) (assocs nvnewsUrls)
    putStrLn "</ul>"
