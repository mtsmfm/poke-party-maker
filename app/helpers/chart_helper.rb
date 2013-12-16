module ChartHelper
  def party_radar(id:, table:, width:, height:)
    tag(:canvas, id: id, width: width, height: height) +
    javascript_tag { "writeRadar('##{id}', '#{table}')".html_safe }
  end
end
