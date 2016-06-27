require 'rspec'
require "search.rb"

describe SearchMovie do
  subject {described_class.new}

  describe '#search_movie' do

    let (:input) {"Star Wars"}
    let (:result) {subject.search_movie(input)}
    let (:expected_output) {movies}

    it "searches movies depending on keyword input" do
      expect(result.class).to eq(Array)
    end
  end

end
