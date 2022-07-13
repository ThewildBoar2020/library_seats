
function currentTime(){
var d = new Date(),str = '';
var month = d.getMonth()+1;
var date = d.getDate();
if(month <10){
	month = '0'+month;
}
if(date<10){
	date = '0'+date;
}

 str += d.getFullYear()+'-';
 str  += month+'-';
 str  += date;
return str;
}

/**
datagrid增加ToolTip
*/
$.extend($.fn.datagrid.methods, {
    /**
    * 开打提示功能
    * @param {} jq
    * @param {} params 提示消息框的样式
    * @return {}
    */
    doCellTip: function (jq, params) {
        function showTip(data, td, e) {
            if ($(td).text() == "")
                return;
            data.tooltip.text($(td).text()).css({
                top: (e.pageY + 10) + 'px',
                left: (e.pageX + 20) + 'px',
                'z-index': $.fn.window.defaults.zIndex,
                display: 'block'
            });
        };
        return jq.each(function () {
            var grid = $(this);
            var options = $(this).data('datagrid');
            if (!options.tooltip) {
                var panel = grid.datagrid('getPanel').panel('panel');
                var defaultCls = {
                    'border': '1px solid #333',
                    'padding': '2px',
                    'color': '#333',
                    'background': '#f7f5d1',
                    'position': 'absolute',
                    'max-width': '200px',
                    'border-radius': '4px',
                    '-moz-border-radius': '4px',
                    '-webkit-border-radius': '4px',
                    'display': 'none'
                }
                var tooltip = $("<div id='celltip'></div>").appendTo('body');
                tooltip.css($.extend({}, defaultCls, params.cls));
                options.tooltip = tooltip;
                panel.find('.datagrid-body').each(function () {
                    var delegateEle = $(this).find('> div.datagrid-body-inner').length ? $(this).find('> div.datagrid-body-inner')[0] : this;
                    $(delegateEle).undelegate('td', 'mouseover').undelegate('td', 'mouseout').undelegate('td', 'mousemove').delegate('td', {
                        'mouseover': function (e) {
                            if (params.delay) {
                                if (options.tipDelayTime)
                                    clearTimeout(options.tipDelayTime);
                                var that = this;
                                options.tipDelayTime = setTimeout(function () {
                                    showTip(options, that, e);
                                }, params.delay);
                            }
                            else {
                                showTip(options, this, e);
                            }

                        },
                        'mouseout': function (e) {
                            if (options.tipDelayTime)
                                clearTimeout(options.tipDelayTime);
                            options.tooltip.css({
                                'display': 'none'
                            });
                        },
                        'mousemove': function (e) {
                            var that = this;
                            if (options.tipDelayTime)
                                clearTimeout(options.tipDelayTime);
                            //showTip(options, this, e);
                            options.tipDelayTime = setTimeout(function () {
                                showTip(options, that, e);
                            }, params.delay);
                        }
                    });
                });

            }

        });
    },
    /**
    * 关闭消息提示功能
    *
    * @param {}
    *            jq
    * @return {}
    */
    cancelCellTip: function (jq) {
        return jq.each(function () {
            var data = $(this).data('datagrid');
            if (data.tooltip) {
                data.tooltip.remove();
                data.tooltip = null;
                var panel = $(this).datagrid('getPanel').panel('panel');
                panel.find('.datagrid-body').undelegate('td', 'mouseover').undelegate('td', 'mouseout').undelegate('td', 'mousemove')
            }
            if (data.tipDelayTime) {
                clearTimeout(data.tipDelayTime);
                data.tipDelayTime = null;
            }
        });
    }
});