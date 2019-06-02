{-# LANGUAGE DataKinds #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeOperators #-}

module App where

import qualified Data.ByteString.Lazy as B
import Network.HTTP.Media ((//), (/:))
import Servant
import Servant.Server (serve)
import System.FilePath ((</>))

import Config.Config (_distDir_, _entry_)


data HTML

instance Accept HTML where
    contentType _ = "text" // "html" /: ("charset", "utf-8")

instance MimeRender HTML B.ByteString where
    mimeRender _ bs = bs

type API =
    Get '[HTML] B.ByteString
    :<|> Raw

api :: Proxy API
api = Proxy

root :: String
root = _distDir_

server :: IO (Server API)
server = do
    indexHtml <- B.readFile $ root </> _entry_
    let server' =
            pure indexHtml
            :<|> serveDirectoryWebApp root
    return server'

app :: IO Application
app = serve api <$> server
