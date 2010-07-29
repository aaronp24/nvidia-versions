module URLs (nvnewsUrls, nvidiaUrls, Link(..)) where
import NVVersionParser
import Data.Map (Map, fromList, assocs)
import Data.List
import Data.Maybe

data Link = Post Int | Thread Int deriving (Show, Ord, Eq)

nvnews ver post =
    (Version ver, "http://www.nvnews.net/vbulletin/showthread.php?p=" ++ show post)

nvnewsUrls = fromList [
    nvnews "1.0-4349"             95425,
    nvnews "1.0-4363"            108997,
    nvnews "1.0-4496"            165575,
    nvnews "1.0-5328"            249950,
    nvnews "1.0-5332"            262144,
    nvnews "1.0-5336"            264050,
    nvnews "1.0-6111"            393887,
    nvnews "1.0-6111"            393889,
    nvnews "1.0-6629"            502849,
    nvnews "1.0-6629"            553970,
    nvnews "1.0-6629"            467512,
    nvnews "1.0-6629"            467511,
    nvnews "1.0-7167"            563656,
    nvnews "1.0-7174"            578538,
    nvnews "1.0-7174"            578539,
    nvnews "1.0-7182"            922366,
    nvnews "1.0-7182"            922365,
    nvnews "1.0-7184"            973581,
    nvnews "1.0-7184"            973580,
    nvnews "1.0-7185"           1231682,
    nvnews "1.0-7664"            621438,
    nvnews "1.0-7664"            621439,
    nvnews "1.0-7667"            636379,
    nvnews "1.0-7667"            636378,
    nvnews "1.0-7676"            688569,
    nvnews "1.0-8174"            762805,
    nvnews "1.0-8174"            762804,
    nvnews "1.0-8174"            762806,
    nvnews "1.0-8178"            776695,
    nvnews "1.0-8178"            776653,
    nvnews "1.0-8178"            776654,
    nvnews "1.0-8756"            859771,
    nvnews "1.0-8756"            859770,
    nvnews "1.0-8762"            894833,
    nvnews "1.0-8762"            894831,
    nvnews "1.0-8762"            922437,
    nvnews "1.0-8774"            973574,
    nvnews "1.0-8774"            973573,
    nvnews "1.0-8776"           1032996,
    nvnews "1.0-8776"           1033000,
    nvnews "1.0-9629"           1054844,
    nvnews "1.0-9629"           1054843,
    nvnews "1.0-9631"           1192715,
    nvnews "1.0-9639"           1087347,
    nvnews "1.0-9655"           1188442,
    nvnews "1.0-9746"           1105883,
    nvnews "71.86.01"           1391835,
    nvnews "71.86.04"           1537148,
    nvnews "71.86.06"           1714491,
    nvnews "71.86.07"           1826679,
    nvnews "71.86.08"           1914416,
    nvnews "71.86.09"           1951145,
    nvnews "71.86.09"           1951145,
    nvnews "71.86.10"           2034415,
    nvnews "71.86.11"           2037367,
    nvnews "71.86.13"           2175898,
    nvnews "96.43.01"           1391837,
    nvnews "96.43.05"           1537143,
    nvnews "96.43.07"           1714493,
    nvnews "96.43.09"           1826678,
    nvnews "96.43.10"           1914411,
    nvnews "96.43.11"           1941228,
    nvnews "96.43.11"           1941228,
    nvnews "96.43.12"           2034416,
    nvnews "96.43.13"           2037370,
    nvnews "96.43.14"           2122691,
    nvnews "96.43.16"           2175900,
    nvnews "96.43.17"           2236176,
    nvnews "96.43.18"           2288117,
    nvnews "100.14.03"          1232526,
    nvnews "100.14.06"          1262534,
    nvnews "100.14.06"          1262569,
    nvnews "100.14.11"          1281031,
    nvnews "100.14.19"          1381737,
    nvnews "169.04"             1452209,
    nvnews "169.07"             1490940,
    nvnews "169.09"             1527486,
    nvnews "169.12"             1572651,
    nvnews "169.12"             1572882,
    nvnews "171.06"             1585293,
    nvnews "173.08"             1623661,
    nvnews "173.13"             1684480,
    nvnews "173.14.05"          1666282,
    nvnews "173.14.09"          1682950,
    nvnews "173.14.12"          1727987,
    nvnews "173.14.15"          1832915,
    nvnews "173.14.16"          1914088,
    nvnews "173.14.17"          1941225,
    nvnews "173.14.19"          2034418,
    nvnews "173.14.20"          2037374,
    nvnews "173.14.22"          2122688,
    nvnews "173.14.25"          2175902,
    nvnews "173.14.27"          2288105,
    nvnews "177.61.02"          1819302,
    nvnews "177.67"             1749893,
    nvnews "177.68"             1752479,
    nvnews "177.70"             1759590,
    nvnews "177.76"             1782112,
    nvnews "177.78"             1789640,
    nvnews "177.80"             1800956,
    nvnews "177.82"             1842773,
    nvnews "180.08"             1847941,
    nvnews "180.11"             1861825,
    nvnews "180.11.02"          1877246,
    nvnews "180.16"             1873716,
    nvnews "180.18"             1882835,
    nvnews "180.22"             1897256,
    nvnews "180.25"             1914053,
    nvnews "180.27"             1916380,
    nvnews "180.29"             1927376,
    nvnews "180.35"             1941217,
    nvnews "180.37"             1951107,
    nvnews "180.41"             1963540,
    nvnews "180.44"             1971469,
    nvnews "180.50"             1984723,
    nvnews "180.51"             1985816,
    nvnews "180.53"             1989407,
    nvnews "180.60"             2004770,
    nvnews "185.13"             1957328,
    nvnews "185.18.04"          1990290,
    nvnews "185.18.08"          1997862,
    nvnews "185.18.10"          2009649,
    nvnews "185.18.14"          2016740,
    nvnews "185.18.29"          2056716,
    nvnews "185.18.31"          2058939,
    nvnews "185.18.36"          2071410,
    nvnews "185.19"             1976912,
    nvnews "190.18"             2053084,
    nvnews "190.18.03"          2060387,
    nvnews "190.18.05"          2091961,
    nvnews "190.25"             2071551,
    nvnews "190.32"             2079643,
    nvnews "190.36"             2091962,
    nvnews "190.40"             2105790,
    nvnews "190.42"             2105790,
    nvnews "190.53"             2141387,
    nvnews "195.22"             2129618,
    nvnews "195.30"             2149232,
    nvnews "195.36.03"          2178512,
    nvnews "195.36.08"          2196696,
    nvnews "195.36.07.03"       2212330,
    nvnews "195.36.07.04"       2212330,
    nvnews "195.36.15"          2209577,
    nvnews "195.36.24"          2239062,
    nvnews "195.36.31"          2271750,
    nvnews "256.25"             2255561,
    nvnews "256.29"             2260199,
    nvnews "256.35"             2273450
 ]

