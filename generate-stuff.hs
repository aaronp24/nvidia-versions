module Main where
import NVVersionParser
import Data.Map(Map)
import qualified Data.Map as Map
import Control.Monad

type Key = (Branch, Maturity)

-- Convert a list of drivers to a (Branch, Maturity) to Version map.
toMap :: [Driver] -> Map Key Version
toMap versions =
    Map.fromList (map split versions)
 where
    split (Driver br mat ver) = ((br, mat), ver)

-- A map from version numbers to nvnews announcements.
urlMap = Map.fromList [
    (Version "180.29", "http://www.nvnews.net/vbulletin/showthread.php?t=127873"),
    (Version "180.41", "http://www.nvnews.net/vbulletin/showthread.php?p=1963540"),
    (Version "185.13", "http://www.nvnews.net/vbulletin/showthread.php?p=1957328"),
    (Version "96.43.11", "http://www.nvnews.net/vbulletin/showthread.php?t=128942"),
    (Version "71.86.09", "http://www.nvnews.net/vbulletin/showthread.php?t=129639")
 ]

-- A map from version numbers to Linux-x86 and Linux-x86_64 official
-- release pages.
releaseUrlMap = Map.fromList [
    (Version "180.29", ("http://www.nvidia.com/object/linux_display_ia32_180.29.html", "http://www.nvidia.com/object/linux_display_amd64_180.29.html")),
    (Version "173.14.18", ("http://www.nvidia.com/object/linux_display_ia32_173.14.18.html", "http://www.nvidia.com/object/linux_display_amd64_173.14.18.html")),
    (Version "96.43.11", ("http://www.nvidia.com/object/linux_display_x86_96.43.11.html", "http://www.nvidia.com/object/linux_display_amd64_96.43.11.html")),
    (Version "71.86.09", ("http://www.nvidia.com/object/linux_display_x86_71.86.09.html", "http://www.nvidia.com/object/linux_display_amd64_71.86.09.html"))
 ]

whenM (Just v) f = f v
whenM Nothing _ = return ()

-- If key is a member of the given map, look it up and pass the result
-- to a function that returns an IO action.  Otherwise, do nothing.
doLookup key = whenM . (Map.lookup key)

-- Execute an IO action wrapped in [url="foo"]...[/url]
-- if the given key exists in the specified map.  Just execute the
-- action otherwise.
doWithUrl key m action = do
    let result = Map.lookup key m
    whenM result (\url -> putStr (linkTag url))
    action
    whenM result (\_ -> putStr "[/url]")

linkTag url = "[url=\"" ++ url ++ "\"]"
linkTo url str = linkTag url ++ str ++ "[/url]"

-- Print a version line in the form
--   name: ver (x86 / x86_64)
-- "ver" is a link to the nvnews post if one is found in the urlMap
-- table.  "x86" and "x86_64" are links to the nvidia.com official
-- release pages, and are only output if the version is found in the
-- releaseUrlMap.
printVerLine verMap name key =
    doLookup key verMap (\ver -> do
        putStr name
        putStr ": "
        doWithUrl ver urlMap (putStr (show ver))
        doLookup ver releaseUrlMap (\(x86, x86_64) -> do
            putStr $ " (" ++ (linkTo x86 "x86") ++ " / " ++
                             (linkTo x86_64 "x86_64") ++ ")"
         )
        putStrLn ""
     )

-- Print the current official, prerelease, and beta versions from the
-- given release branch.  If any of these don't exist, just skip them.
showBranch verMap heading br = do
    putStrLn $ "[b]" ++ heading ++ "[/b]"
    mapM_ (\(name, mat) -> printVerLine verMap name (br, mat)) [
        ("Current official release", Official),
        ("Current prerelease", Prerelease),
        ("Current beta release", Beta)
     ]
    putStrLn ""

main = do
    Right versions <- parseVersionFile
    let verMap = toMap versions
    let showVer = printVerLine verMap

    putStrLn "============= nvnews.net current releases =============="
    showBranch verMap "Current releases" Current
    showBranch verMap "Legacy releases for GeForce 5 series GPUs" R173_14
    showBranch verMap "Legacy releases for GeForce 2 through GeForce 4 series GPUs" L9622
    showBranch verMap "Legacy releases for Riva TNT, TNT2, GeForce, and some GeForce 2 GPUs" L7160

    let (_, newest) = Map.findMax verMap
    putStr "Please see [URL=\"ftp://download.nvidia.com/XFree86/Linux-x86/"
    putStr (show newest)
    putStrLn "/README/appendix-a.html\"]Appendix A[/URL] of the README to determine which driver you need for your GPU."

    putStrLn "====================== IRC topic ======================="
    putStr "/topic "
    putStr "UNOFFICIAL NVIDIA Linux/FreeBSD/Solaris Graphics Driver Support | Releases: "
    -- beta: 185.13, prerelease: 180.41, legacy: 173.14.18, 96.43.11, 71.86.09
    putStr " | ftp://download.nvidia.com | DO NOT FLOOD! (use "
    putStr "http://pastebin.com) | try to use your distribution's driver "
    putStrLn "packages | Ubuntu kernel module problem?  Ask in #ubuntu"
