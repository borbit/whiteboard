# @cjsx React.DOM
_ = require 'underscore'
moment = require 'moment'
React = require 'react/addons'

Card = require '../card/card'
Modal = require '../modal/modal'
VocabToolbar = require './vocab__toolbar'
VocabGroup = require './vocab__group'
VocabList = require './vocab__list'
VocabRow = require './vocab__row'

module.exports = ->
  if @state.card
    modal = <Modal content={<Card card={@state.card}/>} onClosed={@onCardClosed}/>  
  
  cards = _.groupBy @state.cards, (card) ->
    card.learned ? 'learned': 'active'
  cards = _.groupBy cards.active, (card) ->
    moment(card.created_at).format 'YYYYMM'
  cards = _.sortBy _.toArray(cards), (group) ->
    -moment(group[0].created_at)

  body = []

  _.each cards, (group) =>
    rows = _.sortBy group, (card) -> -moment(card.created_at)
    rows = rows.map (card) =>
      <VocabRow
        onClick={=>@onCardClick card._id}
        onSelect={=>@onCardSelect card._id}
        onSetLearned={=>@onCardSetLearned card._id}
        onUnsetLearned={=>@onCardUnsetLearned card._id}
        card={card}
      />

    month = moment group[0].created_at

    if month.year() == moment().year() and 
       month.month() == moment().month()
      month = 'This month'
    else
      month = month.format 'MMMM YYYY'

    body.push <VocabGroup title={month} />
    body.push <VocabList rows={rows} />

  <div className="vocab">
    {modal}
    <VocabToolbar
      isSelectedAny={no}
      isSelectedAll={no}
      isSelectable={no}
      isCondensed={no}

      onRemove={no}
      onSetLearned={no}
      onCardAdd={no}
      onViewToggle={no}
      onSelectAll={no}
    />
    {body}
  </div>