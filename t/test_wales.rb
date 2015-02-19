#!/usr/bin/ruby

require 'csv_to_popolo'
require 'minitest/autorun'

describe "welsh assembly" do

  subject { 
    Popolo::CSV.from_file('t/data/welsh_assembly.csv')
  }

  describe "Asghar" do

    let(:asghar) { subject.data[:persons].find { |i| i[:id].end_with? '=130' } }

    it "should have the correct name" do
      asghar[:name].must_equal 'Mohammad Asghar'
    end

    it "should have other_names" do
      asghar[:other_names].class.must_equal Array
      asghar[:other_names].count.must_equal 1
      asghar[:other_names].first.must_equal 'Oscar'
    end

  end

  describe "Parties" do

    let(:parties) { subject.data[:organizations].find_all { |o| o[:classification] == 'party' } }
    
    it "should have unique parties" do
      names = parties.map { |p| p[:name] }
      names.count.must_equal names.uniq.count
    end

  end


end