#!/bin/bash
# Prints all the source code of the talking-shit apps in one huge line

FOLDERS=(
	~/workspaces/talking-shit/android/app-helium-video-changer/src/com/androidsx/heliumvideochanger/
	~/workspaces/talking-shit/android/helium-video-core/src/com/androidsx/heliumvideocore/
	~/workspaces/talking-shit/android/helium-core/src/com/androidsx/heliumcore/
	~/workspaces/talking-shit/android/app-helium-voice-changer/src/com/androidsx/heliumvoicechanger/
)

echo "List of folders:"
for folder in ${FOLDERS[@]};
do
	echo "-" $folder
done

echo -n "" > "tmp.txt"
for folder in ${FOLDERS[@]};
do
	find $folder -type f -name "*.java" \
			| xargs cat \
			| grep -v "import " \
			| tr '\n' ' ' \
			| tr -s '[:space:]' \
			| sed -E "s/\*\*[\*]+/\*\*/g" \
			>> "tmp.txt"

	cat "tmp.txt" | tr '\n' ' ' > "source-code.txt"
done
