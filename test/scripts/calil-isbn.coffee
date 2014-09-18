{Robot, User, TextMessage} = require 'hubot'
assert = require 'power-assert'
path = require 'path'
sinon = require 'sinon'

describe 'hello', ->
  beforeEach (done) ->
    @sinon = sinon.sandbox.create()
    # for warning: possible EventEmitter memory leak detected.
    # process.on 'uncaughtException'
    @sinon.stub process, 'on', -> null
    @robot = new Robot(path.resolve(__dirname, '..'), 'shell', false, 'hubot')
    @robot.adapter.on 'connected', =>
      @robot.load path.resolve(__dirname, '../../src/scripts')
      setTimeout done, 10 # wait for parseHelp()
    @robot.run()

  afterEach (done) ->
    @robot.brain.on 'close', =>
      @sinon.restore()
      done()
    @robot.shutdown()

  describe 'listeners[0].regex', ->
    describe 'valid patterns', ->
      beforeEach ->
        @tests = [
          message: 'isbn:479803939X'
          matches: ['isbn:479803939X', '479803939X']
        ,
          message: 'isbn:9784798039398'
          matches: ['isbn:9784798039398', '9784798039398']
        ]

      it 'should match', ->
        @tests.forEach ({ message, matches }) =>
          callback = @sinon.spy()
          @robot.listeners[0].callback = callback
          sender = new User 'bouzuya', room: 'hitoridokusho'
          @robot.adapter.receive new TextMessage(sender, message)
          actualMatches = callback.firstCall.args[0].match.map((i) -> i)
          assert callback.callCount is 1
          assert.deepEqual actualMatches, matches

  describe 'listeners[0].callback', ->
    beforeEach ->
      @hello = @robot.listeners[0].callback

    describe 'receive "isbn:479803939X"', ->
      beforeEach ->
        @send = @sinon.spy()
        @hello
          match: ['isbn:479803939X', '479803939X']
          send: @send

      it 'send "isbn:479803939X"', ->
        assert @send.callCount is 1
        assert @send.firstCall.args[0] is 'http://calil.jp/book/479803939X'

    describe 'receive "isbn:9784798039398"', ->
      beforeEach ->
        @send = @sinon.spy()
        @hello
          match: ['isbn:9784798039398', '9784798039398']
          send: @send

      it 'send "isbn:9784798039398"', ->
        assert @send.callCount is 1
        assert @send.firstCall.args[0] is \
          'http://calil.jp/book/9784798039398'

  describe 'robot.helpCommands()', ->
    it 'should be ["isbn:<isbn> - display http://calil.jp/book/<isbn>"]', ->
      assert.deepEqual @robot.helpCommands(), [
        "isbn:<isbn> - display http://calil.jp/book/<isbn>"
      ]
