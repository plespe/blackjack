assert = chai.assert

describe 'deck', ->
  deck = null
  hand = null

  beforeEach ->
    deck = new Deck()
    hand = deck.dealPlayer()

  describe 'hit', ->
    it 'should give the last card from the deck', ->
      assert.strictEqual deck.length, 50
      deckcard = deck.last()
      hand.hit()
      handcard = hand.last()
      assert.strictEqual deckcard, handcard
      assert.strictEqual deck.length, 49
