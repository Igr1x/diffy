# Diffy
## Git Diff Helper

A small Bash utility that simplifies running `git diff` on files in large projects (e.g., Java), where file paths are long and hard to type manually.

The script lets you type only part of a filename, shows all matching changed files, and allows you to select one to view the diff.

## Features

- Search changed files by partial name (case-insensitive)
- Automatically handles:
  - No matches
  - Single match (shows diff immediately)
  - Multiple matches (interactive selection)
- Cleaner control flow with a separate file-fetching function
- Works with standard Bash without external dependencies

## Usage
```bash
diffy <search-term>
```

## Example
```bash
diffy service
```
If `git status` reposrt these changes:
```bash
modified: src/main/java/com/example/UserService.java
modified: src/main/java/com/example/entity/Order.java
modified: src/main/java/com/example/OrderServiceImpl.java
modified: src/main/java/com/example/entity/User.java
```
You will see:
```bash
Select file:
1) src/main/java/com/example/UserService.java
2) src/main/java/com/example/OrderServiceImpl.java
3) Exit
```
Choosing a number triggers:
```bash
git diff <selected file>
```
## Installation
1) Clone this repository
2) Put the script somewhere in your project or add it to your PATH (or create symbolic link):
```bash
chmod +x diffy.sh
mv diffy.sh ~/bin/
```

