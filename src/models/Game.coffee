class window.Game extends Backbone.Model
  initialize: (params) ->
    console.log params
    @set 'deck', params
    @set 'playerHand', @get('deck').dealPlayer()
    @set 'dealerHand', @get('deck').dealDealer()

    if @get("playerHand").scores() is "blackjack" then @dealerTurn @get("playerHand").scores()

    @get("playerHand").on "stand", =>
      @dealerTurn @get("playerHand").scores()

    @get("playerHand").on "bust", =>
      console.log "you lose sucker"
      # @dealerTurn @get("playerHand").scores()

    @get("dealerHand").on "bust", =>
      console.log "Dealer busted. You win!"


  dealerTurn: (score) ->
    # console.log "dealer turn"
    # console.log score
    # console.log @get "dealerHand"
    @get("dealerHand").models[0].flip()
    while @get("dealerHand").scores() < 17
      @get("dealerHand").hit()
      #@get("dealerHand").bust()  if @get("dealerHand").scores() > 21
    if @get("dealerHand").scores() <= 21 then @calculateWin score, @get("dealerHand").scores()

  calculateWin: (player, dealer) ->
    # console.log "calculate win"
    if player is "blackjack" then player = 22
    if dealer is "blackjack" then dealer = 22
    if player > dealer then console.log "You win son!"
    else if player < dealer then console.log "You lose."
    else console.log "It's a push"

