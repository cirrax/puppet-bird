# frozen_string_literal: true

require 'spec_helper'

describe 'bird::condprint' do
  it { is_expected.to run.with_params('p').and_return('') }
  it { is_expected.to run.with_params('p', true).and_return('p on') }
  it { is_expected.to run.with_params('p', false).and_return('p off') }
  it { is_expected.to run.with_params('p', 'p').and_return('p p') }
  it { is_expected.to run.with_params('p', 3).and_return('p 3') }
  it { is_expected.to run.with_params('p', 'p', ';', true).and_return('p "p" ;') }
end
