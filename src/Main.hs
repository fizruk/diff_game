module Main where

import Control.Monad (when)

import Graphics.UI.Gtk
import Graphics.UI.Gtk.Glade

import Paths_DiffGame (getDataFileName)

updateTable :: (TableClass self) => self -> Int -> IO ()
updateTable t n = do
    children <- containerGetChildren t
    mapM_ updateChild $ children
    where
        updateChild child = do
            row <- get t $ tableChildTopAttach child
            set child [widgetVisible := (row < n)]


main :: IO ()
main = do
    initGUI

    -- import GUI file
    gladeFile   <- getDataFileName "gui/MainWindow.glade"
    Just xml    <- xmlNew gladeFile
    window      <- xmlGetWidget xml castToWindow "window1"

    -- aliases to GUI elements
    dimSpinButton   <- xmlGetWidget xml castToSpinButton "dimSpinButton"
    posTable        <- xmlGetWidget xml castToTable "posTable"
    rhsTable        <- xmlGetWidget xml castToTable "rhsTable"
    termTable       <- xmlGetWidget xml castToTable "termTable"
    playerPTable    <- xmlGetWidget xml castToTable "playerPTable"
    playerQTable    <- xmlGetWidget xml castToTable "playerQTable"

    let updateTables = do
        newDimValue <- spinButtonGetValueAsInt dimSpinButton
        mapM_ (flip updateTable newDimValue) $
            [ posTable, rhsTable, termTable, playerPTable, playerQTable ]

    -- update GUI elements when dimension is changed...
    onValueSpinned dimSpinButton $ updateTables
    -- ... and when program starts
    onShow window $ updateTables

    onDestroy window mainQuit
    widgetShowAll window
    mainGUI
