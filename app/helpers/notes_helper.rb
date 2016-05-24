module NotesHelper
  def short_title(title)
    if title.length > 50
      title[0..50] + ' ...'
    else
      title
    end
  end

  def split_quote(quote)
    quote.split(';;')
  end
end
