module Main where

import Graphics.UI.Gtk

main :: IO ()
main = do
    initGUI
    window    <- windowNew

    -- creating box for the whole interface
    ifBox <- vBoxNew False 10
    
    -- creating frame for constants
    constFrame <- frameNew
    frameSetLabel constFrame "Определение констант"

    constBox <- hBoxNew False 10
    dimAdj   <- adjustmentNew 1 1 10 1 1 0
    dimNum   <- spinButtonNew dimAdj 1 0
    boxPackStart constBox dimNum PackGrow 10
    containerAdd constFrame constBox

    -- creating box for initial position and function definitions
    varBox <- hBoxNew False 10

    -- creating frame for initial position definition
    posFrame <- frameNew
    frameSetLabel posFrame "Начальное положение"

    posBox  <- vBoxNew True 10
    pos1    <- entryNew
    entrySetText pos1 "0"
    boxPackStart posBox pos1 PackGrow 10
    containerAdd posFrame posBox

    -- creating frame for RHS definition
    rhsFrame <- frameNew
    frameSetLabel rhsFrame "Определение правой части"

    rhsBox   <- vBoxNew True 10
    rhs1     <- entryNew
    entrySetText rhs1 "0"
    boxPackStart rhsBox rhs1 PackGrow 10
    containerAdd rhsFrame rhsBox

    boxPackStart varBox posFrame PackGrow 10
    boxPackStart varBox rhsFrame PackGrow 10

    boxPackStart ifBox constFrame PackGrow 10
    boxPackStart ifBox varBox PackGrow 0
    
    containerAdd window ifBox
    onDestroy window mainQuit
    widgetShowAll window
    mainGUI
