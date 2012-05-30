
require 'spec_helper'

describe "Static pages" do
  
  subject { page }
  
  shared_examples_for "all static pages" do
    it { should have_selector('h1',    text: heading) }
    it { should have_selector('title', text: full_title(page_title)) }
  end

  describe "Home page" do
    before { visit root_path }
    let (:heading)    { 'Sample App' }
    let (:page_title) { '' }
    
    it_should_behave_like "all static pages"
    it { should_not have_selector 'title', text: '| Home' }
  end
  
  describe "Help page" do
    before { visit help_path }
    let (:heading)    { 'Help'}
    let (:page_title) {''}
    
    it_should_behave_like "all static pages"
    it { should have_selector('title', text: full_title('Help')) }
  end
  
  describe "About page" do
    before { visit about_path }
    let (:heading)    {'About'}
    let (:page_title) {''}
    
    it_should_behave_like "all static pages"
    it { should have_selector('title', text: full_title('About Us')) }
  end
  
  describe "Contact page" do
    before { visit contact_path }
    let (:heading)    {'Contact'}
    let (:page_title) {''}
    
    it_should_behave_like "all static pages"
    it { should have_selector('title', text: full_title('Contact')) }
  end
  
  it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    page.should have_selector 'title', text: full_title("About Us")
    click_link "Help"
    page.should have_selector 'title', text: full_title("Help")
    click_link "Contact"
    page.should have_selector 'title', text: full_title("Contact Us")
    click_link "Home"
    click_link "Sign up now!"
    page.should #fill in
    click_link "sample app"
    page.should #fill in
  end
  
end









# require 'spec_helper'
# 
# describe "Static pages" do
#   
#   let(:base_title) { "Ruby on Rails Tutorial Sample App"}
#   
#   describe "Home page" do
#     it "should have the h1 'Sample App'" do
#       # visit '/static_pages/home'
#       visit root_path
#       page.should have_selector('h1', :text => 'Sample App')      
#     end
#     it "should have the base title" do
#       # visit '/static_pages/home'
#       visit root_path
#       page.should have_selector('title', 
#                           :text => "Ruby on Rails Tutorial Sample App")
#     end  
#     it "should not have a custom page title" do
#       # visit '/static_pages/home'
#       visit root_path
#       page.should_not have_selector('title', :text => '| Home')
#     end   
#   end
#     
#   describe "Help page" do
#     it "should have the h1 'Help'" do
#       # visit '/static_pages/help'
#       visit help_path
#       page.should have_selector('h1', :text => 'Help')
#     end 
#     it "should have the title 'Help'" do
#       # visit '/static_pages/help'
#       visit help_path
#       page.should have_selector('title', 
#                       :text => "#{base_title} | Help")
#     end
#   end
# 
#   describe "About page" do
#     it "should have the h1 'About Us'" do
#       # visit '/static_pages/about'
#       visit about_path
#       page.should have_selector('h1', :text => 'About Us')
#     end
#     it "should have the right title 'About Us'" do
#       # visit '/static_pages/about'
#       visit about_path
#       page.should have_selector('title',
#                         :text => "Ruby on Rails Tutorial Sample App | About Us")
#     end
#   end
# 
#   describe "Contact page" do
#     it "should have the h1 'Contact' " do
#       # visit '/static_pages/contact'
#       visit contact_path
#       page.should have_selector('h1', :text => 'Contact')
#     end
#     it "should have the right title" do
#       # visit '/static_pages/contact'
#       visit contact_path
#       page.should have_selector('title',
#                         :text => "#{base_title} | Contact Us")
#     end 
#   end
# 
# end
