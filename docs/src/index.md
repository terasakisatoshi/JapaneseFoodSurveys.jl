
# JapaneseFoodSurveys

Documentation for [JapaneseFoodSurveys](https://github.com/terasakisatoshi/JapaneseFoodSurveys.jl).

```@index
```

# 好きな食べ物

```@example wc_food
using ImageShow
using WordCloud
using StatsBase

using JapaneseFoodSurveys
df = JapaneseFoodSurveys.summarize()
words = collect(countmap(df.favorite_food))
wc_favorite_food = wordcloud(words, fonts=["Juisee HW:style=Regular"])
generate!(wc_favorite_food)
paint(wc_favorite_food, "wc_favorite_food.svg")
```

![](wc_favorite_food.svg)

下記の例はランダムな文字を突っ込んだ例です．人間の皆さん頑張って負けないようにしましょう！

```@example wc_random
using Random

using ImageShow
using WordCloud

using JapaneseFoodSurveys

wc_random = wordcloud( [randstring('a':'z', 10) for _ in 1:1000])
generate!(wc_random)
paint(wc_random, "wc_random.svg")
```

![](wc_random.svg)

