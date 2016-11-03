stuff: .validate-stamp generate-stuff
	@./generate-stuff
validate: .validate-stamp
upload: .upload-stamp

clean::
	$(RM) .upload-stamp .validate-stamp validate-versions generate-stuff \
	      generate-htaccess .htaccess *.o *.hi

.PHONY: validate stuff upload clean

upload_files := .htaccess

.upload-stamp: .validate-stamp $(upload_files)
	scp $(upload_files) people.freedesktop.org:public_html/
	@touch $@

.validate-stamp: nvidia-versions.txt validate-versions
	@./validate-versions
	@touch $@

% : %.hs
	ghc --make $@

validate-versions: NVVersionParser.hs
generate-stuff: NVVersionParser.hs URLs.hs
generate-htaccess: NVVersionParser.hs

.htaccess: generate-htaccess nvidia-versions.txt
	./generate-htaccess > $@
