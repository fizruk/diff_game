module Main where

import Graphics.UI.Gtk
import Graphics.UI.Gtk.Glade

import Paths_DiffGame (getDataFileName)

main :: IO ()
main = do
    initGUI

    gladeFile   <- getDataFileName "gui/MainWindow.glade"
    Just xml    <- xmlNew gladeFile
    window      <- xmlGetWidget xml castToWindow "window1"

    onDestroy window mainQuit
    widgetShowAll window
    mainGUI
