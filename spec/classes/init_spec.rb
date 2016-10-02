require 'spec_helper'
describe 'gnome' do
  context 'with default values for all parameters' do
    it { should contain_class('gnome') }
  end
end
