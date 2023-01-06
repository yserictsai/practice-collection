ORM: Object-Relational Mapping

ActiveRecord:
Three prerequisites:

1.how to find your database(/config/database.yml)

2.table name is a plural name

3.table has primary key named id

==>Class name is singular
==>DB table name is plural



##rails console:
$ rails c

##/app/models/car.rb 有class Car:

class Car < ActiveRecord::Base
end

> Car.column_names
> Car.primary_key
> exit



##model has its own generator

$ rails g model person first_name last_name

invoke  active_record
      create    db/migrate/20160317074725_create_people.rb
      create    app/models/person.rb
      invoke    test_unit
      create    test/models/person_test.rb
      create    test/fixtures/people.yml

$ rake db:migrate

==>create_table (:people)



##/config/initializers/inflections.rb
person to people



##Reloading rails console
> reload!



##Active Record CRUD


##Create: rails c

> p1 = Person.new; p1.first_name = "Joe"; p1.last_name = "Smith"

> p1.save

> p2 = Person.new( first_name: "Eric", last_name: "Tsai"); p2.save

> p3 = Person.create(first_name: "John", last_name: "Wall")

##Retrieve/Read: rails c


##find by id
> Person.find(2)

##find by column name
> Person.find_by_first_name(:Eric)
> Person.find_by_first_name("Eric")
> Person.find_by(first_name: "Eric")
> Person.find_by!(first_name: "Eric")   #if it doesnt find anything return couldnt find..

> Person.all.order(first_name: :desc)

> Person.all.order(first_name: :desc).to_a

> Person.first

> Person.all.first bad

> Person.all[0] good

> Person.take

> Person.take 2

>Person.all.map { |person| person.first_name }

##allows to narrow down which fields are coming back
##SELECT "people"."first_name" FROM "people"
>Person.pluck(:firstname)


##ActiveRecord::Relation

> Person.where(last_name: "Doe")

> Person.where(last_name: "Doe").first

> Person.where(last_name: "Doe").pluck(:first_name)


##limit(n)
##offset(n)

> Person.count

> Person.offset(1).limit(1).all.map { |person| "#{person.first_name} #{person.last_name}" }

##Update:

> eric = Person.find_by(first_name: "Eric")

> eric.last_name = "smith"

> eric.save

> Person.find_by(last_name: "smith").update(last_name: "Smithson")


##Delete:

> eric = Person.find_by(first_name: "Eric")

> eric.destory

##removes the row from DB

> eric = Person.find_by(first_name: "Eric")

> Person.delete(eric.id)

>delete_all


#############

SQL Fragment
validations
transactions
N+1 Query

#############

##Seeding the Database

$ rails new advanced_ar

$ rails g model person first_name age:integer last_name

$ rake db:migrate

##populate development data, edit this file: /db/seed.rb

Person.destroy_all #because this is development data, we're gonna be modifying things all the time.

Person.create! [
    {first_name: "Eric", last_name: "Tsai", age: 25},
    {first_name: "John", last_name: "What", age: 23},
    {first_name: "Michael", last_name: "Sean", age: 15},
    {first_name: "Josh", last_name: "Oreck", age: 55},
    {first_name: "John", last_name: "Smith", age: 27},
    {first_name: "Bill", last_name: "Smith", age: 75},
    {first_name: "LeBron", last_name: "James", age: 30}
]


##編輯seed.rb檔後

To populate the databse:

$ rake --describe db:seed

$ rake db:seed

$ rails db

>.headers on

>.mode columns

>select * from people;

1|Eric|25|Tsai|2016-03-18 03:14:35.721153|2016-03-18 03:14:35.721153
2|John|23|What|2016-03-18 03:14:35.726462|2016-03-18 03:14:35.726462
3|Michael|15|Sean|2016-03-18 03:14:35.728295|2016-03-18 03:14:35.728295
4|Josh|55|Oreck|2016-03-18 03:14:35.730066|2016-03-18 03:14:35.730066
5|John|27|Smith|2016-03-18 03:14:35.731875|2016-03-18 03:14:35.731875
6|Bill|75|Smith|2016-03-18 03:14:35.733431|2016-03-18 03:14:35.733431
7|LeBron|30|James|2016-03-18 03:14:35.735518|2016-03-18 03:14:35.735518

>.exit


GO to console: rails c

> bron = Person.find_by last_name: "James"

> Person.where("age BETWEEN 30 and 33").to_a

