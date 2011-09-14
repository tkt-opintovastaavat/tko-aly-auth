# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "tko-aly-auth/version"

Gem::Specification.new do |s|
  s.name        = "tko-aly-auth"
  s.version     = TKOaly::Auth::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Sami Saada"]
  s.email       = ["saada@cs.helsinki.fi"]
  s.homepage    = ""
  s.summary     = %q{Authenticates with TKO-äly}
  s.description = %q{Uses TKO-äly's systems to authenticate and can be used to authorize against roles.}

  s.rubyforge_project = "tko-aly-auth"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
