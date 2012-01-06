module ChartHelper
  
  #=======================PRIVATE METHODS=========================
  private
  #===============================================================
  
  def init_pie_options(args={})
    
    args[:options_var]        ||= 'options1'
    args[:render_to]          ||= 'container'
    args[:animation_duration] ||= 1500
    args[:inner_size]         ||= 0
    args[:chart_title]        ||= ''
    args[:credits_text]       ||= 'www.wheredidmytaxdollarsgo.com'
    args[:credits_href]       ||= 'http://www.wheredidmytaxdollarsgo.com'
    args[:func_onclick]       ||= ''
    args[:func_onmouseover]   ||= ''
    args[:func_onmouseout]    ||= ''
    args[:data_labels_enable] ||= 'true'
    args[:data_labels_distance]||= -75
    
    
    response = %{
          // Chart
          var #{args[:options_var]} = {
              chart: {
                  type: 'pie',
                  backgroundColor: null,
                  renderTo: '#{args[:render_to]}',
                  margin: [0, 0, 0, 0]
              },
              animation: {
                  duration: #{args[:animation_duration]},
                  easing: 'swing'
              },
              credits: {
                  text: '#{args[:credits_text]}',
                  href: '#{args[:credits_href]}'
              },
              title: {
                  text: "#{args[:chart_title]}"
              },
              plotArea: {
                  shadow: null,
                  borderWidth: null,
                  backgroundColor: null
              },
              tooltip: {
                  formatter: function () {
                      return '<b>' + this.point.name + '</b><br>$' + this.y.toFixed(0) + ' (' + this.percentage.toFixed(0) + '%)';
                  }
              },
              plotOptions: {
                  pie: {
                      allowPointSelect: true,
                      cursor: 'pointer',
                      innerSize: #{args[:inner_size]},
                      point: {
                          events: {
                              click: function () {#{args[:func_onclick]}},
                              mouseOver: function () {#{args[:func_onmouseover]}},
                              mouseOut: function () {#{args[:func_onmouseout]}}
                          }
                      },
                      dataLabels: {
                          enabled: #{args[:data_labels_enable]},
                          distance: #{args[:data_labels_distance]},
                          formatter: function () {
                              if (this.percentage > 3.0) {
                                  return this.point.name;
                              }
                          },
                          color: 'black',
                          style: {
                              font: 'normal 11px Trebuchet MS, Verdana, sans-serif'
                          }
                      }
                  }
              },
              legend: {
                  enabled: false
              },
              series: []
          };
    }.html_safe
  end
  
end