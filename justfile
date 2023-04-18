default:
	@just --list


# clean binary artifact
clean:
	rm -r dist/ mc_uuid_check.egg-info


# Builds Package
build:
	@echo 'Building!'
	pyproject-build
	@echo 'Finished!'


# Installs Application
install:
	pip install -U dist/mc_uuid_check-*.whl


# Installs Applicatio
install-build: build
	pip install -U dist/mc_uuid_check-*.whl


# Uninstalls Application
uninstall:
	pip uninstall mc-uuid-check


# Tests application
test:
	just clean
	just uninstall
	just install-build
	mc-uuid-check notch
	mc-uuid-check -o notch
