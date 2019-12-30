TIMEOUT_MAPPINGS =
  info: 10000
  success: 10000
  warning: 10000
  error: 10000

@flash = (message, level='info', timeout=0) ->
  $last = $('.flash-message:visible:last')
  last_top = if $last.size() then ($last.position().top + $last.outerHeight() - $('body').scrollTop()) else 0

  $flash = $("""<div class="alert alert-#{level} fade in flash-message">
    <button type="button" class="close">&times;</button>
    #{message}
  </div>""").css('top', last_top + 10).appendTo('body').fadeIn()

  # 设置提示信息自动消失的时间
  flash_timeout = timeout or TIMEOUT_MAPPINGS[level] or 2000

  # 插入提示信息到页面中
  unless timeout == false
    $flash.delay(flash_timeout).fadeOut () -> $(@).remove()

