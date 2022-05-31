module Main where
import NVVersionParser
import URLs
import Data.Foldable(forM_)
import Data.Map(Map)
import qualified Data.Map as Map
import Data.List
import Control.Monad(when)

type Key = (Branch, Maturity)

-- Convert a list of drivers to a (Branch, Maturity) to Version map.
toMap :: [Driver] -> Map Key Version
toMap versions =
    Map.fromList (map split versions)
 where
    split (Driver ver br mat) = ((br, mat), ver)

-- If key is a member of the given map, look it up and pass the result
-- to a function that returns an IO action.  Otherwise, do nothing.
doLookup key = forM_ . (Map.lookup key)

-- Execute an IO action wrapped in [url="foo"]...[/url]
-- if the given key exists in the specified map.  Just execute the
-- action otherwise.
doWithUrl key m action = do
    let result = Map.lookup key m
    forM_ result (\url -> putStr (linkTag url))
    action
    forM_ result (\_ -> putStr "[/url]")

linkTag url = "[url=\"" ++ url ++ "\"]"
linkTo url str = linkTag url ++ str ++ "[/url]"

-- Print a version line in the form
--   name: ver (x86 / x86_64)
-- "ver" is a link to the forum post if one is found in the forum
-- URL map.  "x86" and "x86_64" are links to the nvidia.com official
-- release pages, and are only output if the version is found in the
-- nvidia URL map.
printVerLine verMap name key =
    doLookup key verMap (\ver -> do
        case name of
          "" -> return ()
          _ -> putStr name >> putStr ": "
        doWithUrl ver forumUrls (putStr (show ver))
        doLookup ver nvidiaUrls (\archUrls -> do
            let archLinks = map (uncurry linkTo) archUrls
            putStr $ " (" ++ intercalate " / " archLinks ++ ")"
         )
        case name of
          "" -> return ()
          _ -> putStrLn ""
     )

-- Print the current production, new feature, and beta versions from the
-- given release branch.  If any of these don't exist, just skip them.
showBranch verMap heading br = do
    putStrLn $ "[b]" ++ heading ++ "[/b]"
    mapM_ (\(name, mat) -> printVerLine verMap name (br, mat)) [
        ("Current production branch release", LongLivedBranchRelease),
        ("Current new feature branch release", Official),
        ("Current beta release", Beta)
     ]
    putStrLn ""

-- Print the latest releases from each of the legacy branches.
showLegacy verMap = do
    putStrLn $ "[b]Legacy releases[/b]"
    mapM_ (\(br, label) -> do
        printVerLine verMap "" (br, Official)
        putStr " - "
        putStr label
        if not (br `elem` supportedLegacyBranches)
            then putStr " (*\x200b)"
            else return ()
        putStrLn "")
      legacyBranchLabels
    putStrLn $ "<small>(*\x200b) <i>These releases are no longer being maintained.  Please see " ++
               linkTo "http://nvidia.custhelp.com/app/answers/detail/a_id/3142"
                      "Support timeframes for Unix legacy GPU releases" ++
               " for more details.</i></small>"

generateForumPostTemplate ver = do
    putStrLn "============================= Forum post template =============================="

    putStrLn "Release highlights since <VERSION>:"
    putStrLn ""
    let server = "https://download.nvidia.com/"
    let platforms =
          [
            ("XFree86/Linux-x86_64",    "Linux-x86_64",           ".run",    "Linux x86_64"),
            ("solaris",                 "Solaris-x86",            ".run",    "Solaris"),
            ("XFree86/FreeBSD-x86_64",  "FreeBSD-x86_64",         ".tar.xz", "FreeBSD x86_64")
          ]
    let platformToStringPair (dirName, platName, suffix, userString) =
          (server ++ dirName ++ "/" ++ ver ++ "/NVIDIA-" ++ platName ++ "-" ++
           ver ++ suffix,
           userString)
    let stringPairs =
          (server ++ "XFree86/Linux-x86_64/" ++ ver ++ "/README/index.html", "README") :
          (map platformToStringPair platforms) ++
          [("https://github.com/NVIDIA/open-gpu-kernel-modules/releases/tag/" ++ ver, "Kernel driver source")]
    let urlStrings = map (uncurry linkTo) stringPairs

    putStr "["
    putStr (concat (intersperse " | " urlStrings))
    putStrLn "]"

main = do
    Right versions <- parseVersionFile
    let verMap = toMap versions
    let showVer = printVerLine verMap
    let (Driver newest _ _) = maximum versions

    generateForumPostTemplate (show newest)
    putStrLn ""
    putStrLn ""

    putStrLn "================= forums.developer.nvidia.com current releases ================="
    showBranch verMap "Current releases" Current
    showLegacy verMap
    putStrLn ""

    putStr "Please see [URL=\"https://download.nvidia.com/XFree86/Linux-x86_64/"
    putStr (show newest)
    putStrLn "/README/supportedchips.html\"]Appendix A[/URL] of the README to determine which driver you need for your GPU."
    putStrLn ""
    putStrLn ""
