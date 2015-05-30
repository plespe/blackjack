class window.AppView extends Backbone.View
  template: _.template '
    <button value=100 class="bet-button">Bet 100</button> <button class="hit-button">Hit</button> <button class="stand-button">Stand</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '

  events:
    'click .hit-button': -> @model.get('playerHand').hit()
    'click .stand-button': -> @model.get('playerHand').stand()
    'click .bet-button': "handleBet"


  handleBet: (e) ->
    money = $(e.currentTarget).attr('value')
    money = parseInt(money)
    @model.get('playerHand').bet(money)

  initialize: ->
    # listen for busts, wins
    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el

