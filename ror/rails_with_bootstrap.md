
$ rails new rails_with_bootstrap
$ s  
$ rake db:create db:migrate


$ 下載bootstrap 將檔案分別放入vendor


$ 在app/assets/stylesheets/application.css

```
*= require_tree .
```
會按照字母順序載入css檔

$ 若有自定style, 可以放在app/assets/stylesheets 底下,並在application.css
```
*= require 'styles'
```

$ 第三方程式可以放在vendor下, 例如bootstrap, 並在application.css  application.js 設定

```
*= require bootstrap.min  
```
\\= require bootstrap.min
```

$ bootstrap font 設定。 在application.css加入

@font-face {
	font-family: 'Glyphicons Halfling';
	src: url('../assets/glyphicons-halfling-regular.eot');
	src: url('../assets/glyphicons-halfling-regular.eot?#iefix') format('embedded-opentype'), url('../assets/glyphicons-halfling-regular.woff') format('woff'),
	url('../assets/glyphicons-halfling-regular.ttf') format(truetype),
	url('../assets/glyphicons-halfling-regular.svg#glyphicons-halflingregular') format('svg');
}


$ the Sass way 編輯Gemfile

gem 'bootstrap-sass', '~> 3.3.6'

In todos.css.scss
@import "bootstrap-sprockets";
@import "bootstrap";

In application.js
//=require bootstrap


$ rails g scaffold Product name:string featImage:string description:text price:decimal

$  
