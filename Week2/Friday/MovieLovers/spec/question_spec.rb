require 'rspec'
require "question.rb"

describe Question do
  subject {described_class.new}

  describe '#choosequestiontype' do

    let (:result) {subject.choosequestiontype}
    let (:expected_output) { "year" || "director" || "actor"}

    it "chooses a question type" do

      expect(result).to eq(expected_output)
    end
  end


  describe '#choosequestion' do
    input=[{:year=>1988,
            :director=>"Newt Arnold",
            :cast_members=>"Jean-Claude Van Damme"},
            {
              :year=>1998,
              :director=>"testguy",
              :cast_members=>"Josh Charles"}]


    let (:input) {input}
    let (:result) {subject.choosequestion(input,"year")}
    let (:expected_output) {1988|| 1998}

    it "chooses a question" do

      expect(result).to eq(expected_output)
    end
  end

  describe '#phrasequestion' do
    let (:questiontype) {"year"}
    let (:keyword) {"1988"}
    let (:result) {subject.phrasequestion(questiontype,keyword)}
    let (:expected_output) {"Which movie was released in 1988"}

    it "chooses a question type" do

      expect(result).to eq(expected_output)
    end
  end




end
