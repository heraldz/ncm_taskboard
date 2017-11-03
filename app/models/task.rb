class Task < ActiveRecord::Base
  attr_accessible :description, :estimate, :title, :status, :person_id, :archived, :project_id, :sprint_number, :wip_started_date, :completed_at, :tested_at, :deployed_at, :requested_by, :urgent
  belongs_to :owner, :class_name => "User", :foreign_key => :person_id
  belongs_to :project
  belongs_to :requestor, :class_name => "ProductOwner", :foreign_key => :requested_by

  # Named scopes
  scope :active, where('sprint_number IS NOT NULL')
  scope :archived, where(:archived => true)
  scope :current, where('archived = 0 OR archived IS NULL')
  scope :future, where('sprint_number = 0 OR sprint_number IS NULL')
  scope :ready, where(:status => 1).where('archived = 0 OR archived IS NULL').current
  scope :inprogress, where(:status => 2).where('archived = 0 OR archived IS NULL').order(:updated_at).current
  scope :completed, where(:status => 3).where('archived = 0 OR archived IS NULL').order(:updated_at).current
  scope :tested, where(:status => 4).where('archived = 0 OR archived IS NULL').order(:updated_at).current
  scope :deployed, where(:status => 5).where('archived = 0 OR archived IS NULL').order(:updated_at).current
  
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