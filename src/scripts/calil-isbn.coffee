# Description
#   A Hubot script that display http://calil.jp/book/<isbn>
#
# Configuration:
#   None
#
# Commands:
#   isbn:<isbn> - display http://calil.jp/book/<isbn>
#
# Author:
#   bouzuya <m@bouzuya.net>
#
module.exports = (robot) ->
  robot.hear /isbn:([0-9X]{13}|[0-9X]{10})/i, (res) ->
    isbn = res.match[1]
    res.send "http://calil.jp/book/#{isbn}"
