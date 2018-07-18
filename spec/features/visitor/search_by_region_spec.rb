require 'rails_helper'

feature 'Search by Region' do
  scenario 'succefully' do
    region = create :region, name: 'Copacabana'
    region2 = create :region, name: 'São Paulo'
    property = create :property, region: region, title: 'Apartamento com vista para praia'
    property2 = create :property, region: region2, title: 'Apartamento com vista ao rio Tietê'

    visit root_path
    click_on region.name

    expect(page).to have_css('li', text: property.title)
    expect(page).not_to have_css('li', text: property2.title)
  end
  scenario 'and not have property for the region' do
    region = create :region, name: 'Copacabana'
    region2 = create :region, name: 'São Paulo'
    property = create :property, region: region2, title: 'Apartamento com vista para praia'
    property2 = create :property, region: region2, title: 'Apartamento com vista ao rio Tietê'

    visit root_path
    click_on region.name

    expect(page).not_to have_css('li', text: property.title)
    expect(page).not_to have_css('li', text: property2.title)
    expect(page).to have_css('p', text: 'Não há imoveis para Copacabana')
  end
end