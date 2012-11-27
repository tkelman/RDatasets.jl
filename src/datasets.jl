function datasets()
  results = Array(Any, 0)
  if has(ENV, "JULIA_PKGDIR")
    package_directory = file_path(ENV["JULIA_PKGDIR"], "RDatasets", "data")
  else
    package_directory = path_expand(file_path("~/.julia", "RDatasets", "data"))
  end
  for directory in readdir(package_directory)
    for file in readdir(file_path(package_directory, directory))
      dataname = replace(file, ".csv", "")
      push(results, [directory, dataname])
    end
  end
  return results
end