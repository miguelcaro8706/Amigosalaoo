module ApplicationHelper
  def name_with_email(person)
    "#{person.full_name} (#{person.email})"
  end
end
