# JapaneseFoodSurveys [![Build Status](https://github.com/terasakisatoshi/JapaneseFoodSurveys.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/terasakisatoshi/JapaneseFoodSurveys.jl/actions/workflows/CI.yml?query=branch%3Amain) [![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://terasakisatoshi.github.io/JapaneseFoodSurveys.jl/stable/) [![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://terasakisatoshi.github.io/JapaneseFoodSurveys.jl/dev/)

## 概要

これは日本語でコントリビューションできるリポジトリです．コメント，コミットメッセージ，Issue，プルリクエスト，関数の docstring の追加などは日本語でやりとりすることが可能です．簡単なトピックで OSS（オープンソフトソフトウェア）の開発に参加することを促進する目的で作成しています．

## 準備

下記の項目を事前に準備する必要があります．

- バージョン管理システム Git
- Julia

### Julia のインストール

Julia は Juliaup を用いて導入すると良いです．

Windows をお使いの場合 PowerShell を開いて次を実行します:

```powershell
PS> winget install julia -s msstore
```

macOS, Linux の場合は下記を実行します:

```console
$ curl -fsSL https://install.julialang.org | sh
```

インストールできたか確認するために `julia` というコマンドを実行します．下記のような結果が出れば成功です．これは Julia の REPL が起動されたことを意味します．

```console
$ julia
               _
   _       _ _(_)_     |  Documentation: https://docs.julialang.org
  (_)     | (_) (_)    |
   _ _   _| |_  __ _   |  Type "?" for help, "]?" for Pkg help.
  | | | | | | |/ _` |  |
  | | |_| | | | (_| |  |  Version 1.10.1 (2024-02-13)
 _/ |\__'_|_|_|\__'_|  |  Official https://julialang.org/ release
|__/                   |

julia> println("Hello World!")
Hello World!

julia> exit() # REPL を閉じます
```

以上で Julia のセットアップが完了です．次のセクションに進みます．

## Julia プロジェクト JapaneseFoodSurveys.jl のクローンとセットアップ

下記のコマンドを実行します:

```julia-repl
$ git clone https://github.com/terasakisatoshi/JapaneseFoodSurveys.jl.git
$ cd JapaneseFoodSurveys.jl
$ julia
               _
   _       _ _(_)_     |  Documentation: https://docs.julialang.org
  (_)     | (_) (_)    |
   _ _   _| |_  __ _   |  Type "?" for help, "]?" for Pkg help.
  | | | | | | |/ _` |  |
  | | |_| | | | (_| |  |  Version 1.10.1 (2024-02-13)
 _/ |\__'_|_|_|\__'_|  |  Official https://julialang.org/ release
|__/                   |

julia> using Pkg; Pkg.activate("."); Pkg.instantiate()
```

これにより `JapaneseFoodSurveys.jl` がローカル環境にクローンされます．Julia の REPL を開いて `Pkg.activate(".")` によってプロジェクトを活性化させた後パッケージの依存関係を `Pkg.instantiate()` によって導入します．

これで準備は完了です．次のセクションに行きましょう！

## 好きな食べ物を選ぶ

皆さんの好きな食べ物を `["焼肉", "寿司", "麺類", "野菜"]` から選んでもらいます（どれも該当しなかったらごめんね・・・．）．その結果を `poll/<あなたのGitHubユーザ名>/Data.toml` として格納します．このとき `Data.toml` の生成は `interactive.jl` ファイルを使って生成することができます：


```console
$ julia --project -e 'using Pkg; Pkg.instantiate()'
$ julia --project interactive.jl
[ Info: githubuser=terasakisatoshi
Choose your favorite food:
   焼肉
   寿司
   麺類
 > 野菜 # ここでは野菜を選ぶとする

Your favorite food is 野菜!
[ Info: tomlfile=poll/<あなたのGitHubユーザ名>/Data.toml has been created
```

もしエラーが起きたら下記のコマンドを試してください

```console
$ git config --get github.user
```

何も出なければ `github.user` が認識されていません．下記のコマンドを使って `github.user` を設定する必要があります．

```console
$ git config --global github.user "<あなたのGitHubユーザ名>"
```

もちろん `"<あなたのGitHubユーザ名>"` の部分は各自の GitHub ユーザ名に置き換えてくださいね．

### Tip

毎回 `--project` を入力するのが面倒であれば `JULIA_PROJECT` 環境変数を "@."` としてセットしておくと良いです．

作成されたデータを元にワードクラウドを作成します．現在の状況は下記のようになっています：

![](https://terasakisatoshi.github.io/JapaneseFoodSurveys.jl/dev/wc_favorite_food.svg)

もし上記の結果が寂しいと感じた場合はコントリビューションをお待ちしています．

