module SiteHelpers

  def page_title
    title = "PlayerPro"
    if data.page.title
      title << " | " + data.page.title
    end
    title
  end
  
  def page_description
    if data.page.description
      description = data.page.description
    else
      description = "Sports managmenet from the future"
    end
    description
  end

  # Definition list items
  def define(key, value)
      """
      <dt>#{key}:</dt>
      <dd>#{value}</dd>
      """
  end

end
