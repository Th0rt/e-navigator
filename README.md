# e-Navigator で作って欲しいアプリケーションの説明

## セットアップ

### 事前にインストールしておいて欲しいもの
以下は事前にインストールしてあるものとします。
これらのインストールに関しては基本的に質問を受け付けません。

- ruby (version 2.4.3)
- Bundler
- PostgreSQL

### セットアップの手順

セットアップの手順は以下の通りです。
ここからの部分で分からないことがあれば、気軽に質問してください！

Github上でforkして、これから作るRailsアプリケーションの雛形をコピーします。
画面の右上にあるforkボタンを押すことで、自分のアカウントにこのアプリケーションをコピーしてくることができます。

![fork_button](https://github.com/feedforce/e-navigator/wiki/images/fork_button.jpg)

forkしたらローカルにcloneしておいてください。

次に、`$ bin/setup`を実行します。

最後に、`$ bundle exec rails s`してから、`http://localhost:3000`にアクセスしてください。

いつもの画面が表示されればセットアップは完了です。

![youre_on_rails](https://github.com/feedforce/e-navigator/wiki/images/youre_on_rails.png)

## 作って欲しいもの

面談の日程を調整するためのアプリケーションを作っていただきます。
そして、ここで作ったアプリケーションは、あなたの面談日程を調整するために実際に使います。
せっかく作ったアプリケーションが使われないのはもったいないですよね。
自分で作って自分で使って、ぜひ技術書をゲットしちゃってください！

### 詳細な説明
必要な機能の一覧は以下の通りです。

- ユーザー登録、ログイン機能
- 登録したユーザーのプロフィール編集機能
- 面談日程の登録、編集、削除機能
- 面談日程を知らせるためのメール送信機能
- 面談日程を承認 or 非承認をできる機能
- 面談日程の確定をお知らせするメール送信の機能

以下で詳しく説明します。

## 前編

### ユーザー登録、ログイン機能
ユーザーを新規登録できるようにし、その登録したユーザーでログインできるようにしてください。
ログインに必要な項目は以下のとおりです。

- メール
- パスワード

Railsチュートリアルではこのユーザー登録・ログイン機能の実装にほとんどの章を割いていますが、[devise](https://github.com/plataformatec/devise)というgemを使えば簡単に実装することができます。
また、他にも認証機能を実装できるgemはいくつかあります。
gemは何を使っても大丈夫ですし、もちろんフルスクラッチで実装しても良いです。ですが、今回はここはメインの機能ではないので、サクッと実装してもらうのが良いと思います。

### 登録したユーザーのプロフィール編集機能
以下のプロフィールを登録・編集できるようにしてください。

- 名前
  - 文字列で作りましょう
- 生年月日
  - 生年月日を登録しておけば年齢が計算して表示できますね
- 性別
  - enumを使うと良いですね
- 学校名
  - 文字列で大丈夫です

**ここまでできたら前半は完了です！**
**レビューと今後のアドバイスをしますので、PRを作り、Herokuに途中までのアプリケーションをデプロイしてLINE等で教えてください！**

もし fork した場合の Pull Request の作り方が分からない場合は下記のQiita記事が参考になると思います。

- [【GitHub】Pull Requestの手順](https://qiita.com/Commander-Aipa/items/d61d21988a36a4d0e58b)

(後編は後ほど公開します。少々お待ち下さい。)


## 後編

### 自分の面談日程の表示・登録・編集・削除機能
まずは自分の面接を表示・登録・編集・削除できるようにしていきましょう！

#### 面接日程を表示・登録できるようにする
面接日程を登録するためにはその情報をDBに保存する必要があります。
そのために、まずはモデルを作りましょう。モデル名は何でも良いですが、ここでは`Interview`モデルとします。`Interview`モデルは`User`モデルに対して１対多でリレーションを貼ってください。

`Interview`モデルの中身は、面接日程を面接の可否が判断できるものを保存できるようにしてください。

`Interview`モデルを作ったら、次はそれを表示できるようにしましょう。あるユーザーに対して１対多で紐付いているので、ルーティングもそれに従ってください。`InterviewsController#index`で面接日程の一覧が表示できるようにしましょう。

**⚠ 説明が分からない場合は、ぜひサンプルアプリを見ながら読んでみてください。**

一覧で表示できるようになっても、まだデータを登録していないので表示する内容がありません。そこで、面接日程を登録できるようにしていきます。`InterviewsController#new`で面接日程を登録するための画面を表示し、`InterviewsController#create`で面接日程を登録できるようにしましょう！

#### 面接日程を編集・削除できるようにする
面接日程の表示・登録ができるようになったら、次は編集と削除をできるようにします。

`InterviewsController#edit`で面接日程を編集するためのページを表示します。そして、`InterviewsController#update`で面接日程の編集を反映できるようにします。
最後に、`InterviewsController#destroy`で一度保存した面接日程を削除できるようにしましょう。

面接日程のCRUD操作(表示・登録・編集・削除)ができるようになったら次に進みましょう！

### 面談日程を承認 or 拒否をするための機能

#### 自分以外のユーザーの一覧をトップページに表示する


### 面談日程を承認 or 拒否をするための機能


### 面談日程を知らせるためのメール送信機能


## Herokuにデプロイする
Herokuにデプロイする方法を簡単に書いておきます。

### Herokuにアカウントを作る
Herokuのアカウントを持っていない方は、まずはアカウントを作成してください。

https://www.heroku.com/

### Herokuをセットアップする
Heroku CLI がインストールされているかどうかを確認してください。

```
$ heroku version
```

上記のコマンドを打ってバージョンが表示されない方は Homebrew でインストールしてください。

```
$ brew install heroku/brew/heroku
```

Heroku CLIがインストールできたら、`heroku`コマンドでログインしてSSHキーを登録してください。

```
$ heroku login
$ heroku keys:add
```

ログインできたら、Herokuのサーバーにアプリケーションの実行場所を作りましょう。

```
$ heroku create
```

### Herokuにデプロイする
いよいよHerokuに登録したアプリケーションをデプロイしましょう。

```
$ git push heroku master
```

正しくデプロイできたか確認してみましょう。

```
$ heroku open
```

正しくアクセスできれば完了です。

## このアプリを作る際に考慮しなくていいこと
以下のことは考慮しなくて大丈夫です。
もしも自分からやってきてくれた分にはきちんと見ますが、出来ていないからといってレビューなどに影響することはありません。

- 見た目(デザイン)
- 新機能の追加
- テスト(弊社ではRailsを開発する際には必ずテストを書きますが、ここでは必須ではありません。)

---

これまでのことでもし分からないことがあれば、LINE等で気軽に聞いてください。
