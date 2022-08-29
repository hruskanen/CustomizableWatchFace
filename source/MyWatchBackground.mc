using Toybox.WatchUi;
using Toybox.Application;
using Toybox.Graphics;

class Background extends WatchUi.Drawable {

    function initialize() {
        var dictionary = { :identifier => "Background" };

        Drawable.initialize(dictionary);
    }

    function draw(dc) {
    	var w = dc.getWidth();
    	var h = dc.getHeight();
    	
        // Set the background color then call to clear the screen
        dc.setColor(Graphics.COLOR_TRANSPARENT, Application.getApp().getProperty("BackgroundColor").toNumber());
        dc.clear();
        
        dc.setColor(Application.getApp().getProperty("HexOneColor").toNumber(), Graphics.COLOR_TRANSPARENT);
        dc.fillPolygon( [[w*.115,h*.805],[w*.025,h*.635],[w*.115,h*.466],[w*.294,h*.466],[w*.384,h*.635],[w*.294,h*.805],[w*.115,h*.805],
        				 [w*.128,h*.779],[w*.051,h*.635],[w*.128,h*.492],[w*.282,h*.492],[w*.358,h*.635],[w*.282,h*.779],[w*.128,h*.779]] );
        dc.clear();
        
        dc.setColor(Application.getApp().getProperty("HexTwoColor").toNumber(), Graphics.COLOR_TRANSPARENT);
        dc.fillPolygon( [[w*.410,h*.987],[w*.320,h*.817],[w*.410,h*.648],[w*.589,h*.648],[w*.679,h*.817],[w*.589,h*.987],[w*.410,h*.987],
        				 [w*.423,h*.961],[w*.346,h*.817],[w*.423,h*.674],[w*.576,h*.674],[w*.653,h*.817],[w*.576,h*.961],[w*.423,h*.961]] );
        dc.clear();
        
        dc.setColor(Application.getApp().getProperty("HexThreeColor").toNumber(), Graphics.COLOR_TRANSPARENT);
        dc.fillPolygon( [[w*.705,h*.805],[w*.615,h*.635],[w*.705,h*.466],[w*.884,h*.466],[w*.974,h*.635],[w*.884,h*.805],[w*.705,h*.805],
        				 [w*.717,h*.779],[w*.641,h*.635],[w*.717,h*.492],[w*.871,h*.492],[w*.948,h*.635],[w*.871,h*.779],[w*.717,h*.779]] );
        dc.clear();
        
    }

}
