Gem::Specification.new do |gem|
  gem.name        = 'popit_representers'
  gem.version     = '0.0.10'
  gem.date        = '2014-01-07'
  gem.summary     = "Representers for the pop-it module of the Poplus project."
  gem.description = "Representers for the pop-it module of the Poplus project. These provide object-like access to remote data, using Resource-Oriented Architectures in Ruby (ROAR)."
  gem.authors     = ["Marcel Augsburger"]
  gem.email       = 'lab@ciudadanointeligente.org'
  gem.homepage    = 'https://github.com/ciudadanointeligente/billit_representers'
  gem.license     = 'GPL-3'

  gem.files       = `git ls-files`.split("\n")

  gem.add_runtime_dependency "roar", "0.11.19"
  gem.add_runtime_dependency "activemodel"
end