Gem::Specification.new do |s|
  s.name          = 'fylorg'
  s.version       = '0.0.1'
  s.licenses      = ['MIT']
  s.summary       = 'File Organizer'
  s.description   = 'Organize files by name automatically'
  s.authors       = ['Sreedev Kodichath']
  s.email         = 'sreedevpadmakumar@gmail.com'
  s.files         = [
    'bin/fylorg',
    'lib/cli.rb',
    'lib/fylorg/confparser.rb',
    'lib/fylorg/fileman.rb',
    "lib/fylorg/matcher.rb",
    'lib/fylorg.rb'
  ]
  s.homepage              = 'https://sree.dev/'
  s.metadata              = { 'source_code_uri' => 'https://github.com/sreedevk/fylorg' }
  s.bindir                = 'bin'
  s.required_ruby_version = '>= 2.7.2'
  s.executables   << 'fylorg'
  s.post_install_message = <<-POSTMSG
  Thank you for installing fylorg
  you may have to reshim if you use asdf/rbenv.
  POSTMSG
end
