using Toybox.WatchUi;
using Toybox.Application;
using Toybox.Graphics;

class Background extends WatchUi.Drawable {

    function initialize() {
        var dictionary = { :identifier => "Background" };

        Drawable.initialize(dictionary);
    }

    function draw(dc) {
        // Set the background color then call to clear the screen
        dc.setColor(Graphics.COLOR_TRANSPARENT, Application.getApp().getProperty("BackgroundColor").toNumber());
        dc.clear();
        
        dc.setColor(Application.getApp().getProperty("HexOneColor").toNumber(), Graphics.COLOR_TRANSPARENT);
        dc.fillPolygon( [[45,314],[10,248],[45,182],[115,182],[150,248],[115,314],[45,314],
        				 [50,304],[20,248],[50,192],[110,192],[140,248],[110,304],[50,304]] );
        dc.clear();
        
        dc.setColor(Application.getApp().getProperty("HexTwoColor").toNumber(), Graphics.COLOR_TRANSPARENT);
        dc.fillPolygon( [[160,385],[125,319],[160,253],[230,253],[265,319],[230,385],[160,385],
        				 [165,375],[135,319],[165,263],[225,263],[255,319],[225,375],[165,375]] );
        dc.clear();
        
        dc.setColor(Application.getApp().getProperty("HexThreeColor").toNumber(), Graphics.COLOR_TRANSPARENT);
        dc.fillPolygon( [[275,314],[240,248],[275,182],[345,182],[380,248],[345,314],[275,314],
        				 [280,304],[250,248],[280,192],[340,192],[370,248],[340,304],[280,304]] );
        dc.clear();
        
    }

}
