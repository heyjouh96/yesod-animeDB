{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
module Handler.Ator where

import Import

postAtorR :: Handler TypedContent
postAtorR = do
    ator <- requireJsonBody :: Handler Ator
    atorid <- runDB $ insert ator
    sendStatusJSON created201 (object ["resp" .= atorid])
    
getListaAtorR :: Handler TypedContent
getListaAtorR = do
    atores <- runDB $ selectList [] [Asc AtorNome]
    sendStatusJSON ok200 (object ["resp" .= atores])