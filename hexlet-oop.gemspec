lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hexlet/oop/version'

Gem::Specification.new do |spec|
  spec.name          = 'hexlet-oop'
  spec.version       = Hexlet::Oop::VERSION
  spec.authors       = ['Naumenko Nikita']
  spec.email         = ['naumenkoniki@gmail.com']

  spec.summary       = 'Hexlet oop workshop task'
  spec.description   = 'Hexlet oop workshop task'
  spec.homepage      = 'https://github.com/NikitaNaumenko/hexlet-oop-4'
  spec.license       = 'MIT'

  # # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # # to allow pushing to a single host or delete this section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  #   spec.metadata["homepage_uri"] = spec.homepage
  #   spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  #   spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against " \
  #     "public gem pushes."
  # end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.require_paths = ['lib']

  spec.add_development_dependency 'awesome_print'
  spec.add_development_dependency 'bundler', '~> 1.17'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rspec-power_assert'
  spec.add_development_dependency 'rubocop', '~> 0.63.1'
end
