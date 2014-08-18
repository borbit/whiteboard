# @cjsx React.DOM
React = require 'react'
DetailsSection = require './details__section'
DetailsList = require './details__list'
DetailsLine = require './details__line'

module.exports = ->  
  selectedDefinitions = [
    {text: 'to keep in existence or continuance; preserve; retain'}
    {text: 'to keep in an appropriate condition, operation, or force; keep unimpaired to keep in an appropriate condition, operation, or force; keep unimpaired'}
    {text: 'to keep in a specified state, position, etc.'}
    {text: 'to affirm; assert; declare'}
  ]

  selectedExamples = [
    {text: 'the need to <b>maintain</b> close links between industry and schools'}
    {text: 'to keep in a specified state, position, etc.'}
  ]

  selectedRelatedForms = [
    {text: 'maintains'}
    {text: 'maintained'}
    {text: 'maintaining'}
  ]

  <dl className="details">
    <DetailsSection
      available={@state.definitions}
      loading={@state.definitionsLoading}
      onEdit={@editDefinitions}
      onCancel={@unloadDefinitions}
      onSave={@saveDefinitions}
      title="Definitions">
      <DetailsList items={selectedDefinitions}/>
    </DetailsSection>

    <DetailsSection
      available={@state.examples}
      loading={@state.examplesLoading}
      onEdit={@editExamples}
      onCancel={@unloadExamples}
      onSave={@saveExamples}
      title="Examples">
      <DetailsList items={selectedExamples}/>
    </DetailsSection>

    <DetailsSection
      available={@state.relatedForms}
      loading={@state.relatedFormsLoading}
      onEdit={@editRelatedForms}
      onCancel={@unloadRelatedForms}
      onSave={@saveRelatedForms}
      title="Related forms">
      <DetailsLine items={selectedRelatedForms}/>
    </DetailsSection>
  </dl>