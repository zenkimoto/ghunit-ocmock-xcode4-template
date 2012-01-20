#!/bin/bash

# GHUnit/OCMock Xcode 4 Template Install Script
# 
# Note: To give credit where credit is due, this is a heavily modified install 
#       script based on the Cocos2d-iPhone Xcode Template Install Script.
#       http://www.cocos2d-iphone.org

echo "GHUnit/OCMock Xcode 4 Template Installer"

BASE_TEMPLATE_PATH="$HOME/Library/Developer/Xcode/Templates"
PROJECT_TEMPLATE_DST_DIR="$BASE_TEMPLATE_PATH/GHUnit"
FILE_TEMPLATE_DST_DIR="$BASE_TEMPLATE_PATH/File Templates/GHUnit"

force=
uninstall=

usage(){
cat << EOF
usage: $0 [options]
 
Install / update templates for GHUnit/OCMock Xcode 4 Templates
 
OPTIONS:
   -f	force overwrite if directories exist
   -h	this help
   -u	uninstall Xcode 4 templates
EOF
}

while getopts "fhu" OPTION; do
	case "$OPTION" in
		f)
			force=1
			;;
		h)
			usage
			exit 0
			;;
		u)
			uninstall=1
			;;
	esac
done

uninstall_templates(){
	if [[ -d $PROJECT_TEMPLATE_DST_DIR ]];  then
		echo "Removing project templates: ${PROJECT_TEMPLATE_DST_DIR}"
		rm -rf "$PROJECT_TEMPLATE_DST_DIR"
	fi

	if [[ -d $FILE_TEMPLATE_DST_DIR ]];  then
		echo "Removing project templates: ${FILE_TEMPLATE_DST_DIR}"
		rm -rf "$FILE_TEMPLATE_DST_DIR"
	fi
}

install_project_templates(){
	if [[ -d $PROJECT_TEMPLATE_DST_DIR ]];  then
		if [[ $force ]]; then
			echo "Removing old project templates: ${PROJECT_TEMPLATE_DST_DIR}"
			rm -rf "$PROJECT_TEMPLATE_DST_DIR"
		else
			echo "Project templates already installed. To force a re-install use the '-f' parameter."
			exit 1
		fi
	fi
	
	echo "Creating destination directory: ${PROJECT_TEMPLATE_DST_DIR}..."
	mkdir -p "$PROJECT_TEMPLATE_DST_DIR"

	echo "Copying Project Templates..."
	cp -R ./"Project Template"/* "$BASE_TEMPLATE_PATH"
}

install_file_templates(){
	if [[ -d $FILE_TEMPLATE_DST_DIR ]];  then
		if [[ $force ]]; then
			echo "Removing old project templates: ${FILE_TEMPLATE_DST_DIR}"
			rm -rf "$FILE_TEMPLATE_DST_DIR"
		else
			echo "Project templates already installed. To force a re-install use the '-f' parameter."
			exit 1
		fi
	fi
	
	echo "Creating destination directory: $FILE_TEMPLATE_DST_DIR..."
	mkdir -p "$FILE_TEMPLATE_DST_DIR"

	echo "Copying File Templates..."
	cp -R ./"File Template"/* "$BASE_TEMPLATE_PATH/File Templates/"
}

# Make sure only root can run our script
if [[ ! $user_dir  && "$(id -u)" != "0" ]]; then
	echo ""
	echo "Error: This script must be executed as root in order to copy templates to:" 1>&2
	echo "	${BASE_TEMPLATE_PATH}" 1>&2
	echo "Try running this install script with 'sudo'." 1>&2
	echo "   sudo $0" 1>&2
exit 1
fi

if [[ $uninstall ]]; then
	uninstall_templates
else
	install_project_templates

	install_file_templates
fi




