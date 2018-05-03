
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require_relative "./Urgentcare/version"

Gem::Specification.new do |spec|
  spec.name          = "UrgentcareCLI"
  spec.version       = Urgentcare::VERSION
  spec.authors       = ["PamelaTorres-Rocca"]
  spec.email         = ["pfrieze@gmail.com"]

  spec.summary       = %q{Current Urgent Care wait times in Massachusetts based on location.}
  spec.homepage      = "https://github.com/Pamela454/Pamela-cli-app.git"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16" #locks gems to current versions
  spec.add_development_dependency "rake", "~> 10.0"    #bundle update to update
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "nokogiri", "~> 1.8.2"
  spec.add_development_dependency "pry", "~> 0.11.3"
end
