module Main where
import NVVersionParser

type Key = (Branch, Maturity)

main = do
    Right versions <- parseVersionFile
    let (Driver newest _ _) = maximum versions

    putStrLn "Redirect 302 /~aplattner/nv http://xorg.freedesktop.org/releases/individual/driver/xf86-video-nv-2.1.21.tar.bz2"
    putStrLn ("Redirect 302 /~aplattner/nvidia-readme https://download.nvidia.com/XFree86/Linux-x86_64/" ++ show newest ++ "/README")
    putStrLn "Redirect 302 /~aplattner/nvidia-versions https://raw.github.com/aaronp24/nvidia-versions/master/nvidia-versions.txt"
    putStrLn "Redirect 302 /~aplattner/nvidia-versions.txt https://raw.github.com/aaronp24/nvidia-versions/master/nvidia-versions.txt"
