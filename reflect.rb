require 'asciidoctor'
doc = Asciidoctor.load_file(ARGV.first, :safe => 'server')
puts doc.doctitle
puts doc.author
puts doc.attributes["email"]
