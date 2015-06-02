require 'spec_helper'

feature "Viewing tickets" do
	before do
		user = FactoryGirl.create(:user)
		textmate_2 = FactoryGirl.create(:project, name: "Textmate 2")

		ticket = FactoryGirl.create(:ticket, project: textmate_2, title: "make it rain",
			description: "on them bitches or hoes!")
		ticket.update(user: user)

		internet_explorer = FactoryGirl.create(:project, name: "Internet Explorer")

		FactoryGirl.create(:ticket, project: internet_explorer, title: "You cray cray",
			description: "ie is for fools nigga")

		visit '/'
	end

	scenario "Viewing tickets for a given page" do
		click_link "Textmate 2"

		expect(page).to have_content("make it rain")
		expect(page).to_not have_content("You cray cray")

		click_link "make it rain"
		within("#ticket h2") do
			expect(page).to have_content("make it rain")
		end

		expect(page).to have_content("on them bitches or hoes!")
	end
end

