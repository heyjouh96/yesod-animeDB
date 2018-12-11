{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
module Handler.AtuaEm where

import Import

postContratoR :: AtorId -> SerieId -> Handler TypedContent
postContratoR atorid serieid = do 
    atuacaoid <- runDB $ insert $ AtuaEm serieid atorid
    sendStatusJSON created201 (object ["resp" .= atuacaoid])

getElencoR :: SerieId -> Handler TypedContent
getElencoR serieid = do 
    -- select * from atua_em where atua_em.serieid == serieid
    -- [Entity 1 (AtuaEm 5 201),Entity 2 (AtuaEm 5 202),Entity 3 (AtuaEm 5 203),Entity 4 (AtuaEm 5 204),Entity 5 (AtuaEm 5 205),Entity 6 (AtuaEm 5 206)]
    atuacoes <- runDB $ selectList [AtuaEmSerieid ==. serieid] []
    -- [201,202,203,204,205,206]
    atoresid <- return $ fmap (atuaEmAtorid . entityVal) atuacoes
    -- select * from ator where id=201 or id=202 ...
    elenco <- runDB $ selectList [AtorId <-. atoresid] []
    sendStatusJSON created201 (object ["resp" .= elenco])

getAtuacaoR :: AtorId -> Handler TypedContent
getAtuacaoR atorid = do 
    atuacoes <- runDB $ selectList [AtuaEmAtorid ==. atorid] []
    seriesid <- return $ fmap (atuaEmSerieid . entityVal) atuacoes
    series <- runDB $ selectList [SerieId <-. seriesid] []
    sendStatusJSON created201 (object ["resp" .= series])