# encoding: utf-8
require File.expand_path("../spec_helper", __FILE__)

describe "Spans" do

  before :each do
    browser.goto(WatirSpec.url_for("non_control_elements.html"))
  end

  bug "http://github.com/jarib/celerity/issues#issue/25", :celerity do
    describe "with selectors" do
      it "returns the matching elements" do
        expect(browser.spans(class: "footer").to_a).to eq [browser.span(class: "footer")]
      end
    end
  end

  describe "#length" do
    it "returns the number of spans" do
      expect(browser.spans.length).to eq 6
    end
  end

  describe "#[]" do
    it "returns the p at the given index" do
      expect(browser.spans[0].id).to eq "lead"
    end
  end

  describe "#each" do
    it "iterates through spans correctly" do
      count = 0

      browser.spans.each_with_index do |s, index|
        expect(s.id).to eq browser.span(index: index).id
        count += 1
      end

      expect(count).to be > 0
    end
  end

end
