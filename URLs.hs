module URLs (nvnewsUrls, nvidiaUrls) where
import NVVersionParser
import Data.Map (Map, fromList, assocs)
import Data.List
import Data.Maybe

forum ver post =
    (Version ver, "https://forums.developer.nvidia.com/t/" ++ show post)

nvnewsUrls = fromList [
    forum       "173.14.39"          31658,
    forum       "304.137"            53534,
    forum       "340.108"           109520,
    forum       "390.132"           107110,
    forum       "390.138"           129494,
    forum       "390.141"           165427,
    forum       "390.143"           175646,
    forum       "390.144"           184227,
    forum       "440.64"            112856,
    forum       "440.82"            118864,
    forum       "440.100"           129492,
    forum       "450.51"            129482,
    forum       "450.57"            141197,
    forum       "450.66"            147366,
    forum       "450.80.02"         155986,
    forum       "450.102.04"        165425,
    forum       "450.119.03"        175645,
    forum       "455.23.04"         154650,
    forum       "455.28"            156507,
    forum       "455.38"            158287,
    forum       "455.45.01"         159759,
    forum       "460.27.04"         163730,
    forum       "460.32.03"         165423,
    forum       "460.39"            166842,
    forum       "460.56"            169452,
    forum       "460.67"            172742,
    forum       "460.73.01"         175225,
    forum       "460.80"            177681,
    forum       "460.84"            179736,
    forum       "460.91.03"         184226,
    forum       "465.19.01"         173745,
    forum       "465.24.02"         175222,
    forum       "465.27"            176631,
    forum       "465.31"            178316,
    forum       "470.42.01"         181536,
    forum       "470.57.02"         184049,
    forum       "470.63.01"         186188,
    forum       "470.74"            189679,
    forum       "470.82.00"         193136,
    forum       "495.29.05"         192073,
    forum       "495.44"            193135
 ]

geforce ver x86 amd64 =
    (Version ver,
     [("http://www.geforce.com/drivers/results/" ++ show x86,                               "x86"),
      ("http://www.geforce.com/drivers/results/" ++ show amd64,                             "x86_64")])

withArm ver =
    (Version ver,
     [("http://www.nvidia.com/object/linux-display-ia32-" ++ ver ++ "-driver.html",         "x86"),
      ("http://www.nvidia.com/object/linux-display-amd64-" ++ ver ++ "-driver.html",        "x86_64"),
      ("http://www.nvidia.com/object/linux-display-32bit-arm-" ++ ver ++ "-driver.html",    "ARM")])

dashdv ver =
    (Version ver,
     [("http://www.nvidia.com/object/linux-display-ia32-" ++ ver ++ "-driver.html",         "x86"),
      ("http://www.nvidia.com/object/linux-display-amd64-" ++ ver ++ "-driver.html",        "x86_64")])

dashes ver =
    (Version ver,
     [("http://www.nvidia.com/object/linux-display-ia32-" ++ ver ++ ".html",                "x86"),
      ("http://www.nvidia.com/object/linux-display-amd64-" ++ ver ++ ".html",               "x86_64")])

nvidia foo ver =
    (Version ver,
     [("http://www.nvidia.com/object/linux_display_" ++ foo ++ "_" ++ ver ++ ".html",       "x86"),
      ("http://www.nvidia.com/object/linux_display_amd64_" ++ ver ++ ".html",               "x86_64")])

ancient ver =
    (Version ver,
     [("http://www.nvidia.com/object/linux_display_" ++ ver ++ ".html",                     "x86")])

reallyAncient ver =
    (Version ver,
     [("http://www.nvidia.com/object/linux_v" ++ ver ++ ".html",                            "x86")])

dr ver x86 amd64 arm =
    (Version ver,
     [("http://www.nvidia.com/Download/driverResults.aspx/" ++ show x86 ++ "/en-us",        "x86"),
      ("http://www.nvidia.com/Download/driverResults.aspx/" ++ show amd64 ++ "/en-us",      "x86_64"),
      ("http://www.nvidia.com/Download/driverResults.aspx/" ++ show arm ++ "/en-us",        "ARM")])

drNoArm ver x86 amd64 =
    (Version ver,
     [("http://www.nvidia.com/Download/driverResults.aspx/" ++ show x86 ++ "/en-us",        "x86"),
      ("http://www.nvidia.com/Download/driverResults.aspx/" ++ show amd64 ++ "/en-us",      "x86_64")])

