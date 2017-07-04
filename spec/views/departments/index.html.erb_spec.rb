require 'rails_helper'

RSpec.describe "departments/index", type: :view do
  before(:each) do
    assign(:departments, [
      Department.create!(
        :name => "Name"
      ),
      Department.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of departments" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
