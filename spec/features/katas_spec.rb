require 'rails_helper'
require 'capybara'

describe 'Kata' do	
	it 'can be read jeje' do
		kata_title = 'Second title'
		kata_description = 'Second description'
		create_kata
		create_kata(title: kata_title, description: kata_description)

		visit root_path
		click_on(kata_title)

		expect(page).to have_content(kata_title)
		expect(page).to have_content(kata_description)
	end

	it 'can be created' do
		kata_title = 'Kata Sith'
		kata_description = 'Kata kill'

		visit root_path
		click_on('New Kata')
		fill_in(:title, with: kata_title)
		fill_in(:description, with: kata_description)
		click_on('Save')

		expect(page).to have_content(kata_title)
		expect(page).to have_content(kata_description)
	end


	it 'can be updated' do
		create_kata

		kata_title_u = 'Kata update'
		kata_description_u = 'Kata update desc'

		visit root_path
		click_on('Edit Kata')
		fill_in(:kata_title, with: kata_title_u)
		fill_in(:kata_description, with: kata_description_u)
		click_on('Save')

		expect(page).to have_content(kata_title_u)
		expect(page).to have_content(kata_description_u)
	end

	def create_kata(title: 'Kata title', description: 'May the force be with you')
		kata = Kata.new(title: title, description: description)
		kata.save

		kata
	end
end
