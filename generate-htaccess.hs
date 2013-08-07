module Main where
import NVVersionParser
import Data.Map(Map)
import qualified Data.Map as Map

type Key = (Branch, Maturity)

-- Convert a list of drivers to a (Branch, Maturity) to Version map.
toMap :: [Driver] -> Map Key Version
toMap versions =
    Map.fromList (map split versions)
 where
    split (Driver br mat ver) = ((br, mat), ver)

main = do
    Right versions <- parseVersionFile
    let verMap = toMap versions
    let (_, newest) = Map.findMax verMap

    putStrLn "Redirect 302 /~aplattner/nv http://xorg.freedesktop.org/releases/individual/driver/xf86-video-nv-2.1.20.tar.bz2"
    putStrLn ("Redirect 302 /~aplattner/nvidia-readme http://http.download.nvidia.com/XFree86/Linux-x86/" ++ show newest ++ "/README/")
