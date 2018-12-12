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



-- getGenerosR :: Handler TypedContent
-- getGenerosR = do
--     addHeader "Access-Control-Allow-Origin" "*"
--     generos <- runDB $ selectList [] [Asc GeneroDescricao]
--     sendStatusJSON ok200 (object ["resp" .= generos]) 
    
-- -- curl https://yesodia2-wickedjhow.c9users.io/anime/generos

-- getAnimeByGeneroR :: GeneroId -> Handler TypedContent
-- getAnimeByGeneroR generoid = do 
--     addHeader "Access-Control-Allow-Origin" "*"
--     animes <- runDB $ selectList [AnimeGeneroid ==. generoid] [Asc AnimeTitulo]
--     sendStatusJSON ok200 (object ["resp" .= animes])
    
-- curl https://yesodia2-wickedjhow.c9users.io/animes/genero/1