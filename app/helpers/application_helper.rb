module ApplicationHelper
  def cms_inheritable_block_content(identifier, blockable = @cms_page)
    content = cms_block_content(identifier, blockable)
    return cms_inheritable_block_content(identifier, blockable.parent) if content.blank? && blockable.parent
    content
  end
end
