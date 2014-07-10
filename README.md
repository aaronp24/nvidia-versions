nvidia-versions
===============

NVIDIA driver version management tools


This repository contains scripts for streamlining the process of announcing
updates to the NVIDIA Linux graphics drivers.

A typical driver release consists of the following steps:

1.  Diff the changelog from the previous release to generate a list of changes.
    Manually format this and post an annoucement at
    https://devtalk.nvidia.com/default/board/99/

2.  Record the post ID and add a line to URLs.hs for that post in the
    `nvnewsUrls` map.  Try to keep this list roughly sorted, just for
    aesthetics.

3.  Link to the forum post from Google+.

4.  Add a line for the new driver to the `nvidiaUrls` map in URLs.hs.  Use the
    appropriate helper function for the URL scheme used by this release, or add
    a new one if necessary.

5.  Edit nvidia-versions.txt to refer to the new driver.  Remember to remove
    stale entries for beta drivers or old release branches that have been
    superseded.

    If the current long-lived and official branches are the same, leave both
    entries but update them to the same version number.

6.  Run `make`.  This builds the parser and validates the syntax of
    nvidia-versions.txt, and then generates the contents of the "Current
    graphics driver releases" forum post and a /topic command suitable for
    pasting into the #nvidia channel on FreeNode.

7.  Edit the post at https://devtalk.nvidia.com/default/topic/533434

    Paste the text generated in the previous step into the first post in that
    thread.  Verify that all of the links work.

8.  Unlock the thread and post a reply to it linking to the announcement forum
    post.  This marks the "Current graphics driver releases" thread as unread
    for people viewing the forum, so they know that a new release has been made.

    Delete any posts in the thread that are stale.  For example, delete posts
    announcing earlier releases in the same release branch, but leave the post
    announcing the latest long-lived branch release.  Users can always look at
    https://devtalk.nvidia.com/default/board/99/ to find old release
    announcements.

    *Don't forget to re-lock the thread when you're done!*

9.  Commit your change and push it to GitHub.

10. For each of `nvidia-settings`, `nvidia-xconfig`, `nvidia-installer`,
    `nvidia-modprobe`, and `nvidia-persistenced`, unpack the release tarballs
    and commit, tag, and push the changes:

        rm -r *
        tar --strip-components=1 -xvf /path/to/nvidia-whatever-<version>.tar.gz
        rm src/libXNVCtrl/libXNVCtrl.a # for nvidia-settings
        git add -A
        git status
        git diff --cached
        git commit -S -m <version>
        git tag <version>
        git push github master <version>

11. Update the changelog to add a release date line for this release.
