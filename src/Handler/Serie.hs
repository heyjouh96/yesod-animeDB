{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
module Handler.Serie where

import Import
import Network.HTTP.Types.Status
import Database.Persist.Postgresql
import Data.Digest.Pure.SHA
-- import Data.ByteString.Lazy.Char8

-- IO Json
-- req: {"titulo":"Friends", "genero":"sitcom", "ano":1994}
-- Serie "Friends" "sitcom" 1994
-- {"resp":1}
-- stack build
postSerieR :: Handler TypedContent
postSerieR = do
    addHeader "Access-Control-Allow-Origin" "*" -- para poder fazer request externamente
    serie <- requireJsonBody :: Handler Serie -- transforma em json
    serieid <- runDB $ insert serie
    sendStatusJSON created201 (object ["resp" .= serieid])
    
-- select * from serie order by serie.titulo
getTodasR :: Handler TypedContent
getTodasR = do
    series <- runDB $ selectList [] [Asc SerieTitulo]
    sendStatusJSON ok200 (object ["resp" .= series])
    
getDescR :: SerieId -> Handler TypedContent
getDescR serieid = do
    serie <- runDB $ get404 serieid
    sendStatusJSON ok200 (object ["resp" .= serie])
    
deleteApagarR :: SerieId -> Handler TypedContent
deleteApagarR serieid = do
    _ <- runDB $ get404 serieid
    runDB $ delete serieid
    sendStatusJSON noContent204 (object [])
    
-- update from serie
-- set ...
-- where serie.id = serieid
putAlterarR :: SerieId -> Handler TypedContent
putAlterarR serieid = do
    _ <- runDB $ get404 serieid
    novaSerie <- requireJsonBody :: Handler Serie
    runDB $ replace serieid novaSerie
    sendStatusJSON noContent204 (object [])
    
-- update from serie
-- set serie.ano = anonovo
-- where serie.id = serieid
patchModAnoR :: SerieId -> Int -> Handler TypedContent
patchModAnoR serieid anonovo = do 
    _ <- runDB $ get404 serieid
    runDB $ update serieid [SerieAno =. anonovo]
    sendStatusJSON noContent204 (object [])
    
-- select * from serie where nome ilike %nome%
getBuscarR :: Text -> Handler TypedContent
getBuscarR nome = do
    serie <- runDB $ selectList [Filter SerieTitulo (Left $  concat ["%", nome, "%"]) (BackendSpecificFilter "ILIKE")] []
    sendStatusJSON ok200 (object ["resp" .= serie])
    
-- getCryptoR :: Text -> Handler TypedContent
-- getCryptoR a = do
--     hash <- sha512 "haskell"
--     sendStatusJSON ok200 (object ["resp" .= show hash])

-- colocar em routes
-- /serie/#Text/crypto                 CryptoR     GET