class window.AppView extends Backbone.View
  template: _.template '
    <button value=100 class="bet-button">Bet 100</button> <button class="deal-button">Deal Hand</button>
  '

  events:
    'click .deal-button': "handleDeal"
    'click .bet-button': "handleBet"


  handleBet: (e) ->
    money = $(e.currentTarget).attr('value')
    money = parseInt(money)
    @model.get('playerHand').bet(money)

  handleDeal: ->
    @model.deal()
    @render()


  initialize: ->
    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template()

