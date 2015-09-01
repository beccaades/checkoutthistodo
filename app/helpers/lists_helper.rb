module ListsHelper

  def pluralize_without_count(string, count)
    count == 1 ? string : string.pluralize 
  end

end
