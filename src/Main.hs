module Main where

import Graphics.UI.Gtk

main :: IO ()
main = do
    initGUI
    window    <- windowNew
    runButton <- buttonNew
    set window [windowDefaultWidth   := 200,
                windowDefaultHeight  := 200,
                containerChild       := runButton,
                containerBorderWidth := 10]
    onDestroy window mainQuit
    widgetShowAll window
    mainGUI
