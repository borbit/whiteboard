# @cjsx React.DOM
React = require 'react/addons'
cs = React.addons.classSet

module.exports = ->
  groupTableClass = cs
    'table': yes
    'table-condensed': @state.condensed
    'vocab__group': yes

  <table className={groupTableClass}>
    <tr>
      <td width="40"></td>
      <td>{month}</td>
    </tr>
  </table>