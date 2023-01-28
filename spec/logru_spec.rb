# frozen_string_literal: true

require 'logru'

describe Logru do
  context 'with_hash' do
    it 'should return a Logru object' do
      expect(Logru.with_hash({})).to be_a(Logru)
    end
  end
end
