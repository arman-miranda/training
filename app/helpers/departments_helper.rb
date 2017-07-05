module DepartmentsHelper
  def list_all_users(model)
    html_output = ""

    model.users.each do |user|
      html_output << "<td>#{user.last_name}</td>"
      html_output << "<td>#{user.first_name}</td>"
      html_output << "<td>#{user.position}</td>"
    end

    html_output
  end
end
