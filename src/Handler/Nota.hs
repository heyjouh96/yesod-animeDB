{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
module Handler.Nota where

import Import

postNotaR :: Handler TypedContent
postNotaR = do
    addHeader "Access-Control-Allow-Origin" "*"
    nota <- requireJsonBody :: Handler Nota
    notaid <- runDB $ insert nota
    sendStatusJSON created201 (object ["resp" .= notaid])

-- curl -X POST https://yesodia2-wickedjhow.c9users.io/nota -d '{"valor":10,"animeid":1}'

getNotaAnimeR :: AnimeId -> Handler TypedContent
getNotaAnimeR animeid = do
    addHeader "Access-Control-Allow-Origin" "*"
    notas <- runDB $ selectList [NotaAnimeid ==. animeid] []
    -- [10,8,...]
    nota <- return $ fmap (notaValor . entityVal) notas
    sendStatusJSON ok200 (object ["resp" .= nota])
    
-- curl https://yesodia2-wickedjhow.c9users.io/nota/1
