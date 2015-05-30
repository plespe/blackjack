# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()

    console.log @get("playerHand").scores();
    if @get("playerHand").scores() is "blackjack" then @dealerTurn @get("playerHand").scores()

    @get("playerHand").on "stand", =>
      console.log "app listened"
      @dealerTurn @get("playerHand").scores()

  # hit: ->


  # stand: ->


  dealerTurn: (score) ->
    console.log "dealer turn"
    console.log score
    # console.log @get "dealerHand"
    @get("dealerHand").models[0].flip()
    @calculateWin()
    @get("dealerHand").hit()  while @get("dealerHand").scores() < 17
    @calculateWin()

  calculateWin: ->
    console.log "calculate win"