dr64 ver amd64 =
    (Version ver,
     [("http://www.nvidia.com/Download/driverResults.aspx/" ++ show amd64 ++ "/en-us",      "x86_64")])

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
    dashdv                  "173.14.27",
    dashdv                  "173.14.28",
    dashdv                  "173.14.30",
    dashdv                  "173.14.31",
    dashdv                  "173.14.36",
    dashdv                  "173.14.37",
    dashdv                  "173.14.38",
    drNoArm                 "173.14.39" 71302 71303,
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
    dashes                  "195.36.24",
    dashdv                  "195.36.31",
    dashes                  "256.25",
    dashdv                  "256.35",
    (Version                "256.38.02", [("x86", "http://developer.download.nvidia.com/opengl/4.1/linux/NVIDIA-Linux-x86-256.38.02.run"),
                                          ("x86_64", "http://developer.download.nvidia.com/opengl/4.1/linux/NVIDIA-Linux-x86_64-256.38.02.run")]),
    (Version                "256.38.03", [("x86", "http://developer.download.nvidia.com/opengl/4.1/linux/NVIDIA-Linux-x86-256.38.03.run"),
                                          ("x86_64", "http://developer.download.nvidia.com/opengl/4.1/linux/NVIDIA-Linux-x86_64-256.38.03.run")]),
    dashdv                  "256.44",
    dashdv                  "256.53",
    dashdv                  "260.19.12",
    dashdv                  "260.19.21",
    dashdv                  "260.19.29",
    dashdv                  "260.19.36",
    dashdv                  "260.19.44",
    dashdv                  "270.18",
    dashdv                  "270.26",
    dashdv                  "270.41.06",
    dashdv                  "270.41.19",
    dashdv                  "275.09.07",
    dashdv                  "275.19",
    dashdv                  "275.28",
    dashdv                  "275.36",
    dashdv                  "280.13",
    dashdv                  "285.03",
    dashdv                  "285.05.09",
    dashdv                  "295.33",
    dashdv                  "295.40",
    dashdv                  "295.49",
    dashdv                  "295.53",
    dashdv                  "295.59",
    dashdv                  "302.07",
    dashdv                  "302.17",
    geforce                 "304.22"    46523   46524,
    dashdv                  "304.32",
    dashdv                  "304.37",
    dashdv                  "304.43",
    dashdv                  "304.51",
    dashdv                  "304.60",
    dashdv                  "304.64",
    dashdv                  "304.84",
    dashdv                  "304.88",
    dashdv                  "304.108",
    drNoArm                 "304.116" 69365 69366,
    drNoArm                 "304.117" 71378 71379,
    drNoArm                 "304.119" 72476 72477,
    drNoArm                 "304.121" 73965 73966,
    drNoArm                 "304.123" 77033 77034,
    drNoArm                 "304.125" 80133 80134,
    drNoArm                 "304.128" 90398 90399,
    drNoArm                 "304.131" 95153 95154,
    drNoArm                 "304.132" 107862 107863,
    drNoArm                 "304.134" 112986 112990,
    drNoArm                 "304.135" 114713 114714,
    drNoArm                 "304.137" 123708 123709,
    dashdv                  "310.14",
    dashdv                  "310.19",
    dashdv                  "310.32",
    dashdv                  "310.40",
    dashdv                  "310.44",
    dashdv                  "310.51",
    dashdv                  "313.09",
    dashdv                  "313.18",
    dashdv                  "313.26",
    dashdv                  "313.30",
    dashdv                  "319.12",
    dashdv                  "319.17",
    dashdv                  "319.23",
    withArm                 "319.32",
    withArm                 "319.49",
    withArm                 "319.60",
    dr                      "319.72" 69377 69378 69376,
    withArm                 "325.08",
    withArm                 "325.15",
    withArm                 "331.13",
    dr                      "331.17" 68685 68688 68684,
    dr                      "331.20" 69371 69372 69370,
    dr                      "331.38" 72249 72250 72248,
    dr                      "331.49" 73220 73221 73219,
    dr                      "331.67" 75018 75019 75020,
    dr                      "331.79" 75820 75821 75822,
    dr                      "331.89" 76748 76749 76750,
    drNoArm                 "331.104" 78649 78644,
    dr                      "331.113" 80532 80533 80534,
    dr                      "334.16" 73099 73100 73101,
    dr                      "334.21" 73665 73666 73667,
    dr                      "337.12" 74859 74861 74860,
    dr                      "337.19" 75338 75340 75339,
    dr                      "337.25" 76277 76278 76279,
    dr                      "340.17" 76394 76396 76395,
    dr                      "340.24" 76881 76884 76882,
    dr                      "340.32" 77524 77525 77523,
    dr                      "340.46" 78468 78469 78470,
    dr                      "340.58" 79412 79413 79414,
    dr                      "340.65" 80646 80647 80648,
    dr                      "340.76" 81760 81761 81762,
    dr                      "340.93" 91216 91217 91218,
    dr                      "340.96" 95164 95165 95166,
    dr                      "340.98" 107867 107868 107870,
    dr                      "340.101" 112997 112998 112999,
    dr                      "340.102" 114718 114719 114720,
    dr                      "340.104" 123702 123703 123704,
    dr                      "340.106" 130041 130042 130043,
    drNoArm                 "340.107" 135160 135161,
    drNoArm                 "340.108" 156162 156163,
    dr                      "343.13" 77409 77410 77411,
    dr                      "343.22" 77843 77844 77842,
    dr                      "343.36" 80144 80145 80143,
    dr                      "346.16" 79719 79720 79722,
    dr                      "346.22" 80652 80653 80654,
    dr                      "346.35" 81251 81252 81253,
    dr                      "346.47" 82251 82252 82254,
    dr                      "346.59" 83685 83686 83687,
    dr                      "346.72" 84717 84721 84720,
    dr                      "346.82" 86820 86821 86822,
    dr                      "346.87" 87535 87536 87537,
    dr                      "346.96" 90912 90913 90914,
    dr                      "349.12" 83512 83513 83514,
    dr                      "349.16" 84042 84043 84044,
    dr                      "352.09" 85056 85057 85058,
    dr                      "352.21" 86389 86390 86392,
    dr                      "352.30" 87649 87650 87651,
    dr                      "352.41" 90278 90279 90280,
    dr                      "352.55" 90912 90913 90914,
    dr                      "352.79" 97644 97645 97646,
    dr                      "352.63" 95158 95159 95160,
    dr                      "355.06" 88693 88694 88695,
    dr                      "355.11" 90392 90393 90394,
    dr                      "358.09" 92711 92712 92713,
    dr                      "358.16" 95920 95921 95922,
    dr                      "361.16" 97302 97303 97304,
    dr                      "361.18" 97473 97474 97475,
    dr                      "361.28" 98371 98373 98372,
    dr                      "361.42" 101418 101423 101421,
    dr                      "361.45.11" 103303 103306 103307,
    dr                      "364.12" 100576 100577 100578,
    dr                      "364.15" 101703 101704 101707,
    dr                      "364.19" 101817 101818 101819,
    dr                      "367.18" 102878 102879 102880,
    dr                      "367.27" 104283 104284 104285,
    dr                      "367.35" 105342 105343 105344,
    dr                      "367.44" 106779 106780 106781,
    dr                      "367.57" 108581 108586 108585,
    dr                      "370.23" 105854 105855 105856,
    dr                      "370.28" 107407 107408 107409,
    dr                      "375.10" 109243 109244 109245,
    dr                      "375.20" 111595 111596 111594,
    dr                      "375.26" 112991 112992 112993,
    dr                      "375.39" 114707 114708 114709,
    dr                      "375.66" 118289 118290 118291,
    dr                      "375.82" 120910 120911 120912,
    dr                      "378.09" 114231 114232 114233,
    dr                      "378.13" 115030 115031 115032,
    dr                      "381.09" 117001 117002 117003,
    dr                      "381.22" 118523 118524 118525,
    dr                      "384.47" 120293 120294 120295,
    dr                      "384.59" 120916 120917 120918,
    dr                      "384.69" 123102 123103 123104,
    dr                      "384.90" 123917 123918 123919,
    dr                      "384.98" 126576 126577 126578,
    dr                      "384.111" 128736 128737 128738,
    dr                      "387.12" 125398 125399 125401,
    dr                      "387.22" 126184 126185 126186,
    dr                      "387.34" 127148 127149 127150,
    dr                      "390.12" 128742 128743 128744,
    dr                      "390.25" 130645 130646 130647,
    dr                      "390.42" 131852 131853 131854,
    dr                      "390.48" 132529 132530 132531,
    dr                      "390.59" 134261 134262 134263,
    dr                      "390.67" 134858 134859 134860,
    dr                      "390.77" 136119 136120 136121,
    dr                      "390.87" 137275 137276 137277,
    dr                      "390.116" 142563 142567 142564,
    dr                      "390.129" 149141 149145 149142,
    dr                      "390.132" 153828 153832 153829,
    dr                      "390.138" 160178 160182 160179,
    dr                      "390.141" 168287 168290 168288,
    dr                      "390.143" 173108 173111 173109,
    dr                      "390.144" 177154 177153 177155,
    dr64                    "396.18" 133571,
    dr64                    "396.24" 133859,
    dr64                    "396.45" 136233,
    dr64                    "396.51" 136888,
    dr64                    "396.54" 137211,
    dr64                    "410.57" 138279,
    dr64                    "410.66" 138959,
    dr64                    "410.73" 139110,
    dr64                    "410.78" 140135,
    dr64                    "415.13" 139527,
    dr64                    "415.18" 140282,
    dr64                    "415.22" 141072,
    dr64                    "415.23" 141300,
    dr64                    "415.25" 141448,
    dr64                    "410.93" 141700,
    dr64                    "415.27" 141847,
    dr64                    "418.43" 142958,
    dr64                    "418.56" 145182,
    dr64                    "418.74" 146667,
    dr64                    "418.88" 149219,
    dr64                    "430.09" 146189,
    dr64                    "430.14" 147582,
    dr64                    "430.26" 148435,
    dr64                    "430.34" 148589,
    dr64                    "430.40" 149138,
    dr64                    "430.50" 151568,
    dr64                    "435.17" 149785,
    dr64                    "435.21" 150803,
    dr64                    "440.26" 152590,
    dr64                    "440.31" 153226,
    dr64                    "440.36" 154997,
    dr64                    "440.44" 156086,
    dr64                    "440.59" 156772,
    dr64                    "440.64" 157462,
    dr64                    "440.82" 159360,
    dr64                    "440.100" 160175,
    dr64                    "450.51"  160555,
    dr64                    "450.57"  162107,
    dr64                    "450.66"  163238,
    dr64                    "450.80.02" 164073,
    dr64                    "450.102.04" 168351,
    dr64                    "450.119.03" 173104,
    dr64                    "455.23.04" 163522,
    dr64                    "455.28" 165689,
    dr64                    "455.38" 166177,
    dr64                    "455.45.01" 166883,
    dr64                    "460.27.04" 167671,
    dr64                    "460.32.03" 168347,
    dr64                    "460.39" 170134,
    dr64                    "460.56" 170804,
    dr64                    "460.67" 171392,
    dr64                    "460.73.01" 172376,
    dr64                    "460.80" 175203,
    dr64                    "460.84" 175875,
    dr64                    "460.91.03" 177151,
    dr64                    "465.19.01" 171980,
    dr64                    "465.24.02" 172836,
    dr64                    "465.27" 174582,
    dr64                    "465.31" 175539,
    dr64                    "470.42.01" 176525,
    dr64                    "470.57.02" 177145,
    dr64                    "470.63.01" 179599,
    dr64                    "470.74" 180475,
    dr64                    "470.82.00" 181278,
    dr64                    "495.29.05" 181159,
    dr64                    "495.44" 181274,
    nvidia "x86"            "71.86.04",
    nvidia "x86"            "71.86.09",
    nvidia "ia32"           "71.86.11",
    nvidia "ia32"           "71.86.13",
    dashdv                  "71.86.14",
    dashdv                  "71.86.15",
    nvidia "x86"            "96.43.11",
    nvidia "ia32"           "96.43.13",
    nvidia "ia32"           "96.43.14",
    nvidia "ia32"           "96.43.16",
    dashdv                  "96.43.18",
    dashdv                  "96.43.19",
    dashdv                  "96.43.20",
    dashdv                  "96.43.23"
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
