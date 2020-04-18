SOURCE="https://dl.google.com/linux/direct/google-chrome-beta_current_amd64.deb"
DESTINATION="build.deb"
OUTPUT="Google-Chrome-Beta.AppImage"


all:
	echo "Building: $(OUTPUT)"
	wget -O $(DESTINATION) -c $(SOURCE)

	dpkg -x $(DESTINATION) build
	rm -rf AppDir/opt

	mkdir --parents AppDir/opt/application
	mv build/opt/google/chrome-beta/* AppDir/opt/application

	chmod +x AppDir/AppRun

	bin/appimagetool.AppImage AppDir $(OUTPUT)

	chmod +x $(OUTPUT)

	rm -f $(DESTINATION)
	rm -rf AppDir/opt
	rm -rf build
