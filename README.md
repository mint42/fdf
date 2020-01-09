# FDF

fdf is a graphics project in the 42 curriculum. It uses the minilibx (mlx for short) graphics library to introduce the concepts of window drawing, and keyboard managment in graphical environment. The goal of this project is to parse a file with 3-D coordinates to create a 2 different wireframe projections of that file.

## Getting Started

fdf uses [my 42 library](https://github.com/mint42/lib) which has been included as a git submodule. To set up this project, run `git clone https://github.com/mint42/fdf` in the folder of your choice. Next, from the root of the fdf repository run `git submodule update --init libft` to import the contents of the libft repository. Finally you can run `make` which will use the Makefile to build the library, and then the executable file `fdf`.

```
usage: ./fdf file
```

The file referenced is the input file for the program. It can be any size, and should be laid out in this format:

```
cat -e file
0   0   0   0   0   0   0   0   0$
0  10   0  10   0  10  10  10   0$
0  10   0  10   0   0  10   0   0$
0  10  10  10   0   0  10   0   0$
0  10   0  10   0   0  10   0   0$
0  10   0  10   0  10  10  10   0$
0   0   0   0   0   0   0   0   0$
```

- The horizontal position corresponds to its axis.
- The vertical position corresponds to its ordinate.
- The value corresponds to its altitude.
- White space does not need to be aligned.
- All consecutive whitespace will be treated as one space.
- All valid integers will be accepted as values.

## Features (in progress)

- Movement with Arrow keys and h j k l
- Camera Angles

These options and more can be configured in the [config.h](https://github.com/mint42/fdf/blob/master/includes/config.h) file

## References

- https://github.com/mint42/fdf/blob/master/mlx/man

## Author

[Ari Reedy](https://github.com/mint42/)
