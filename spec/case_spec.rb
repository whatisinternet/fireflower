require 'spec_helper'

describe Case do
  context 'snake case' do
    describe 'setup' do
      before(:each) do
        @case = Case.new
      end

      it 'has a to_snake_case method' do
        expect(@case).to respond_to(:to_snake_case)
      end

      xit 'to_snake_case accepts an input' do
        expect(@case).to respond_to(:to_snake_case).with(1).argument
      end
    end

    describe 'basic functionality' do
      before(:each) do
        @case = Case.new
      end

      xit 'correctly handles nil by returning an empty string' do
        expect(@case.to_snake_case).to eq("")
      end

      xit 'correctly handles empty string by returning an empty string' do
        expect(@case.to_snake_case("")).to eq("")
      end

      xit 'accepts numbers and returrns the string for them' do
        expect(@case.to_snake_case(1)).to eq("1")
        expect(@case.to_snake_case(1.5)).to eq("1.5")
      end
    end

    describe 'full functionality' do
      before(:each) do
        @case = Case.new
      end

      xit 'returns a string without modification if none is needed' do
        expect(@case.to_snake_case("foo")).to eq("foo")
      end

      xit 'returns a snake case string if given one' do
        expect(@case.to_snake_case("foo_bar")).to eq("foo_bar")
      end

      xit 'returns a snake case string if given camel case' do
        expect(@case.to_snake_case("fooBar")).to eq("foo_bar")
      end
    end
  end
end
