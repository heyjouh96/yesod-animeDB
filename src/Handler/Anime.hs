{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
module Handler.Anime where

import Import

postAnimeR :: Handler TypedContent
postAnimeR = do
    addHeader "Access-Control-Allow-Origin" "*"
    anime <- requireJsonBody :: Handler Anime
    animeid <- runDB $ insert anime
    sendStatusJSON created201 (object ["resp" .= animeid])
    
-- curl -X POST https://yesodia2-wickedjhow.c9users.io/anime -d '{"titulo":"Jojo's Bizzare Adventure","descricao":"Pancadaria Solta","imagem":"http://www.animationmagazine.net/wordpress/wp-content/uploads/jojos-bizarre-adventure-post2-1.jpg","genero":"acao"}'

getMostrarAnimeR :: AnimeId -> Handler TypedContent
getMostrarAnimeR animeid = do 
    addHeader "Access-Control-Allow-Origin" "*"
    anime <- runDB $ get404 animeid
    sendStatusJSON ok200 (object ["resp" .= anime])
    
-- curl https://yesodia2-wickedjhow.c9users.io/anime/1/mostrar
    
getAnimesR :: Handler TypedContent
getAnimesR = do
    addHeader "Access-Control-Allow-Origin" "*"
    animes <- runDB $ selectList [] [Asc AnimeTitulo]
    sendStatusJSON ok200 (object ["resp" .= animes]) 
    
-- curl https://yesodia2-wickedjhow.c9users.io/animes 

