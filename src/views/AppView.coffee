class window.AppView extends Backbone.View

  events:
    'click .deal-button': "handleDeal"
    'click .bet-button': "handleBet"


  handleBet: (e) ->
    money = parseInt($(e.currentTarget).attr('value'))
    @model.bet(money)

  handleDeal: ->
    @model.deal()



  initialize: ->
    @model.on 'bet deal change', => @render()
    @render()

  template: _.template '
    <button value=100 class="bet-button">Bet 100</button> <button class="deal-button">Deal Hand</button> <span class="bet">Current Bet: </span> <span class="chips">Pile: </span>
  '

  render: ->
    @$el.children().detach()
    @$el.html @template @model
    console.log @model.get 'dealt'
    if @model.dealt
      @$("button").remove()
    @$('.bet').text ("Current Bet: " + @model.get 'betAmount')
    @$('.chips').text ("Stack: " + @model.get 'chips')

