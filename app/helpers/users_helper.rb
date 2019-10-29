module UsersHelper
  def language_options(lang_id, languages)
    languages.map do |lang|
      tag.option lang['title'], value: lang['id'], selected: lang_id.to_s == lang['id'].to_s
    end.join.html_safe
  end
end