// Generated by CoffeeScript 1.9.3
var extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
  hasProp = {}.hasOwnProperty;

window.GameView = (function(superClass) {
  extend(GameView, superClass);

  function GameView() {
    return GameView.__super__.constructor.apply(this, arguments);
  }

  GameView.prototype.template = _.template('<button class="hit-button">Hit</button> <button class="stand-button">Stand</button> <div class="player-hand-container"></div> <div class="dealer-hand-container"></div>');

  GameView.prototype.events = {
    'click .hit-button': function() {
      return this.model.get('playerHand').hit();
    },
    'click .stand-button': function() {
      return this.model.get('playerHand').stand();
    }
  };

  GameView.prototype.initialize = function() {
    return this.render();
  };

  GameView.prototype.render = function() {
    $("body").append(this.$el);
    this.$el.children().detach();
    this.$el.html(this.template());
    this.$('.player-hand-container').html(new HandView({
      collection: this.model.get('playerHand')
    }).el);
    return this.$('.dealer-hand-container').html(new HandView({
      collection: this.model.get('dealerHand')
    }).el);
  };

  return GameView;

})(Backbone.View);
