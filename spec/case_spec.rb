require 'spec_helper'

describe Case do
  before(:each) do
    @case = Case.new
  end

  context 'camel case' do
    describe 'setup' do
      it 'has a to_camel_case method' do
        expect(@case).to respond_to(:to_camel_case)
      end

      it 'to_camel_case accepts an input' do
        expect(@case).to respond_to(:to_camel_case).with(1).argument
      end
    end

    describe 'basic functionality' do
      it 'correctly handles nil by returning an empty string' do
        expect(@case.to_camel_case).to eq("")
      end

      it 'correctly handles empty string by returning an empty string' do
        expect(@case.to_camel_case("")).to eq("")
      end

      it 'accepts numbers and returrns the string for them' do
        expect(@case.to_camel_case(1)).to eq("1")
        expect(@case.to_camel_case(1.5)).to eq("1.5")
      end
    end

    describe 'full functionality' do
      it 'returns a string without modification if none is needed' do
        expect(@case.to_camel_case("foo")).to eq("foo")
      end

      it 'returns a camel case string if given one' do
        expect(@case.to_camel_case("fooBar")).to eq("fooBar")
      end

      it 'returns a camel case string if given snake case' do
        expect(@case.to_camel_case("foo_bar")).to eq("fooBar")
      end
    end

    describe 'benchmarks' do
      it 'performs the camel in Rust at least 10 times faster than Ruby' do
        expect {

          @case.to_camel_case("foo_bar_is_a_string")

        }.to perform_faster_than(time: 1.4, warmup: 1.2) {

          @case.ruby_to_camel_case("foo_bar_is_a_string")

        }.at_least(12).times
      end
    end
  end

  context 'snake case' do
    describe 'setup' do
      it 'has a to_snake_case method' do
        expect(@case).to respond_to(:to_snake_case)
      end

      it 'to_snake_case accepts an input' do
        expect(@case).to respond_to(:to_snake_case).with(1).argument
      end
    end

    describe 'basic functionality' do
      it 'correctly handles nil by returning an empty string' do
        expect(@case.to_snake_case).to eq("")
      end

      it 'correctly handles empty string by returning an empty string' do
        expect(@case.to_snake_case("")).to eq("")
      end

      it 'accepts numbers and returrns the string for them' do
        expect(@case.to_snake_case(1)).to eq("1")
        expect(@case.to_snake_case(1.5)).to eq("1.5")
      end
    end

    describe 'full functionality' do
      it 'returns a string without modification if none is needed' do
        expect(@case.to_snake_case("foo")).to eq("foo")
      end

      it 'returns a snake case string if given one' do
        expect(@case.to_snake_case("foo_bar")).to eq("foo_bar")
      end

      it 'returns a snake case string if given camel case' do
        expect(@case.to_snake_case("fooBar")).to eq("foo_bar")
      end
    end

    describe 'benchmarks' do
      it 'performs the snake in Rust at least 30 times faster than Ruby' do
        expect {

          @case.to_snake_case("fooBarIsAString")

        }.to perform_faster_than(time: 2.4, warmup: 2.2) {

          @case.ruby_to_snake_case("fooBarIsAString")

        }.at_least(35).times
      end
    end
  end
end
