module Main where
import NVVersionParser

type Key = (Branch, Maturity)

main = do
    Right versions <- parseVersionFile
    let (Driver newest _ _) = maximum versions

    putStrLn "Redirect 302 /~aplattner/nv https://xorg.freedesktop.org/archive/individual/driver/xf86-video-nv-2.1.22.tar.xz"
    putStrLn ("Redirect 302 /~aplattner/nvidia-readme https://download.nvidia.com/XFree86/Linux-x86_64/" ++ show newest ++ "/README")
    putStrLn "Redirect 302 /~aplattner/nvidia-versions https://raw.github.com/aaronp24/nvidia-versions/master/nvidia-versions.txt"
    putStrLn "Redirect 302 /~aplattner/nvidia-versions.txt https://raw.github.com/aaronp24/nvidia-versions/master/nvidia-versions.txt"
