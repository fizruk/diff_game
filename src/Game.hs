module Game where

-- | Right hand side type.
type RHS point = point -> point -> point -> point

-- | Pixel set type.
type PixelSet point = [point]

-- | Data for a concrete problem.
data GameData point = GameData
    { dimension         :: Int            -- ^ Dimension (>= 1).
    , partition         :: Int            -- ^ Steps count in partition (>= 1).
    , extensionFactor   :: Double         -- ^ Extension factor for terminal set (>= 0).
    , rhs               :: RHS point      -- ^ Right-hand side of problems equation.
    , initialPos        :: point          -- ^ Initial position for catching player.
    , terminalSet       :: PixelSet point -- ^ Terminal set.
    , catherControl     :: PixelSet point -- ^ Control set for catching player.
    , runningControl    :: PixelSet point -- ^ Control set for running off player.
    }

-- | Game result.
data GameResult point = GameResult
    { trajectory :: [point]          -- ^ Trajectory of catching player.
    , terminals  :: [PixelSet point] -- ^ Extensions of terminal set.
    }

-- | Calculate game results from input data.
runGame :: GameData p -> GameResult p
runGame = undefined
