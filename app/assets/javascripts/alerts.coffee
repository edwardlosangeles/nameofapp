# 20171005 ED 5.5 Authorization
# add delay and fadeout to alerts and notices

$(document).ready ->
	$("p.notice").delay(3000).fadeOut(1000)
	$("p.alert").delay(3000).slideUp(1000)
