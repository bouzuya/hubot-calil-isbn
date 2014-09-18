# hubot-calil-isbn

A Hubot script that display http://calil.jp/book/<isbn>

## Installation

    $ npm install git://github.com/bouzuya/hubot-calil-isbn.git

or

    $ # TAG is the package version you need.
    $ npm install 'git://github.com/bouzuya/hubot-calil-isbn.git#TAG'

## Example

    bouzuya> isbn:479803939X
      hubot> http://calil.jp/book/479803939X

## Configuration

See [`src/scripts/calil-isbn.coffee`](src/scripts/calil-isbn.coffee).

## Development

`npm run`

## License

[MIT](LICENSE)

## Author

[bouzuya][user] &lt;[m@bouzuya.net][mail]&gt; ([http://bouzuya.net][url])

## Badges

[![Build Status][travis-badge]][travis]
[![Dependencies status][david-dm-badge]][david-dm]
[![Coverage Status][coveralls-badge]][coveralls]

[travis]: https://travis-ci.org/bouzuya/hubot-calil-isbn
[travis-badge]: https://travis-ci.org/bouzuya/hubot-calil-isbn.svg?branch=master
[david-dm]: https://david-dm.org/bouzuya/hubot-calil-isbn
[david-dm-badge]: https://david-dm.org/bouzuya/hubot-calil-isbn.png
[coveralls]: https://coveralls.io/r/bouzuya/hubot-calil-isbn
[coveralls-badge]: https://img.shields.io/coveralls/bouzuya/hubot-calil-isbn.svg
[user]: https://github.com/bouzuya
[mail]: mailto:m@bouzuya.net
[url]: http://bouzuya.net
