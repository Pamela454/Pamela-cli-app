
lib = File.expand_path("../lib", )
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "./lib/UrgentCare/version"

Gem::Specification.new do |spec|
  spec.name          = "UrgentcareCLI"
  spec.version       = Urgentcare::VERSION
  spec.authors       = ["PamelaTorres-Rocca"]
  spec.email         = ["pamela@torres-rocca.com"]

  spec.summary       = %q{UrgentCareCLI Gem}
  spec.description   = %q{Current Urgent Care wait times in Massachusetts based on location}
  spec.homepage      = "https://github.com/Pamela454/Pamela-cli-app"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  #if spec.respond_to?(:metadata)
  #  spec.metadata["allowed_push_host"] = ''
  #else
  #  raise "RubyGems 2.0 or newer is required to protect against " \
  #    "public gem pushes."
  #end
  spec.metadata["source_code_uri"] = spec.homepage
  spec.files = Dir.glob("{bin,lib}/**/*")

  #spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    #puts f
    #f.match(%r{^(test|spec|features)/})
  #end

  spec.bindir        = "bin"
  spec.executables   = ["Urgentcare"]
  spec.require_paths = ["lib"]

  spec.add_dependency "bundler", ">= 2.2.10" #locks gems to current versions
  spec.add_development_dependency "rake", "~> 13.0"    #bundle update to update
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry", "~> 0.11.3"
  spec.add_development_dependency "gem-release"
  #spec.add_development_dependency "open-uri"

  spec.add_dependency "nokogiri", ">= 1.11.4"
end
