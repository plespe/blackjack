assert = chai.assert

describe 'hand methods', ->
  deck = null
  hand = null

  beforeEach ->
    deck = new Deck()
    hand = deck.dealPlayer()

  describe 'hit', ->
    it 'should add a card to the hand', ->
      assert.strictEqual hand.length, 2
      hand.hit()
      assert.strictEqual hand.length, 3

  describe 'score', ->
    it 'should calculate the right score', ->
      hand.pop()
      hand.pop()
      hand.push(new Card rank: 1, suit: 0)
      hand.push(new Card rank: 8, suit: 0)
      assert.strictEqual hand.scores(), 19
      hand.push(new Card rank: 3, suit: 0)
      assert.strictEqual hand.scores(), 12

    it 'should calculate blackjack', ->
      hand.pop()
      hand.pop()
      hand.push(new Card rank: 1, suit: 0)
      hand.push(new Card rank: 10, suit: 0)
      assert.strictEqual hand.scores(), "blackjack"




