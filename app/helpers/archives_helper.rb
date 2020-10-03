module ArchivesHelper 
  def archive_link(archive)
    "#{request.protocol}#{archive.slug}.#{request.host}"
  end
end

