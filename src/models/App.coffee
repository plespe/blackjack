# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'chips', 2000
    @set 'betAmount', 0
    @set 'dealt', false
    # @set 'game', game = new Game

    #     console.log @get('game')
    #     @.listenTo(@get('game'), 'gameEnd', ->
    #       console.log "adasdsa"
    #       total = @get 'chips'
    #       if @get 'game'.gameEnd is "player"
    #         total = (@get 'chips') + ((@get 'betAmount') * 2)
    #       else if @get 'game'.gameEnd is "tie"
    #         total = (@get 'chips') + (@get 'betAmount')
    #       @set 'chips', total
    #       @set 'betAmount', 0
    #       @set 'dealt', false)
    if @get('game')
      @get('game').on 'all', @gameEvents, @

  gameEvents: (event) ->
    switch event
      when 'playerWins' then console.log "player wins!"
      when 'dealerWins' then console.log "dealer wins!"
      when 'tie' then console.log "tie!!!"
  #     when 'stand' then @get('dealerHand').playToWin()

  # dealerEvents: (event, hand) ->
  #   switch event
  #     when 'bust'  then @trigger 'win-player'
  #     when 'stand' then @findWinner()


  deal: ->
    @set 'dealt', true
    @set 'game', game = new Game(@get "deck")
    new GameView({model: game})
    @

  bet: (amount) ->

    total = (@get 'betAmount') + amount
    @set 'betAmount',  total
    stack = (@get 'chips') - amount
    @set 'chips', stack
