VFLAGS = -O3 --x-assign fast --x-initial fast --noassert
SDL_CFLAGS = `sdl2-config --cflags`
SDL_LDFLAGS = `sdl2-config --libs`

build: raytracer.sv
	verilator ${VFLAGS} -I.. -cc $< --exe simulate.cpp -o raytracer \
		-CFLAGS "${SDL_CFLAGS}" -LDFLAGS "${SDL_LDFLAGS}"
	make -C ./obj_dir -f Vraytracer.mk

run:
	./obj_dir/raytracer

start: build run

clean:
	rm -rf ./obj_dir


.PHONY: all clean