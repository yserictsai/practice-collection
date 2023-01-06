Enter RSpec + Capybara ruby gems. When these 2 frameworks come together, you can write very intuitive and expressive tests.

For example, can you tell what the following test does?

describe "Recipes App" do
  it "displays chocolate by default" do
    visit "/"
    expect(page).to have_content 'Chocolate Tea'
  end

  it "displays beef when keyword is beef" do
    visit "?keyword=beef"
    expect(page).to have_content 'Delicious Scalloped Potato'   
  end
end




How do I get started?

1.Install PhantomJS (http://phantomjs.org/)
2.Run the following inside your terminal:

$ gem install rspec
$ gem install selenium-webdriver
$ gem install capybara
$ gem install poltergeist

3.(If you are using rbenv, also run $rbenv rehash)
4.Pull down this repo
5.Run the following in your terminal (right outside of spec dir):

$ rspec
or even better

$ rspec -f d
to see the magic.

rspec --format documentation
