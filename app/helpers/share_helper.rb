module ShareHelper
  def set_tags(tag_args)
    tag_args.keys.each do |tag|
      content_for(tag, tag_args[tag])
    end
  end
end
