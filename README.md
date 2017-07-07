Khaled
======

A local, portable, encrypted key-value store intended as a simple password manager.

Usage
-----

### `start file`
Starts a new store in `file`. You will be prompted for a password to encrypt `file`. `file` is overwritten if it exists.

### `put file`
Associates a key with a new value in `file`. You will be prompted for the key, the value, and `file`'s password.

### `get file key`
Gets the value associated with `key` in `file`. You will be prompted for `file`'s password.

### `delete file key`
Removes `key` and its associated value from `file`. You will be prompted for `file`'s password.

### `list file`
Lists all keys in `file`. You will be prompted for `file`'s password.

### `make`
Generates a few random passwords.

Installation
------------
Expects `openssl` command to be available, everything else should be standard. To install `openssl` on macOS

```
$ brew install openssl
```

Only tested on macOS.

Implementation
--------------
**Note** *I am not a cryptographer and this code has not been reviewed by a cryptographer.*

khaled uses the `openssl` command line utility to maintain an AES encrypted key value store in a text file. Each key value pair is stored on a line, separated by a space. The file is never decrypted to disk, and all operations happen in memory.

Name
----
[Bless Up 🙏🏻🗝](https://www.youtube.com/watch?v=SFLSOIufuhM)

License
-------
[MIT](https://opensource.org/licenses/MIT)
