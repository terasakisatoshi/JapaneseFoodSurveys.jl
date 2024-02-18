
# JapaneseFoodSurveys

Documentation for [JapaneseFoodSurveys](https://github.com/terasakisatoshi/JapaneseFoodSurveys.jl).

```@index
```

# 好きな食べ物

```@example wc_food
using ImageShow
using WordCloud

using JapaneseFoodSurveys

df = JapaneseFoodSurveys.summarize()
wc_favorite_food = wordcloud(df.favorite_food)
generate!(wc_favorite_food)
paint(wc_favorite_food, "wc_favorite_food.svg")
```

![](wc_favorite_food.svg)


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

