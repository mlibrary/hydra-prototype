module DeepBlue::CollectionsHelper
  def decomma(s)
    s.gsub(/,\s*/, "\n")
  end
end
