class window.Hand extends Backbone.Collection
  model: Card

  initialize: (array, @deck, @isDealer) ->


  hit: ->
    @add(@deck.pop())
    console.log @scores();
    if @scores() is "blackjack" then @stand()
    else if @scores() > 0 then console.log "fdsfds"

  hasAce: -> @reduce (memo, card) ->
    memo or card.get('value') is 1
  , 0

  minScore: -> @reduce (score, card) ->
    score + if card.get 'revealed' then card.get 'value' else 0
  , 0

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.

   if @length is 2 and @minScore() + 10 * @hasAce() is 21
     "blackjack"
   else if @minScore() + 10 * @hasAce() <= 21
     @minScore() + 10 * @hasAce()
   else
     @minScore()

  stand: ->
    console.log "stand called";
    @trigger "stand", @

  # bust: ->
  #   if @minScore() > 21 then true
