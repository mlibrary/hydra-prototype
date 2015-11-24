module DeepBlue::CollectionsHelper
  def decomma(s)
    if s.is_a?(Array)
      return s.join("\n")
    end
    s.gsub(/,\s*/, "\n")
  end
end
