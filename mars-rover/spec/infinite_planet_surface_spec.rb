require 'infinite_planet_surface'
require 'position'

RSpec.describe InfinitePlanetSurface do
  let(:surface) { InfinitePlanetSurface.new }

  it 'always returns an unchanged position' do
    position = Position.new(1000000, -99999999)
    result = surface.position(position)
    expect(result).to eq Position.new(1000000, -99999999)
  end
end
