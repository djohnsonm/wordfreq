module Paths_wordfreq (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch


version :: Version
version = Version {versionBranch = [0,1,0,0], versionTags = []}
bindir, libdir, datadir, libexecdir :: FilePath

bindir     = "/Users/Dave/Desktop/hm/.virthualenv/cabal/bin"
libdir     = "/Users/Dave/Desktop/hm/.virthualenv/cabal/lib/wordfreq-0.1.0.0/ghc-7.4.1"
datadir    = "/Users/Dave/Desktop/hm/.virthualenv/cabal/share/wordfreq-0.1.0.0"
libexecdir = "/Users/Dave/Desktop/hm/.virthualenv/cabal/libexec"

getBinDir, getLibDir, getDataDir, getLibexecDir :: IO FilePath
getBinDir = catchIO (getEnv "wordfreq_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "wordfreq_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "wordfreq_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "wordfreq_libexecdir") (\_ -> return libexecdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
