Gem::Specification.new do |s|
  s.name          = 'lazy_comments'
  s.version       = '0.1.0'
  s.date          = '2013-08-18'
  s.summary       = "A Rails commenting gem that handles mentions"
  s.description   = "Hello world version of a commenting gem"
  s.authors       = ["Damon Aw"]
  s.email         = 'daemonsy@gmail.com'
  s.files         = `git ls-files`.split("\n")
  s.require_paths = ["lib"]
  s.homepage      = 'http://github.com/daemonsy/lazy_comments'
  s.license       = 'MIT'

  s.add_runtime_dependency 'rails', ['>= 4']

  s.add_development_dependency 'rspec', "2.14.1"
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'guard'
  s.add_development_dependency 'guard-rspec'
end