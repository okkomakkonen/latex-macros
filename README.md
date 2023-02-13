# My LaTeX macros

This repository includes some macros I use in my LaTeX endeavors.

As anyone who has written LaTeX knows, it is an amazing language for typesetting all kinds of text, especially text which includes mathematical notation. However, LaTeX, and its predecessor TeX, is not a modern language. Thus, it includes many messy features and multiple ways to achieve the same thing. This makes it quite difficult to read LaTeX source code, especially if it has been written by someone else. Everyone defines their own macros and commands, which makes it really difficult to understand, if you are not familiar with the exact shorthand notation that they are using. For this reason, I do not prefer to use complicated (i.e. too short and non-standardized) macros. The goal of a macro should not be to make it simpler to write the expression, but rather to make the source code simpler to read. At the end of the day, the source code is read by other humans, so clarity is of great importance. If you want to write LaTeX quicker, keyboard macros or snippets should be used as an alternative to LaTeX macros.

However, some macros should still be defined, such as those with a universal level of standardization and those that make the source code more readable. These are the problems that the packages in this repository is trying to tackle.

## Installation

You can install the classes and packages by cloning this directory to `$TEXMFHOME/tex/latex/local/`. This should usually be set as `TEXMFHOME=$HOME/.texmf`. For the most reliable functionality add

```sh
export TEXMFHOME=$HOME/.texmf
```

in your `$HOME/.profile` file.

Alternatively, you can use these classes by including a copy of the relevant files in the same directory as your main document.

## Provided classes and packages

### MyMacros

The `mymacros.sty` package includes some common packages and macros I use while writing mathematics. I have tried to keep it as universal as possible. See the `macros.pdf` file for examples of use.

### MyAssignment

The `myassignment.cls` class provides an article-like class for writing simple homeworks. This is kept minimal and to the point. This class uses the `mymacros.sty` package. See the `assignment.pdf` file for examples of use.

If you want to use this class in Overleaf, for example, you can copy the `myassignment.cls` and `mymacros.sty` files to the same directory as your main file.

## LaTeX snippets for VS Code

Place the file `latex.json` in `~/.config/Code/User/snippets/` or in project specific `.vscode/`.

## Future

- Fix `\ndiv` command, since it looks too thin.
- Fix `\trans` command in `\scriptscriptstyle`.
- Fix `\ProofRightarrow` and `\ProofLeftarrow`, since the arrows are not vertically centered.
- Improve and document the `\annotate` command for annotating equations.
