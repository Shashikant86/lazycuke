def lazycuke_scaffold
  if File.exists?(@features_dir)
    puts "Delete existing feature directoty"
    exit 1
  end

  FileUtils.cp_r(@source_dir, @features_dir)

  msg("Info") do
    puts "features subdirectory created. \n"
  end

end
