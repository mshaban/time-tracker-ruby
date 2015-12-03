module ApplicationHelper

  def nav_items
    [
        {
            display_text: 'Companies',
            li_controller_name: 'companies',
            url: companies_path
        },
        {
            display_text: 'Projects',
            li_controller_name: 'projects',
            url: projects_path
        },
        {
            display_text: 'Works',
            li_controller_name: 'works',
            url: works_path
        }
    ]

  end

  def display_nav_item(display_text, li_controller_name, url)
    raw("<li #{controller_name == li_controller_name ? 'class="active"' : ''}> #{link_to display_text, url}</li>")
  end

  def display_nav
    nav = raw('<ul>')
    nav_items.each do |nav_item|
      nav << display_nav_item(nav_item[:display_text], nav_item[:li_controller_name], nav_item[:url])
    end
    nav << raw('</ul>')
  end

  def user_logged_in_msg
		str = ''
		str += '<div class="userloggedin">'
		if user_signed_in?
			str += "<p id=""user_info"">#{current_user}<br>#{link_to('Logout', destroy_user_session_path, :method => :delete)}</p>"
		else
			str += "<p id=""user_info"">#{link_to('Login', new_user_session_path)} | #{link_to('Register', new_user_registration_path)}</p>"
		end
		str += '</div>'
		raw(str)
	end
end
