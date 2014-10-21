#!/usr/bin/env ruby
# This file is part of the Gentium package for TeX.
# It is licensed under the Expat License, see doc//README for details.

require 'gentium'

# encodings
encodings = EncodingSet.new
[ "ot1", "ec", "texnansi", "l7x", "qx", "t5", "ts1" ].each do |enc|
	encodings[enc] = Encoding.new(enc, true) # name, supported_by_basic
end
[ "t2a", "t2b", "t2c", "x2", "agr", "lgr" ].each do |enc|
	encodings[enc] = Encoding.new(enc, false) # name, supported_by_basic
end

# fonts
font_gentiumplus_rm  = Font.new("GentiumPlus-R", "GentiumPlus-Regular",     "gentiumplus-regular")
font_gentiumplus_it  = Font.new("GentiumPlus-I", "GentiumPlus-Italic",      "gentiumplus-italic")
font_gentiumbasic_bf = Font.new("GenBasB",       "GentiumBasic-Bold",       "gentiumbasic-bold")
font_gentiumbasic_bi = Font.new("GenBasBI",      "GentiumBasic-BoldItalic", "gentiumbasic-bolditalic")
fontlist = [font_gentiumplus_rm, font_gentiumplus_it, font_gentiumbasic_bf, font_gentiumbasic_bi]


encodings.each_value do |encoding|
	# generate 'enc' files for small caps
	if encoding.has_smallcaps? then
		# font_gentiumplus_rm is needed to check for glyph names
		encoding.generate_enc_sc(font_gentiumplus_rm)
	end

	# generate 'fd' files
	if encoding.is_used_in_latex? then
		encoding.generate_fd
	end

	# generate 'tfm' files
	fontlist.each do |font|
		font.generate_tfms(encoding)
	end

end

# generate 'map' files
encodings.generate_maps(fontlist)
