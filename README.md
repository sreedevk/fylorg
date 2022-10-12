<h1 align="center">Fylorg</h1>

<p align="center">
An Automatic File Organizer written in Rust. This is a commandline tool to categorize and organize your files into directories (based on filename) automatically based on a set configuration.
</p>

# Usage
To use Fylorg, you'll need a mapping file. Checkout "filemap.example.json" file. This is the configuration that will be used by fylorg to categorize your files. Once you have a mapfile,
you need to run fylorg with the following options:

```bash
  fylorg \
    -m filemap.example.json \ 
    -o "organized_files" \
    -f "pdf,xlsx,docx,md"
```

* `-m` is the path to the mapping file
* `-o` is the output directory that will contain the mapped files
* `-f` is the type of files that you want fylorg to organize.

# Installation

## Using Cargo

```bash
cargo install fylorg
```

Optionally, you can compile the repository and move the target binary to a $PATH directory.
