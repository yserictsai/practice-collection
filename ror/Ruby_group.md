





# 物件導向

1. 將資料的概念從被動轉為主動，讓資料變成是能夠運作的機器

2. 機器運作可能包涵 **遞增數值 重設 顯示數值 等**

3. 會有模板當作樣式 **class** 由樣式產出個別的機器 **object**

4. 大部份語言都會要求必須先有 **class** 才能有 **object**

	*4.1. Ruby 沒有此限制*


# 方法

1. 用.符號呼叫物件的方法

```
"abcsdd".length

foo = "abc"
foo.length

array = ['ad', 'asd']
array.length
```

2. 當方法有可輸入參數, **Ruby** 可以省略括弧

	```
object.method(arg1, arg2)
	```

3. self變數, 會指向現在的物件（也就是呼叫此方法的物件）



# 類別

1. 定義類別**class**後(命名字首為大寫), 屬於該類別的物件就稱為實例**instance**

2. 定義Dog類別**class**,以及speak方法**method**.
```
class dog
	def speak
		puts "wowow"
	end
end
```

3. 實體化：建立狗界中的新實例**instance**(某一種狗 pochi), 而它具有所有狗類別的方法
```
pochi = Dog.new
pochi.speak
```
4. 甚至可以用完即丟
```
Dog.new.speak
```


# 繼承

1. 可以想像大類別具有通則, 小類別繼承大類別後具有通則且能夠發展個性化法則

```
class Mammal
	def breathe
		puts 'inhale and exhale'
	end
end

class Cat	< Mammal
	def speak
		puts 'Meow'
	end
end

tama = Cat.new
tama.breathe
tama.speak
```

2. 若大類別的通則, 在小類別中不符合或需要修正, 可以覆寫override

```
class Bird
	def preen
		puts "I'm cleaning my feathers"
	end

	def fly
		puts "I'm flying"
	end
end

class Pengiun < Bird
	def fly
		fail "sorry"
	end
end
```

3. 重新定義方法, 將方法升級延伸 **super**

```
class Human
	def identify
		puts "I'm persion"
	end

	def train_toll(age)
		if age < 12
			puts "reduced fare";
		else
			puts "normal";
		end
  end
end

class Student < Human
	def identify
		super
		puts "I'm a student too."
	end
end


class DD < Human
	def train_toll(age)
		super(11)
	end
end

class GG < Human
	def train_toll
		super(age)
	end
end

DD.new.train_toll(25)
GG.new.train_toll(25)
```


# 存取控制 access controls (Ruby沒有函數**function**, 只有方法**method**, 但不只一種方法)


1. 最高層級, Ruby將他指定為object類別, 所有物件都能使用這個方法 （所有類別的私有方法 **private**）是不能被呼叫的, 只能在類別裡面被使用。

```
def square(n)
	n * n
end

square(5)
```
```
class Foo
	def fourth_power_of(x)
		square(x) * square(x)
	end
end

Foo.new.fourth_power_of 10

```


2. 無法, private method 'square' called for 'ff':string

```
"ff".square(5)
```
？？這樣就能聰明的保留 Ruby 的純物件導向特質（函數仍為物件方法，只是接收器 (receiver) 是隱含的 self 而已）。

3. **private** 能讓不同類別擁有外界不知道的方法, engine, 使用者看不到

```
class Test
	def times_two(a)
		puts "#{a} times two is #{engine(a)}"
	end
	def engine(b)
		b*2
	end
	private:engine
end

tst = Test.new
tst.times_two(6)
```

# 單件方法 Singleton method

1. 實例 **instance** 的行為由所屬的類別決定, Ruby能為所有物件提供自己的方法 (像是由一類別建立實體再利用實體定義自己的方法)

```
class AA
	def size
		25
	end
end

test1 = AA.new
test1.size

test2 = AA.new
def test.size
	10
end
```

# 模組 module 與類別class 相似
## 但是...

1. 模組沒有實例**instance**
2. 模組沒有子類別
3. 模組的Module類別就是類別的class類別的父類別 幹啥小啦


#### 模組一 將各式方法與常數收集在一起

1. 常數會用::
```
Math.sqrt(2)
Math:PI
```
2. 或者include
```
include Math
sqrt(2)
PI
```

#### 模組二 混入用法（mixin: 有多重繼承的概念, 繼承多個父類別, Ruby並沒有真正的多重繼承, 但可以利用mixin)

1. 在類別中include模組混入, 例如一個有each方法的類別混入Enumerable模組後就能使用sort方法及find方法



# 程序物件

1. 使用Proc.new, 建立新的程序物件 **procedure object**

？好奇  xxx.new { xxx }
```
quux = Proc.new {
	puts "asdjflk;d"
}
quux.call

def run(p)
	puts "about to call a procedure"
	p.call
	puts "done"
end

run quux   #ruby慣例 參數可以不用括號
```

2. trap, 針對任何系統信號, 指派不同應對策略
此例：一般來說，按下 ^C 會離開直譯器。現在，會輸出一個訊息，然後直譯器繼續運行，不會失去正在進行的工作。（你不會一直受困於直譯器內，隨時都可以輸入 exit 來離開。）
```
inthandler = Proc.new {
	puts "ctrl+c was pressed."
}
trap "SIGINT", inthandler


trap("SIGINT"){ puts "ctrl+c was pressed." }
```

# 變數

1. 無型別
	$全域變數 **global**
	＠實例變數 **instance**
  [a-z]或_區域變數 **local**

2. 一種常數
3. 兩種擬變數 **pseudo-variable**
	self 永遠指示目前正在執行的物件
	nil 未初始化變數
