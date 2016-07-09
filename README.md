What's ?
===============
chef で使用する docker の cookbook です。

Usage
-----
cookbook なので berkshelf で取ってきて使いましょう。

* Berksfile
```ruby
source "https://github.com/bageljp/"

cookbook "docker", git: "https://github.com/bageljp/cookbook-docker.git"
```

```
berks vendor
```

Recipes
----------

#### docker::default
dockerのインストールとサービス起動。  
便利ツールのdocker-enterをインストールする。


