# @cjsx React.DOM
React = require 'react'
cs = React.addons.classSet

module.exports = ->
  inputs = [
    <input className="sign__input form-control" placeholder="Email" type="email" />,
    <input className="sign__input form-control" placeholder="Password" type="password" />
  ]

  if @props.view == 'signup'
    inputs.push <input className="sign__input form-control" placeholder="Repeat" type="password" />

  if @props.view == 'signup'
    submitButton = <button className="sign__btn btn btn-default btn-block">Sign up</button>
  else
    submitButton = <button className="sign__btn btn btn-default btn-block">Log in</button>

  fieldsets = [
    <fieldset>{inputs}</fieldset>,
    <fieldset className="checkbox">
      <label>
        <input type="checkbox"/> Remember me
      </label>
    </fieldset>,
    <fieldset>
      {submitButton}
      <button className="sign__btn btn btn-primary btn-block">
        <i className="fa fa-facebook"></i> Connect with Facebook
      </button>
    </fieldset>
  ]

  if @props.view == 'signup'
    fieldsets.push(
      <fieldset className="sign__login">
        <span className="sign__link" onClick={@onLogIn}>Log in</span>, if you already have an account
      </fieldset>
    )
  else
    fieldsets.push(
      <fieldset className="sign__signup">
        <span className="sign__link" onClick={@onSignUp}>Sign up</span>, if you don't have an account
      </fieldset>
    )

  formClass = cs
    sign: yes
    sign_login: @props.view == 'login'
    sign_signup: @props.view == 'signup'

  <form className={formClass}>
    {fieldsets}
  </form>