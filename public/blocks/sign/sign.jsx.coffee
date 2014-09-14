# @cjsx React.DOM
page = require 'page'
React = require 'react/addons'
cs = React.addons.classSet

module.exports = ->
  if @props.view == 'signup'
    inputs = [
      <input className="sign__input form-control" placeholder="Email" name="email" defaultValue={@props.values?.email} type="email" required />,
      <input className="sign__input form-control" placeholder="Password" name="password" defaultValue={@props.values?.password} type="password" required ref="passwd" onInput={@checkPasswords} />
      <input className="sign__input form-control" placeholder="Repeat" name="repeat" defaultValue={@props.values?.repeat} type="password" required ref="repeat" onInput={@checkPasswords} />
    ]
  else
    inputs = [
      <input className="sign__input form-control" placeholder="Email" name="email" defaultValue={@props.values?.email} type="email" required />,
      <input className="sign__input form-control" placeholder="Password" name="password" defaultValue={@props.values?.password} type="password" required />    
    ]

  if @props.view == 'signup'
    submitButton = <button className="sign__btn btn btn-default btn-block">Sign up</button>
  else
    submitButton = <button className="sign__btn btn btn-default btn-block">Log in</button>

  fieldsets = []

  if @props.errors?.length
    errors = @props.errors.map (error) ->
      <li>{error}</li>
    fieldsets.push(
      <fieldset className="sign__errors bg-danger">
        <ul className="list-unstyled">{errors}</ul>
      </fieldset>
    )

  fieldsets = fieldsets.concat [
    <fieldset>{inputs}</fieldset>,
    <fieldset className="checkbox">
      <label>
        <input type="checkbox"/> Remember me
      </label>
    </fieldset>,
    <fieldset>
      {submitButton}
      <a href="/auth/facebook" className="sign__btn btn btn-primary btn-block">
        <i className="fa fa-facebook"></i> Connect with Facebook
      </a>
    </fieldset>
  ]

  if @props.view == 'signup'
    fieldsets.push(
      <fieldset className="sign__login">
        <span className="sign__link" onClick={-> page '/login'}>Log in</span>, if you already have an account
      </fieldset>
    )
  else
    fieldsets.push(
      <fieldset className="sign__signup">
        <span className="sign__link" onClick={-> page '/signup'}>Sign up</span>, if you don't have an account
      </fieldset>
    )

  formClass = cs
    sign: yes
    sign_login: @props.view == 'login'
    sign_signup: @props.view == 'signup'

  <form className={formClass} method="post">
    {fieldsets}
  </form>