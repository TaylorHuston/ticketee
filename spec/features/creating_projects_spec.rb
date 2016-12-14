require "rails_helper"

RSpec.feature "Users can create new projects" do
  before do
    visit "/"
    
    click_link "New Project"
  end
  
  scenario "with valid attributes" do
    fill_in "Name", with: "Sublime Text 3"
    fill_in "Description", with: "A test editor"
    click_button "Create Project"
  
    expect(page).to have_content "Project has been created." #Reads Flash
    
    project = Project.find_by(name: "Sublime Text 3")
    expect(page.current_url).to eq project_url(project) #Ensures you're on the proper show page
    
    title = "Sublime Text 3 - Projects - Ticketee"
    expect(page).to have_title title #Match page title
    
  end
  
  scenario "when providing invalid attributes" do
    click_button "Create Project"
    
    expect(page).to have_content "Project has not been created"
    expect(page).to have_content "Name can't be blank"
  end
  
end
