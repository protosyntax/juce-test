
1. 任意の作業ディレクトリをつくる：`mkdir juce-test`

1. `cd juce-test/`

1. `mkdir libs src test`

1. `cd libs/`

1. `git clone https://github.com/juce-framework/JUCE.git --recursive`

1. `cd ..`

1. ビルドが通るかチェック`cmake -B build -G Ninja`

1. こけたら`docs/memo.md`を読んで対処する

参考：https://qiita.com/tomoyanonymous/items/97cae1b83805ebcc2d00