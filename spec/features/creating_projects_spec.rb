require "rails_helper"

RSpec.feature "Users can create new projects" do
  scenario "with valid attributes" do
    visit "/"
  
    click_link "New Project"
  
    fill_in "Name", with: "Sublime Text 3"
    fill_in "Description", with: "A test editor"
    click_button "Create Project"
  
    expect(page).to have_content "Project has been created." #Reads Flash
    
    project = Project.find_by(name: "Sublime Text 3")
    expect(page.current_url).to eq project_url(project) #Ensures you're on the proper show page
    
    title = "Sublime Text 3 - Projects - Ticketee"
    expect(page).to have_title title #Match page title
    
  end
end
