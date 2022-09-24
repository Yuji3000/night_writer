require 'rspec'
require './lib/night_writer'

describe '#initialize' do
  it 'exists' do
    nightwriter = NightWriter.new('../tester.txt', '../cat.txt')
    expect(nightwriter).to be_an_instance_of(NightWriter)
  end
end