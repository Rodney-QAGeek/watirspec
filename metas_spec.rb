# encoding: utf-8
require File.expand_path('spec_helper', File.dirname(__FILE__))

describe "Metas" do

  before :each do
    browser.goto(WatirSpec.files + "/forms_with_input_elements.html")
  end

  describe "#length" do
    it "returns the number of meta elements" do
      browser.metas.length.should == 2
    end
  end

  describe "#[]" do
    it "returns the meta element at the given index" do
      browser.metas[1].name.should == "description"
    end
  end

  describe "#each" do
    it "iterates through meta elements correctly" do
      browser.metas.each_with_index do |m, index|
        m.content.should == browser.meta(:index, index).content
      end
    end
  end

end
