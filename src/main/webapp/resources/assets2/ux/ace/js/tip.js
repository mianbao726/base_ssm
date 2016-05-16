/**
 * Created by fu.
 * Date: 14-5-14
 * Time: 下午5:07
 */
/**
 *
 * @param html
 * @param ishide  true nohide
 * @param timeout
 * @param pos
 */
var Tip = function (html, ishide, timeout, pos,background) {
    if(!background){
         background='#3F84FF';
    }
    if(ishide){
        html = '<img src="../../assets/img/loading_b.gif"> ' + html;
    }
    var pl = 0,
        pt = 0,
        eleWidth = 350,
        hide = ishide || false,
        $ele = $('<div></div>').html(html)
            .css({
                position:'absolute',
                padding:'10px 20px',
                right:0,
                top:0,
                boxShadow:'5px 5px 13px rgba(0,0,0,.8)',
                minHeight:50,
                fontSize:16,
                zIndex:10000,background:background,color:'#fff', width:300

            }
        );
    timeout = timeout || 1500;

    pl = ($(window).width() - eleWidth) / 2;
    pt = ($(window).height()) / 2;
    pt =  $(document).scrollTop()-40 / 2 + pt;
    pl =  $(document).scrollLeft()-40 / 2 + pl;
    if(typeof pos != 'undefined'){
        if(pos.left != 'auto'){
            pl = pos.left;
        }
        if(pos.top != 'auto'){
            pt = pos.top;
        }

    }

     $ele.css({left:pl, top:pt}).appendTo('body').hide().fadeIn(function () {
        if(!hide){
            setTimeout(function () {
                $ele.fadeOut(function () {
                    $ele.remove();
                });
            }, timeout);

        }
    });

    return $ele;
}