> Person.find_by("first_name LIKE '%ric'")



##Array condition Syntax
> Person.where("age BETWEEN ? and ?", 28, 34).to_a

> Person.find_by("first_name LIKE ?", '%ric').to_a



##Hash condition Syntax
> Person.where("age BETWEEN :min_age AND :max_age", min_age: 20, max_age:30).to_a

> Person.find_by("first_name LIKE :pattern", pattern: '%ron').to_a



##加入 login & pass fields to people table

$ rails g migration add_login_pass_to_people login pass

##/db/migrate/20160318032557_add_login_pass_to_people.rb 會記載資料庫表格的修改 各欄位名稱與類型

$ rake db:migrate

##重新修改seed.rb

Person.destroy_all

Person.create! [
    {first_name: "Eric", last_name: "Tsai", age: 25, login: "eric", pass: "abc123"},
    {first_name: "John", last_name: "What", age: 23, login: "john", pass: "abc111"},
    {first_name: "Michael", last_name: "Sean", age: 15, login: "mmike", pass: "5566"},
    {first_name: "Josh", last_name: "Oreck", age: 55, login: "jojo", pass: "123xyz"},
    {first_name: "John", last_name: "Smith", age: 27, login: "nhoj", pass: "j4422"},
    {first_name: "Bill", last_name: "Smith", age: 75, login: "gates", pass: "richer"},
    {first_name: "LeBron", last_name: "James", age: 30, login: "strong", pass: "232323"}
]



## id自動給定會延續上一次的消除
$ rake db:seed

8|Eric|25|Tsai|2016-03-18 03:43:15.704533|2016-03-18 03:43:15.704533|eric|abc123
9|John|23|What|2016-03-18 03:43:15.710524|2016-03-18 03:43:15.710524|john|abc111
10|Michael|15|Sean|2016-03-18 03:43:15.713423|2016-03-18 03:43:15.713423|mmike|5566
11|Josh|55|Oreck|2016-03-18 03:43:15.715460|2016-03-18 03:43:15.715460|jojo|123xyz
12|John|27|Smith|2016-03-18 03:43:15.717496|2016-03-18 03:43:15.717496|nhoj|j4422
13|Bill|75|Smith|2016-03-18 03:43:15.719838|2016-03-18 03:43:15.719838|gates|richer
14|LeBron|30|James|2016-03-18 03:43:15.721826|2016-03-18 03:43:15.721826|strong|232323


##A person who want to login
##rails c

> login = 'jojo'; pass = "123xyz"
> Person.where("login = '#{login}' AND pass = '#{pass}'")



##SQL injection

> login = 'josh'

##always true
> pass = "ggugghgk' OR 'x' = 'x"

> Person.where("login = '#{login}' AND pass = '#{pass}'")




##one to one association


##ER diagram: entity relational diagram

##1 to 1: one person to one person info

##1 to many: one person to many job
ex. eric  teaching / sales/ researching....

##many to many: person <--> hobby


### 已經有Person, 建立 personal_info, 要使其指向Person用person:references

$ rails g model personal_info height:float weight:float person:references

$ rake db:migrate

##需要編輯/app/models/person.rb, 告知資料庫關係:
```ruby
class Person < ActiveRecord::Base
    has_one :personal_info
end
```


$ rails db

>.schema personal_infos


##ruby consolerails c --sandbox

##rails c

> eric = Person.find_by first_name: "Eric"

> pil1 = PersonalInfo.create height: 6.5, weight: 220

> eric.personal_info = pil1

##rails db

> select * from personal_infos;
> select * from people;



##Build just in memory
> bill = Person.find_by first_name: "Bill"
> bill.build_personal_info height: 6.5, weight: 220
> bill.save
###Create
bill = Person.find_by first_name: "Bill"
bill.create_personal_info height: 6.5, weight: 220



##one to many relation

$ rails g model job title company position_id person:references

$ rake db:migrate

##
```ruby
class Person < ActiveRecord::Base
    has_one :personal_info
    has_many :jobs
end
```

##rails c
```
Job.create company: "MS", title: "Developer", position_id: "#1234"
p1 = Person.first
p1.jobs << Job.first  OR person.jobs = jobs
Job.first.person
```

person.jobs.clear



##edit: add these code to seed.rb

