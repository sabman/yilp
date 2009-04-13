# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{yilp}
  s.version = "0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Shoaib Burq & David Troy"]
  s.date = %q{2009-04-13}
  s.description = %q{Ruby wrapper arround Yahoo Internet Location Platform}
  s.email = %q{shoaib@nomad-labs.com}
  s.extra_rdoc_files = ["lib/yilp.rb", "README.rdoc"]
  s.files = ["config/yilp_appid.yml", "lib/yilp.rb", "Manifest", "Rakefile", "README.rdoc", "spec/fixtures/places_sydney.xml", "spec/fixtures/placetypes.xml", "spec/fixtures/woid_1105779.xml", "spec/fixtures/woid_1105779_ancestors.xml", "spec/fixtures/woid_1105779_belongto.xml", "spec/fixtures/woid_1105779_children.xml", "spec/fixtures/woid_1105779_neighbors.xml", "spec/fixtures/woid_1105779_parent.xml", "spec/fixtures/woid_1105779_siblings.xml", "spec/specs.html", "spec/yilp_spec.rb", "yilp.gemspec"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/sabman/yilp}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Yilp", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{yilp}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Ruby wrapper arround Yahoo Internet Location Platform}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<active_support>, [">= 0"])
    else
      s.add_dependency(%q<active_support>, [">= 0"])
    end
  else
    s.add_dependency(%q<active_support>, [">= 0"])
  end
end
