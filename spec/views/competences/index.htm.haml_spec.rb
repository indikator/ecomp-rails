require 'spec_helper'

describe 'competences/index.html.haml' do

  it 'should list of competence groups' do
    render
    expect(rendered).to have_selector('.competencegroup')
  end
end