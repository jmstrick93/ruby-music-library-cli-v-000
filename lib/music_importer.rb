class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    dir = Dir.entries(self.path)
    modified = dir.delete_if {|file| !file.end_with?(".mp3")}
    modified
  end

  def import
    self.files.each do |file|
      Song.create_from_filename(file)
    end
  end

end