dashdv foo ver =
    (Version ver,
     ("http://www.nvidia.com/object/linux-display-" ++ foo ++ "-" ++ ver ++ "-driver.html",
      "http://www.nvidia.com/object/linux-display-amd64-" ++ ver ++ "-driver.html"))

dashes foo ver =
    (Version ver,
     ("http://www.nvidia.com/object/linux-display-" ++ foo ++ "-" ++ ver ++ ".html",
      "http://www.nvidia.com/object/linux-display-amd64-" ++ ver ++ ".html"))

nvidia foo ver =
    (Version ver,
     ("http://www.nvidia.com/object/linux_display_" ++ foo ++ "_" ++ ver ++ ".html",
      "http://www.nvidia.com/object/linux_display_amd64_" ++ ver ++ ".html"))

ancient ver =
    (Version ver,
     ("http://www.nvidia.com/object/linux_display_" ++ ver ++ ".html", "n/a"))

reallyAncient ver =
    (Version ver,
     ("http://www.nvidia.com/object/linux_v" ++ ver ++ ".html", "n/a"))

nvidiaUrls = fromList [
    nvidia "ia32"           "100.14.03",
    nvidia "ia32"           "100.14.06",
    nvidia "ia32"           "100.14.09",
    nvidia "ia32"           "100.14.11",
    nvidia "ia32"           "100.14.19",
    reallyAncient           "1.0-1251",
    reallyAncient           "1.0-1512",
    reallyAncient           "1.0-1541",
    ancient                 "1.0-2313",
    ancient                 "1.0-2802",
    ancient                 "1.0-2880",
    ancient                 "1.0-2960",
    ancient                 "1.0-3123",
    nvidia "ia32"           "1.0-4191",
    nvidia "ia32"           "1.0-4349",
    nvidia "ia32"           "1.0-4363",
    nvidia "ia32"           "1.0-4496",
    nvidia "ia32"           "1.0-5328",
    nvidia "ia32"           "1.0-5336",
    nvidia "ia32"           "1.0-6106",
    nvidia "ia32"           "1.0-6111",
    nvidia "ia32"           "1.0-6629",
    nvidia "ia32"           "1.0-7167",
    nvidia "ia32"           "1.0-7174",
    nvidia "ia32"           "1.0-7182",
    nvidia "ia32"           "1.0-7184",
    nvidia "ia32"           "1.0-7185",
    nvidia "ia32"           "1.0-7664",
    nvidia "ia32"           "1.0-7667",
    nvidia "ia32"           "1.0-7676",
    nvidia "ia32"           "1.0-8174",
    nvidia "ia32"           "1.0-8178",
    nvidia "ia32"           "1.0-8756",
    nvidia "ia32"           "1.0-8762",
    nvidia "ia32"           "1.0-8774",
    nvidia "ia32"           "1.0-8776",
    nvidia "ia32"           "1.0-9626",
    nvidia "ia32"           "1.0-9629",
    nvidia "ia32"           "1.0-9631",
    nvidia "ia32"           "1.0-9639",
    nvidia "ia32"           "1.0-9746",
    nvidia "ia32"           "1.0-9755",
    nvidia "ia32"           "1.0-9762",
    nvidia "ia32"           "169.07",
    nvidia "ia32"           "171.05",
    nvidia "ia32"           "171.06",
    nvidia "ia32"           "171.06.01",
    nvidia "ia32"           "173.08",
    nvidia "ia32"           "173.14.18",
    nvidia "ia32"           "173.14.20",
    nvidia "ia32"           "173.14.22",
    nvidia "ia32"           "173.14.25",
    nvidia "ia32"           "177.70.33",
    nvidia "ia32"           "180.29",
    nvidia "ia32"           "180.44",
    nvidia "ia32"           "180.51",
    nvidia "ia32"           "180.60",
    nvidia "ia32"           "185.18.04",
    nvidia "ia32"           "185.18.10",
    nvidia "ia32"           "185.18.14",
    nvidia "ia32"           "185.18.29",
    nvidia "ia32"           "185.18.31",
    nvidia "ia32"           "185.18.36",
    nvidia "ia32"           "190.18",
    nvidia "ia32"           "190.42",
    nvidia "ia32"           "190.53",
    nvidia "ia32"           "195.22",
    nvidia "ia32"           "195.30",
    -- nvidia "ia32"           "195.36.08",
    nvidia "ia32"           "195.36.15",
    dashes "ia32"           "195.36.24",
    dashdv "ia32"           "195.36.31",
    dashes "ia32"           "256.25",
    dashdv "ia32"           "256.35",
    nvidia "x86"            "71.86.04",
    nvidia "x86"            "71.86.09",
    nvidia "ia32"           "71.86.11",
    nvidia "ia32"           "71.86.13",
    nvidia "x86"            "96.43.11",
    nvidia "ia32"           "96.43.13",
    nvidia "ia32"           "96.43.14",
    nvidia "ia32"           "96.43.16"
 ]

{-
main = do
    tf <- readFile "/mnt/rd/threads"
    let threads = map (Thread . read) (lines tf)
    pf <- readFile "/mnt/rd/posts"
    let posts = map (Post . read) (lines pf)
    let threadMap = fromList (zip threads posts)
    putStrLn $ "<ul>"
    let postTable = map (findPost threadMap) nvnewsUrls
    let postTable' = sortBy (\a b -> compare (fst a) (fst b)) postTable
    mapM_ printPost postTable'
 where
    findPost threadMap (v, p@(Post _)) = (v, p)
    findPost threadMap (v, t@(Thread _)) = (v, fromJust (Data.Map.lookup t threadMap))
    printPost (Version v, Post p) = putStrLn $ "nvnews \"" ++ v ++ "\"\t\t" ++ show p ++ ","
-}
