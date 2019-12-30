# -*- encoding : utf-8 -*-
module ApplicationHelper
  def notice_message
    flash_messages = []

    flash.each do |type, message|
      type = :success if type.to_sym == :notice
      type = :danger  if type.to_sym == :alert
      text = content_tag(:div, link_to(raw('<i class="fa fa-close"></i>'), '#', :class => 'close', 'data-dismiss' => 'alert') + message, class: "alert alert-#{type}")
      flash_messages << text if message
    end

    flash_messages.join("\n").html_safe
  end

  # 分页
  def pagination(records)
    render '/layouts/pagination', records: records
  end

  def show_product_status(m)
    if m == 'shangjia'
      %(
        <span class="label label-success">上架中</span>
      ).html_safe
    else
      %(
        <span class="label label-danger">已下架</span>

      ).html_safe
    end
  end

  def show_order_status(m)
    if m == 'payed'
      %(
        <span class="label label-success">已支付</span>
      ).html_safe
    else
      %(
        <span class="label label-danger">未支付</span>

      ).html_safe
    end
  end

end
