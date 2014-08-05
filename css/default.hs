{-# LANGUAGE OverloadedStrings #-}

import Clay
import Data.Text hiding (span)
import Prelude hiding (div, (**), span)
import Data.Monoid ((<>))

main = putCss theStylesheet

bodyFont, headerFont :: Css
bodyFont    = fontFamily ["Merriweather"] [serif]
headerFont  = fontFamily ["Amatic SC"] [cursive]
codeFont    = fontFamily ["Oxygen Mono"] [monospace]

headerStyle :: Size a -> Css
headerStyle n = do
    color $ hsl 320 45 30
    headerFont
    fontSize n

theStylesheet :: Css
theStylesheet = do
    body ? do
        color black
        fontSize $ px 16
        margin 0 auto 0 auto
        bodyFont

    "#content-wrapper" ? do
        margin 0 auto 0 auto
        width $ px 800

    "#content" ? do
        paddingRight $ px 250

    ("#sidebar" ** "#navigation") <> ("#logo" ** a) ? headerFont

    "#sidebar" ? do
        minHeight $ px 600
        marginBottom $ px 30
        padding (px 12) 0 (px 12) 0
        float floatRight
        width $ px 220
        "#navigation" ? do
            padding 0 0 0 0
            listStyleType none
            a ? do
                color black
                fontWeight bold
                fontSize $ px 28
                textDecoration none
                textTransform uppercase

    "#logo" ? do
        a ? do
            color black
            fontSize $ px 36
            fontWeight bold
            textDecoration none
        img ? do
            height $ px 36
            width $ px 36

    "#header" ? do
        backgroundColor $ hsl 320 25 20
        height $ px 20

    "#footer" ? do
        clear both
        backgroundColor $ hsl 320 25 20
        marginTop $ px 30
        height $ px 120

    h1 ? headerStyle (px 32)
    h2 ? headerStyle (px 28)
    h3 ? headerStyle (px 24)

    h1 ? do
        borderBottom solid (px 1) (hsl 0 0 75)

    div # ".info" ? do
        color "#555"
        fontSize $ px 14
        fontStyle italic

    code ? codeFont

    table # ".sourceCode" <> tr # ".sourceCode" <> td # ".lineNumbers" <> td # ".sourceCode" <> table # ".sourceCode" ** pre ? do
        margin 0 0 0 0
        padding 0 0 0 0
        borderWidth 0
        "vertical-align" -: "baseline"

    td # ".lineNumbers" ? do
        borderRight solid (px 1) "#AAAAAA"
        textAlign $ alignSide sideRight
        color "#AAAAAA"
        paddingRight $ px 5
        paddingLeft $ px 5

    td # ".sourceCode" ? do
        paddingLeft $ px 5

    ".sourceCode" ? do
        span # ".kw" ? (color "#007020" >> fontWeight bold)
        span # ".dt" ? color "#902000"
        span # ".dv" ? color "#40a070"
        span # ".bn" ? color "#40a070"
        span # ".fl" ? color "#40a070"
        span # ".ch" ? color "#4070a0"
        span # ".st" ? color "#4070a0"
        span # ".co" ? (color "#60a0b0" >> fontStyle italic)
        span # ".ot" ? color "#007020"
        span # ".al" ? (color red >> fontWeight bold)
        span # ".fu" ? color "#06287e"
        {- span # ".re" -}
        span # ".er" ? color red >> fontWeight bold

