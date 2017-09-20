class Task < ActiveRecord::Base
  attr_accessible :description, :estimate, :title, :status, :person_id, :archived, :project_id, :sprint_number, :wip_started_date, :completed_at, :tested_at, :deployed_at, :requested_by, :urgent
  belongs_to :owner, :class_name => "User", :foreign_key => :person_id
  belongs_to :project
  belongs_to :requestor, :class_name => "ProductOwner", :foreign_key => :requested_by

  # Named scopes
  scope :archived, where(:archived => true)
  scope :current, where('archived = FALSE OR archived IS NULL')
  
  
  # Callback methods
  after_create :check_urgent
  
  def check_urgent
    if self.urgent == true
      sprint_number = Time.now.strftime("%U%Y").to_i
      self.update_attributes(:sprint_number => sprint_number)
    end  
  end  
  
  def generate_sprint_number
    self[:sprint_number] = Time.now.strftime("%U%Y").to_i
  end
  
  private
    
end