```ruby
Person.first.jobs.create! [
    { title: "Developer", company: "MS", position_id: "#1234"},
    { title: "Developer", company: "MS", position_id: "#1235"}
]

Person.last.jobs.create! [
    { title: "Sr. Developer", company: "MS", position_id: "#5234"},
    { title: "Sr. Developer", company: "MS", position_id: "#5235"}
]
```
```
rake db:seed
```


##rails c
```
Person.first.jobs.where(company: "MS").count
```

has_many has_one belongs_to

##support
dependent:
:delete
:destory
:nullify

##many to many
contain two models and three Migration

has_and_belongs_to_many: habtm

Hobbies_People

## rails
```
rails g model hobby name
rails g migration create_hobbies_people person:references hobby:references
```

## no need primary key since it's a join table

```ruby
class CreateHobbiesPeople < ActiveRecord::Migration
  def change
    create_table :hobbies_people, id: false do |t|
      t.references :person, index: true, foreign_key: true
      t.references :hobby, index: true, foreign_key: true
    end
  end
end
```
```
rake db:migrate
```
```
rails db
.schema %hobbies%
```
##models
```ruby
##person.rb
class Person < ActiveRecord::Base
    has_one :personal_info
    has_many :jobs
    has_and_belongs_to_many :hobbies
end
```

```ruby
##hobby.rb
class Hobby < ActiveRecord::Base
    has_and_belongs_to_many :people
end
```


```
rails c

josh = Person.find_by first_name: "Josh"

lebron = Person.find_by first_name: "LeBron"

prog = Hobby.create name: "Programming"

josh.hobbies << prog; lebron.hobbies << prog
```


## grandchild relationship user -> articles -> comments, salary range for a person
:through

##

```
rails g model salary_range min_salary:float max_salary:float job:references
```

```
rake db:migrate
```

##

```ruby
#job.rb
class Job < ActiveRecord::Base
  belongs_to :person
  has_one :salary_range
end
```
```ruby
#salary_range.rb
class SalaryRange < ActiveRecord::Base
  belongs_to :job
end
```
```ruby
#person.rb
class Person < ActiveRecord::Base
    has_one :personal_info
    has_many :jobs
    has_and_belongs_to_many :hobbies
    has_many :approx_salaries, through: :jobs, source: :salary_range
end
```
##rails c
```
lebron = Person.find_by(first_name: "LeBron")
lebron.jobs.count
lebron.jobs.pluck(:id)
Job.find(4).create_salary_range(min_salary: 10000.00, max_salary: 20000.00)
Job.find(5).create_salary_range(min_salary: 15000.00, max_salary: 35000.00)
lebron.approx_salaries
```


##Scope

> default_scope { order :name}
```ruby
class Hobby < ActiveRecord::Base
    has_and_belongs_to_many :people
    default_scope { order :name}
end
```
> named_scope
```ruby
class Person < ActiveRecord::Base
    has_one :personal_info, dependent: :destroy
    has_many :jobs
    has_and_belongs_to_many :hobbies
    has_many :my_jobs, class_name: "Job"
    has_many :approx_salaries, through: :jobs, source: :salary_range

    def max_salary
        approx_salaries.maximum(:max_salary)
    end

    scope :ordered_by_age, -> { order age: :desc }
    scope :starts_with, -> (starting_string){ where("first_name LIKE ?", "#{starting_string}%") }
end
```
> :method_name 都可以自己定義 scope :oba, -> { order age: :desc }

##rails c
```
reload!
Person.ordered_by_age
Person.ordered_by_age.starts_with("Jo").pluck :age, :first_name
```

##validations

Make sure the field contains some data (it's not nil):
presence: true

Make sure no record already exists
uniqueness: true


```ruby
class Job < ActiveRecord::Base
  belongs_to :person
  has_one :salary_range
  validates :title, :company, presence: true
end
```
:numericality
:length
:format
:inclusion
:exclusion

validate
errors.add

```ruby
class SalaryRange < ActiveRecord::Base
  belongs_to :job

  validate :min_is_less_than_max

  def min_is_less_than_max
      if min_salary > max_salary
          errors.add(:min_salary, "Cannot be greater than maximum salary!")
      end
  end
end
```

## [RoR](http://guides.rubyonrails.org/)


## N+1 Queries

Person.all.each { |p| puts p.personal_info.weight}

==> better

Person.includes(:personal_info)all.each { |p| puts p.personal_info.weight}


## transactions

## 要內有條件都達成才算數

ActiveRecord::Base.transaction do
    david.withdrawal(100)
    mary.deposit(100)
end
