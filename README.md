# Komicless

Komicless is an (alternative) server for [ComicGlass](http://comicglass.net/).
They already provides a Win server, a Mac server, and a PHP version.

This work should work with recent Ruby, without requiring root privilege and PHP.

# Limitations

- Unlike offical servers, Komicless only hosts one directory (not really a problem when it handles symlink of dirs).
- uPnP is not supported yet.

## Installation

    $ gem install komicless

## Usage

    $ komicless --port=10080 --root=/files
    Thin web server (v1.6.1 codename Death Proof)
    Maximum connections set to 1024
    Listening on 0.0.0.0:10080, CTRL+C to stop

The files can be downloaded in ComicGlass, after manually add a server.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

BTW any good guy knows about uPnP?
