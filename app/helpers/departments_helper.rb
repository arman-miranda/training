module DepartmentsHelper
  def list_all_users(model)
    html_output = ""

    model.users.each do |user|
      html_output << "<tr><td>#{user.last_name}</td>"
      html_output << "<td>#{user.first_name}</td>"
      html_output << "<td>#{user.position}</td></tr>"
    end

    html_output
  end
end
