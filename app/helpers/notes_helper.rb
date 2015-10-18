module NotesHelper
  def short_title(title)
    if title.length > 20
      title[0..20] + ' ...'
    else
      title
    end
  end
end
