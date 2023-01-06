# RESTFUL principles#
> Representational State Transfer

> Index

> Show and destroy

> New and create

> Edit and Update


# Action Pack = ActionController + ActionView

- Forms are mechanisms of how you input the data on the web and then store the data in the DB via Action Pack

- Step
```
web -> send request -> Router -> Controller <-> Model <-DB
Controller -> View -> web
```


## My blog


#### Scaffolding creates

> Migration

> Model

> Routes

> RESTFUL Controller

> Views


```
rails new my_blog
rails g scaffold post title content:text
rake db:migrate
```


#### ERB

<%  ruby code %>
<%= ruby code %>

#### ActionController

> Ruby class containing one or more actions

> responding to a request

> renders a view with the same name as the action


#### RESTful actoin (7):

```ruby
class PostsController < ApplicationController

    # GET /posts
    def index
    end

    # GET /posts/1
    def show
    end

    # DELETE /posts/1
    def destroy
    end

    # GET /posts/New
    def new
    end

    # GET /posts/1/edit
    def edit
    end

    # POST /posts
    def create
    end

    # PATCH/PUT /posts/1
    def update
    end

end
```

## Named Routes

GET posts_path  / index
GET post_path   / show
GET new_post_path / new
POST posts_path / create
GET edit_post_path / edit
PUT/PATCH post_path / update
DELETE post_path / destory


## Restful action

```
rake Routes
```

#### Index

```ruby
class PostsController < ApplicationController

    # GET /posts
    # look for index.html.erb
    def index
        @posts = Post.all
    end
end
```

#### Show, Destory

```ruby
class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update, :destory]
    # GET /posts/1
    # GET /posts/1.json
    def show
    end

    private
        def set_post
            @post = Post.find(params[:id])
        end
end
```


#### respond_to, redirect_to

```ruby
def destroy
  @post.destroy
  respond_to do |format|
    format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
    format.json { head :no_content }
  end
end
```

#### new, create
```ruby
# GET /posts/new
def New
    @post = Post.New
end

def create
  @post = Post.new(post_params)

  respond_to do |format|
    if @post.save
      format.html { redirect_to @post, notice: 'Post was successfully created.' }
      format.json { render :show, status: :created, location: @post }
    else
      format.html { render :new }
      format.json { render json: @post.errors, status: :unprocessable_entity }
    end
  end
end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  # post_params is a method that sanitizes your params, filter which params could be use.
  def post_params
    params.require(:post).permit(:title, :content)
  end
 end
```
#### Flash

> flash[:attr] = value

> :notice  :alert


#### Partials

> Named with underscore \_form.html

> render `partialname(no underscore)`

> <% render @post %> will render a partial in app/views/posts/\_post.html.erb and auto assign a local variable post

#### form helper
```erb
<div class="field">
  <%= f.label :title, "Heading"%><br>
  <%= f.text_field :title, placeholder: "Hint: input title" %>
</div>
<div class="field">
  <%= f.label :content %><br>
  <%= f.text_area :content, size: "10x3" %> <%#default: 40cols x 20rows %>
</div>
<div class="actions">
  <%= f.submit %>
</div>
```

#### ActiveVie::Helpers

[RoR](http://guides.rubyonrails.org/)
- f.date_select
- f.time_select
- f.submit
- f.datetime_select
- distance_of_time_in_words_to_now

- search_field
- telephone_field
- url_field
- email_field
- number_field
- range_field
