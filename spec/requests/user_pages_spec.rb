require 'spec_helper'

describe "UserPages" do
  subject {page}
  
  describe "User pages" do
    before { visit signup_path }
    
    it { should have_selector('h1', text: 'Sign up')}
    it { should have_selector('title', text: full_title('signup')) }
  end
end
