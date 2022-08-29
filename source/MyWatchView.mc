using Toybox.WatchUi;
using Toybox.Graphics;
using Toybox.System;
using Toybox.Lang;
using Toybox.Application;
using Toybox.ActivityMonitor;
using Toybox.Time;
using Toybox.Time.Gregorian;

class MyWatchView extends WatchUi.WatchFace {

	var hexSpacing = [[.208,.635],[.503,.817],[.798,.635]];

    function initialize() {
        WatchFace.initialize();
    }

    // Load your resources here
    function onLayout(dc) {
        setLayout(Rez.Layouts.WatchFace(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {
    }

    // Update the view
    function onUpdate(dc) {
    	var w = dc.getWidth();
    	var h = dc.getHeight();
    
        // Get the current time and format it correctly
        var timeFormat = "$1$:$2$";
        var clockTime = System.getClockTime();
        var hours = clockTime.hour;
        if ((!Application.getApp().getProperty("UseMilitaryFormat")) && hours > 12) {
        	hours = hours - 12;
        }
        
        //var timeString = Lang.format(timeFormat, [hours, clockTime.min.format("%02d")]);
        var hourString = hours.format("%02d");
        var minuteString = clockTime.min.format("%02d");

        // Update the view
        		
		var viewHour = View.findDrawableById("HourLabel");
        viewHour.setColor(Application.getApp().getProperty("HourColor").toNumber());
        viewHour.setText(hourString.toString());
        viewHour.setLocation(w*.495, h*.046);
        
        var viewMinute = View.findDrawableById("MinuteLabel");
        viewMinute.setColor(Application.getApp().getProperty("MinuteColor").toNumber());
        viewMinute.setText(minuteString.toString());
        viewMinute.setLocation(w*.495, h*.294);
        
        var today = Gregorian.info(Time.now(), Time.FORMAT_SHORT);
        
        var monthAbr = ["Jan", "Feb", "Mar", "Apr", "May", "June", "July", "Aug", "Sept", "Oct", "Nov", "Dec"];
        var viewMonth = View.findDrawableById("MonthLabel");
        viewMonth.setColor(Application.getApp().getProperty("MonthColor").toNumber());
        viewMonth.setText(monthAbr[today.month-1]);
        viewMonth.setLocation(w*.215, h*.215);
        
        var viewDay = View.findDrawableById("DayLabel");
        viewDay.setColor(Application.getApp().getProperty("DayColor").toNumber());
        viewDay.setText(today.day.toString());
        viewDay.setLocation(w*.175, h*.325);
        
        var dayAbr = ["Sun", "Mon", "Tues", "Wed", "Thur", "Fri", "Sat"];
        var viewDayOfWeek = View.findDrawableById("DayOfWeekLabel");
        viewDayOfWeek.setColor(Application.getApp().getProperty("DayOfWeekColor").toNumber());
        viewDayOfWeek.setText(dayAbr[today.day_of_week-1]);
        viewDayOfWeek.setLocation(w*.800, h*.325);
        
		//var stats = System.getSystemStats();
		//var pwr = stats.battery;
		//var batStr = Lang.format( "$1$%", [ pwr.format( "%2d" ) ] );
		var pwr = System.getSystemStats().battery;
		var batStr = Lang.format( "$1$%", [ pwr.format( "%2d" ) ] );
		var viewPower = View.findDrawableById("BatteryLabel");
        viewPower.setColor(Application.getApp().getProperty("BatteryColor").toNumber());
        viewPower.setText(batStr);
		viewPower.setLocation(w*.800, h*.205);

        
        var hexDataSettings = [Application.getApp().getProperty("HexOneData"), Application.getApp().getProperty("HexTwoData"), Application.getApp().getProperty("HexThreeData")];
		//for (var i = 0; i < 3; i++) {
		//	addData(i, hexDataSettings[i], w, h);
		//}
		addData(0, hexDataSettings[0], w, h, 8);
		addData(1, hexDataSettings[1], w, h, 8888);
		addData(2, hexDataSettings[2], w, h, 888888);
        
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
    }

    // The user has just looked at their watch. Timers and animations may be started here.
    function onExitSleep() {
    }

    // Terminate any active timers and prepare for slow updates.
    function onEnterSleep() {
    }
    
    function addData(hex, dataChoice, w, h, temp) {
    	var dataTypes = ["NONE", ActivityMonitor.getInfo().steps, System.getDeviceSettings().notificationCount, Activity.getActivityInfo().currentHeartRate, Activity.getActivityInfo().calories];
		var dataThing = dataTypes[dataChoice];
    	var viewThing = [View.findDrawableById("HexOneLabel"), View.findDrawableById("HexTwoLabel"), View.findDrawableById("HexThreeLabel")];
    	var thingColors = [Application.getApp().getProperty("HexOneDataColor").toNumber(), Application.getApp().getProperty("HexTwoDataColor").toNumber(), Application.getApp().getProperty("HexThreeDataColor").toNumber()];
        viewThing[hex].setColor(thingColors[hex]);
		dataThing = temp;
		
        if ( dataThing == "NONE" ){
			viewThing[hex].setFont(Graphics.FONT_NUMBER_HOT);
	        viewThing[hex].setLocation(w*hexSpacing[hex][0],(h*hexSpacing[hex][1])-(Graphics.getFontHeight(Graphics.FONT_NUMBER_HOT)*.5));
	        viewThing[hex].setText(" ");
		} else if ( dataThing == null ) {
	        viewThing[hex].setFont(Graphics.FONT_NUMBER_HOT);
	        viewThing[hex].setLocation(w*hexSpacing[hex][0],(h*hexSpacing[hex][1])-(Graphics.getFontHeight(Graphics.FONT_NUMBER_HOT)*.5));
	        viewThing[hex].setText("-");
        } else if ( dataThing < 10 ) {
	        viewThing[hex].setFont(Graphics.FONT_NUMBER_HOT);
	        viewThing[hex].setLocation(w*hexSpacing[hex][0],(h*hexSpacing[hex][1])-(Graphics.getFontHeight(Graphics.FONT_NUMBER_HOT)*.5));
	        viewThing[hex].setText(dataThing.toString());
        } else if ( dataThing < 100 ) {
	        viewThing[hex].setFont(Graphics.FONT_NUMBER_MEDIUM);
	        viewThing[hex].setLocation(w*hexSpacing[hex][0],(h*hexSpacing[hex][1])-(Graphics.getFontHeight(Graphics.FONT_NUMBER_MEDIUM)*.5));
	        viewThing[hex].setText(dataThing.toString());
        } else if ( dataThing < 1000 ) {
	        viewThing[hex].setFont(Graphics.FONT_NUMBER_MILD);
	        viewThing[hex].setLocation(w*hexSpacing[hex][0],(h*hexSpacing[hex][1])-(Graphics.getFontHeight(Graphics.FONT_NUMBER_MILD)*.5));
	        viewThing[hex].setText(dataThing.toString());
        } else if ( dataThing < 10000 ) {
	        viewThing[hex].setFont(Graphics.FONT_MEDIUM);
	        viewThing[hex].setLocation(w*hexSpacing[hex][0],(h*hexSpacing[hex][1])-(Graphics.getFontHeight(Graphics.FONT_MEDIUM)*.5));
	        viewThing[hex].setText(dataThing.toString());
        } else if ( dataThing < 100000 ) {
	        viewThing[hex].setFont(Graphics.FONT_SMALL);
	        viewThing[hex].setLocation(w*hexSpacing[hex][0],(h*hexSpacing[hex][1])-(Graphics.getFontHeight(Graphics.FONT_SMALL)*.5));
	        viewThing[hex].setText(dataThing.toString());
        } else if ( dataThing < 1000000 ) {
	        viewThing[hex].setFont(Graphics.FONT_SYSTEM_TINY);
	        viewThing[hex].setLocation(w*hexSpacing[hex][0],(h*hexSpacing[hex][1])-(Graphics.getFontHeight(Graphics.FONT_SYSTEM_TINY)*.5));
	        viewThing[hex].setText(dataThing.toString());
        } else {
        	viewThing[hex].setFont(Graphics.FONT_MEDIUM);
	        viewThing[hex].setLocation(w*hexSpacing[hex][0],(h*hexSpacing[hex][1])-(Graphics.getFontHeight(Graphics.FONT_MEDIUM)*.5));
	        viewThing[hex].setText("ALOT");
        }
    }
    

}
