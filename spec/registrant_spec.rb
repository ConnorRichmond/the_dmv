require 'spec_helper'

registrant_1 = Registrant.new('Bruce', 18, true )
registrant_2 = Registrant.new('Penny', 15 )
registrant_3 = Registrant.new('Tucker', 15 )

describe Registrant do
  it 'checks registrant_1' do
    expect(registrant_1.name).to eq('Bruce')
    expect(registrant_1.age).to eq(18)
    expect(registrant_1.permit?).to eq(true)
    expect(registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
  end

  it 'checks registrant_2' do
    expect(registrant_2.name).to eq('Penny')
    expect(registrant_2.age).to eq(15)
    expect(registrant_2.permit?).to eq(false)
    expect(registrant_2.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
  end

  it 'earns permit' do
    registrant_2.earn_permit
    expect(registrant_2.permit?).to eq(true)
  end
end

