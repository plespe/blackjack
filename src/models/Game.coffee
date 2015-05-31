class window.Game extends Backbone.Model

  initialize: (params)->
    console.log params
    @set 'deck', deck = params
    @set 'playerHand', player = deck.dealPlayer()
    @set 'dealerHand', dealer = deck.dealDealer()

    if @get("playerHand").scores() is "blackjack" then @dealerTurn @get("playerHand").scores()

    @get("playerHand").on "stand", =>
      @dealerTurn @get("playerHand").scores()

    @get("playerHand").on "bust", =>
      console.log "you lose sucker"
      @dealerWins()

    @get("dealerHand").on "bust", =>
      console.log "Dealer busted. You win!"
      @playerWins()

  playerWins: ->
    @trigger 'playerWins', @

  dealerWins: ->
    @trigger 'dealerWins', @

  tie: ->
    @trigger 'tie', @

  dealerTurn: (score) ->

    @get("dealerHand").models[0].flip()
    while @get("dealerHand").scores() < 17
      @get("dealerHand").hit()
    if @get("dealerHand").scores() <= 21 then @calculateWin score, @get("dealerHand").scores()


  calculateWin: (player, dealer) ->

    if player is "blackjack" then player = 22
    if dealer is "blackjack" then dealer = 22
    if player > dealer
      console.log "You win son!"
      @playerWins()
    else if player < dealer
      console.log "You lose."
      @dealerWins()
    else
      console.log "It's a push"
      @tie()


