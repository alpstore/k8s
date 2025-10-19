#!/bin/sh
# AlpiNAS - Alpine Linux NAS Distribution
# Place this file in aports/scripts/ before building

profile_alpinas() {
	profile_standard
	title="AlpiNAS"
	desc="AlpiNAS - Lightweight NAS distribution based on Alpine Linux"

	# Additional packages beyond standard profile
	# Add your custom packages here
	profile_abbrev="alpinas"

	# Kernel modules - add any needed modules
	kernel_addons=""

	# Additional packages
	apks="$apks
		bash
		vim
		curl
		wget
		htop
		git
		"
}
