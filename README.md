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

Example
-------
khaled was originally meant as a password manager that would live on a USB key, like a local [LastPass](https://www.lastpass.com/) or [OnePass](https://onepass.thomsonreuters.com). To use it as such, first start a password database in a file called `passwords`. You will be prompted twice for a password with which to encrypt the database (once for verification). 

```
$ ./start passwords
enter aes-256-cbc encryption password:
Verifying - enter aes-256-cbc encryption password:
```

The password you provide is the password you will use in all subsequent commands. Note that this is true symmetric encryption, and as a result **IF YOU FORGET THIS PASSWORD YOU CAN NEVER GET YOUR DATA BACK. THERE IS NO WAY TO RESET IT.**

Next, you can add passwords to your database.

```
$ ./put passwords
key: email
value:
enter aes-256-cbc decryption password:
enter aes-256-cbc encryption password:
Verifying - enter aes-256-cbc encryption password:
ok
$
```

Enter the name you want to associate with your new password when prompted for `name`. Enter the password when prompted for `value`. You have to enter your database password (the one you provided to `start`) three times: once to decrypt the database, once to re-encrypt it, and another to verify. This is annoying, and strictly speaking you could *change* your database's password here, so this might change in the future.

If you need a new password, you can use `make`. It will generate a few pseudorandom password options for you. Which one you use will depend on the service you are registering with, as some will have size and character constraints on what they allow as a password. Generally, use the longest password with the most special characters that you can get away with.

```
$ ./make
3tTjbAWxqHMuWBAPUf2uS0yPNA/3TNgRbISs3V8gqhnKgyXFfPpS9kGzS+/OlOOofw14h2Fr4p4jLCYoczEBA==
XMo+PiDlb7gnZA8mGCDaaajXxOv2k7qqYnF22Xs3anFIoHDhM03rqPwk6W56OutZ
dTRxvnTfVU36fft8dK6FLQ==
MDg5NjlhMzg3MzI3MmNkZGI1ZWE4Yzgz
0a79c6cb182b7f7e5894acac68680291
$
```

Finally, you can retrieve the data you stored with `get`. The value will be copied to your pasteboard and never printed out.

```
$ ./get passwords email
enter aes-256-cbc decryption password:
$
```

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
