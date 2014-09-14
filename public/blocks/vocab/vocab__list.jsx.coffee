# @cjsx React.DOM
React = require 'react/addons'
cs = React.addons.classSet

module.exports = ->
  listTableClass = cs
    'table': yes
    'table-condensed': @state.condensed
    'vocab__list': yes

  <table className={listTableClass}>
    <tbody>
      {rows}
    </tbody>
  </table>