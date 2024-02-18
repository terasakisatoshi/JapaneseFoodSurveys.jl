.phony : all build web test clean

DOCKER_IMAGE=japanesefoodsurveysjl

all: build

build:
	julia --project=@. -e 'using Pkg; Pkg.instantiate()'

# Excecute in docker container
web:
	julia --project=docs -e 'using Pkg; Pkg.develop(PackageSpec(path=pwd())); Pkg.instantiate(); \
		include("docs/make.jl"); \
		using LiveServer; servedocs(); \
		'

test:
	julia -e 'using Pkg; Pkg.activate("."); Pkg.test()'

clean:
	-rm -f  Manifest.toml docs/Manifest.toml
	-rm -rf docs/build
