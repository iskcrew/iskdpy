@isk = @isk || {}

send_login = (username, password) ->
  $.post "/login?format=json", {username: username, password: password}
    .fail (d) ->
      console.log 'Login failed', d?.responseJSON?.message
      isk.menu.displays.hide()
    .done (data) ->
      if data?.message
        isk.menu.displays.show()

send_logout = ->
  $.post "/login?format=json", {_method: "delete"}
    .success ->
      show_login()
      isk.menu.displays.hide()

show_login = ->
  ul=$('<ul />')
  ul.append '<li><label>Username:</label><input type="text" id="username" /></li>'
  ul.append '<li><label>Password:</label><input type="password" id="password" /></li>'
  ul.append '<li><label> </label><input type="submit" id="submit" value="Login"/></li>'
  ul.find('#submit').click (e) ->
    send_login ul.find('#username').val(), ul.find('#password').val()

  ul.find('input').keypress (e) ->
    if e.key == 'Enter'
      ul.find('#submit').click()
      false

  $('#ISKDPY #menu #login').html ul
  true

show_logout = ->
  ul=$('<ul />')
    .html '<li><input type="submit" id="logout" value="Logout"/></li>'
    .find('#logout').click send_logout

  $('#ISKDPY #menu #login').html ul

# EXPORTS:
@isk.show_login=show_login
@isk.show_logout=show_logout
