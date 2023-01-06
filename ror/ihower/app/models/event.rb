class Event < ActiveRecord::Base
  validates_presence_of :name   # 儲存的內容必須要有name
end
