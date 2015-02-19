#!/usr/bin/ruby

require 'csv_to_popolo'
require 'minitest/autorun'

describe "rawdata" do

  subject { 
    Popolo::CSV.from_data(<<-eos
given_name,family_name
Fred,Bloggs
eos
  )}

  let(:fred)  { subject.data[:persons].first }

  it "should have the given name" do
    fred[:given_name].must_equal 'Fred'
  end

  it "should have the family name" do
    fred[:family_name].must_equal 'Bloggs'
  end

  it "should be given an id" do
    fred[:id].must_match /person\/[[:xdigit:]]+/
  end

end
