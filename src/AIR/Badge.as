package com.myflashlab.air.extensions.badge
{
import flash.external.ExtensionContext;
import flash.events.StatusEvent;
import flash.utils.getDefinitionByName;
import flash.utils.getQualifiedClassName;


/**
 * The Badge ANE will allow you read and write the badge number for your iOS apps.
 *
 * @author Hadi Tavakoli - 10/23/2016 3:39 PM
 */
public class Badge
{
	private static const DEMO_ANE:Boolean = true;
	
	public static const EXTENSION_ID:String = "com.myflashlab.air.extensions.badge";
	public static const VERSION:String = "1.1.41";
	private var _context:ExtensionContext;
	
	private var OverrideClass:Class;
	
	private static var _ex:Badge;
	
	/** @private */
	public function Badge():void
	{
		OverrideClass = getDefinitionByName("com.myflashlab.air.extensions.dependency.OverrideAir") as Class;
		
		// Tell Override ANE to read the ANE-LAB ID from the manifest. This must happen on Android and iOS.
		// Pass id/version of this ANE to Override ANE so it can check its validity.
		OverrideClass["applyToAneLab"](getQualifiedClassName(this));
		
		_context = ExtensionContext.createExtensionContext(EXTENSION_ID, null);
		
		if(DEMO_ANE) _context.call("command", "isTestVersion");
	}
	
	// ------------------------------------------------------------------------------------------------------------------------------------ methods
	
	/**
	 * Call this method so iOS can allow your app to have access to the badges. If you are using our FCM/GCM ANE,
	 * you must not call this method at all because those extensions have already registered your app for notifications.
	 */
	public static function register():void
	{
		if(!_ex) _ex = new Badge();
		
		_ex._context.call("command", "registerUserNotification");
	}
	
	/**
	 * Indicates the current badge value for your app.
	 */
	public static function get value():int
	{
		if(!_ex) _ex = new Badge();
		
		return _ex._context.call("command", "readBadge") as int;
	}
	
	/**
	 * @private
	 */
	public static function set value(a:int):void
	{
		if(!_ex) _ex = new Badge();
		
		_ex._context.call("command", "writeBadge", a);
	}
}
}