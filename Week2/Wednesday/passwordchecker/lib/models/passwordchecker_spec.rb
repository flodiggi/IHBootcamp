require 'rspec'
require './passwordchecker.rb'


describe Passwordchecker do

  subject {described_class.new}


  describe "#check_password" do


    let (:email) {"alex@hotmail.com"}
    let (:password) {"1LLLslexhotmail#"}
    let (:expected_output) {false}
    let (:result) { subject.check_password(email, password)}

    it "checks your password (if correct input)" do
      expect(result).to eq(expected_output)
    end
  end

end
