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
end
