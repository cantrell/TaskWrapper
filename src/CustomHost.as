package
{
	import flash.desktop.NativeApplication;
	import flash.events.Event;
	import flash.html.HTMLHost;
	import flash.html.HTMLLoader;
	import flash.html.HTMLWindowCreateOptions;
	
	import mx.core.Window;
	
	public class CustomHost extends HTMLHost
	{
		public override function createWindow(options:HTMLWindowCreateOptions):HTMLLoader
		{
			var win:Window = new Window();
			win.width = 800;
			win.height = 600;
			var browser:Browser = new Browser();
			browser.percentHeight = 100;
			browser.percentWidth = 100;
			win.addChild(browser);
			win.open(true);
			win.addEventListener(Event.CLOSE, onClose);
			return browser.html.htmlLoader;
		}
		
		private function onClose(e:Event):void
		{
			trace("really closing...");
			NativeApplication.nativeApplication.exit(0);
		}
	}
}