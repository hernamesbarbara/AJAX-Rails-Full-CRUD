require 'spec_helper'

describe "widgets/edit" do
  before(:each) do
    @widget = assign(:widget, stub_model(Widget,
      :name => "MyString",
      :description => "MyString"
    ))
  end

  it "renders the edit widget form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => widgets_path(@widget), :method => "post" do
      assert_select "input#widget_name", :name => "widget[name]"
      assert_select "input#widget_description", :name => "widget[description]"
    end
  end
end
