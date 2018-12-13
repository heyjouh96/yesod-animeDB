{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE DeriveGeneric #-}
module Handler.Anime where

import Import

postAnimeR :: Handler TypedContent
postAnimeR = do
    addHeader "ACCESS-CONTROL-ALLOW-ORIGIN" "*"
    anime <- requireJsonBody :: Handler Anime
    animeid <- runDB $ insert anime
    sendStatusJSON created201 (object ["resp" .= animeid])
    
-- curl -X POST https://yesodia2-wickedjhow.c9users.io/anime -d '{"titulo":"One Piece","descricao":"Aventura de Piratas","imagem":"https://www.barnesandnoble.com/blog/sci-fi-fantasy/wp-content/uploads/sites/4/2017/07/onepiece2.jpg","generoid":1}'

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

-- update from anime
-- set ...
-- where anime.id = animeid
putAlterarR :: AnimeId -> Handler TypedContent
putAlterarR animeid = do
    addHeader "Access-Control-Allow-Origin" "*" 
    _ <- runDB $ get404 animeid
    novoAnime <- requireJsonBody :: Handler Anime
    runDB $ replace animeid novoAnime
    sendStatusJSON noContent204 (object [])
    
-- curl -X PUT https://yesodia2-wickedjhow.c9users.io/anime/2/alterar -d '{"titulo":"Jojos Bizzare Adventure","descricao":"Nova descrição...","imagem":"http://www.animationmagazine.net/wordpress/wp-content/uploads/jojos-bizarre-adventure-post2-1.jpg","generoid":1}'
    
-- Apagar anime

deleteApagarR :: AnimeId -> Handler TypedContent
deleteApagarR animeid = do
    addHeader "Access-Control-Allow-Origin" "*"
    _ <- runDB $ get404 animeid
    runDB $ delete animeid
    sendStatusJSON noContent204 (object [])
    
-- curl -X DELETE https://yesodia2-wickedjhow.c9users.io/anime/3/apagar
    
-- Mostrar anime pelo nome

-- select * from anime where nome ilike %nome%
getBuscarR :: Text -> Handler TypedContent
getBuscarR nome = do
    addHeader "Access-Control-Allow-Origin" "*"
    anime <- runDB $ selectList [Filter AnimeTitulo (Left $  concat ["%", nome, "%"]) (BackendSpecificFilter "ILIKE")] []
    sendStatusJSON ok200 (object ["resp" .= anime])
    
-- curl https://yesodia2-wickedjhow.c9users.io/anime/naru/buscar

postComentarioR :: Handler TypedContent
postComentarioR = do
    addHeader "Access-Control-Allow-Origin" "*"
    comentario <- requireJsonBody :: Handler Comentario
    comentarioid <- runDB $ insert comentario
    sendStatusJSON created201 (object ["resp" .= comentarioid])

-- curl -X POST https://yesodia2-wickedjhow.c9users.io/anime/comentar -d '{"comentario":"Muito bom, gostei!","animeid":1}'

getComentariosR :: AnimeId -> Handler TypedContent
getComentariosR animeid = do 
    addHeader "Access-Control-Allow-Origin" "*"
    comentarios <- runDB $ selectList [ComentarioAnimeid ==. animeid] []
    sendStatusJSON ok200 (object ["resp" .= comentarios])
    
-- curl https://yesodia2-wickedjhow.c9users.io/anime/1/comentarios