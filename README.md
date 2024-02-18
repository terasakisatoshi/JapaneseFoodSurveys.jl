# JapaneseFoodSurveys [![Build Status](https://github.com/terasakisatoshi/JapaneseFoodSurveys.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/terasakisatoshi/JapaneseFoodSurveys.jl/actions/workflows/CI.yml?query=branch%3Amain) [![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://terasakisatoshi.github.io/JapaneseFoodSurveys.jl/stable/) [![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://terasakisatoshi.github.io/JapaneseFoodSurveys.jl/dev/)

## 概要

これは日本語でコントリビューションできるリポジトリです．コメント，コミットメッセージ，Issue，プルリクエスト，関数の docstring の追加などは日本語でやりとりすることが可能です．簡単なトピックで OSS（オープンソフトソフトウェア）の開発に参加することを促進する目的で作成しています．

皆さんの好きな食べ物を `["焼肉", "寿司", "麺類", "野菜"]` から選んでもらいます．その結果を `poll/<あなたのGitHubユーザ名>/Data.toml` として格納していただきます．`Data.toml` の生成は `interactive.jl` ファイルを使って生成することができます：


```console
$ julia --project=@. -e 'using Pkg; Pkg.instantiate()'
$ julia --project interactive.jl
```

作成されたデータを元にワードクラウドを作成します．現在の状況は下記のようになっています：

![](https://terasakisatoshi.github.io/JapaneseFoodSurveys.jl/dev/wc_favorite_food.svg)

もし上記の結果が寂しいと感じた場合はコントリビューションをお待ちしています．

