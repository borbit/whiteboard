# @cjsx React.DOM
React = require 'react'

module.exports = ->
  <form className="sign">
    <label>Sign In</label>
    <fieldset>
      <input className="sign__input form-control" placeholder="Username" />
      <input className="sign__input form-control" placeholder="Password" />
    </fieldset>
    <fieldset>
      <div className="checkbox">
        <label>
          <input type="checkbox"/> Remember me
        </label>
      </div>
    </fieldset>
    <fieldset>
      <button className="sign__btn btn btn-default btn-block">Sign In</button>
      <button className="sign__btn btn btn-primary btn-block">
        <i className="fa fa-facebook"></i> Connect with Facebook
      </button>
    </fieldset>
  </form>