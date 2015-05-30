# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'chips', 2000
    @set 'betAmount', 0
    @set 'dealt', false

  deal: ->
    @set 'dealt', true
    @set 'game', game = new Game(@get "deck")
    new GameView({model: game})

  bet: (amount) ->

    total = (@get 'betAmount') + amount
    @set 'betAmount',  total 
    stack = (@get 'chips') - amount
    @set 'chips', stack
    # console.log @get 'betAmount'
    # console.log @get 'chips'