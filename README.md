# Badge ANE V1.1.0 for iOS
With Badge ANE you can read and write badge values for your iOS apps.

# asdoc
[find the latest asdoc for this ANE here.](http://myflashlab.github.io/asdoc/index.html?com/myflashlab/air/extensions/badge/package-detail.html)  

**NOTICE**: the demo ANE works only after you hit the "OK" button in the dialog which opens. in your tests make sure that you are NOT calling other ANE methods prior to hitting the "OK" button.
[Download the ANE](https://github.com/myflashlab/Badge-ANE/tree/master/FD/lib)

# Air Usage
```actionscript
import com.myflashlab.air.extensions.badge.Badge;

// If you are using FCM or GCM ANEs to manage notifications, you don't need to call this method.
// because those ANEs have already registered your app for notification in iOS settings.
Badge.register();

// to read the current badge number
trace("current badge is: " + Badge.value);

// to write a new badge value
Badge.value = 2;
```

# Air .xml manifest
```xml
<!--
FOR iOS:
-->
	<InfoAdditions>
		
		<!--
			iOS 8.0 or higher can support this ANE
		-->
		<key>MinimumOSVersion</key>
		<string>8.0</string>
		
	</InfoAdditions>
	
	
	
	
	
<!--
Embedding the ANE:
-->
  <extensions>
	
	<extensionID>com.myflashlab.air.extensions.badge</extensionID>
	
	<!-- download the dependency ANEs from https://github.com/myflashlab/common-dependencies-ANE -->
	<extensionID>com.myflashlab.air.extensions.dependency.overrideAir</extensionID>
	
  </extensions>
-->
```

# Requirements 
1. iOS SDK 8.0 or higher
2. Air SDK 22 or higher
3. This ANE is dependent on overrideAir.ane You need to add these ANEs to your project too. [Download them from here](https://github.com/myflashlab/common-dependencies-ANE).

# Commercial Version
http://www.myflashlabs.com/product/app-badge-air-native-extension/

![Badge ANE](http://www.myflashlabs.com/wp-content/uploads/2016/10/product_adobe-air-ane-extension-badge-2-595x738.jpg)

# Changelog
*Mar 10, 2017 - V1.1.0*
* This ANE is dependent on overrideAir.ane You need to add these ANEs to your project too. [Download them from here](https://github.com/myflashlab/common-dependencies-ANE).

*Oct 23, 2016 - V1.0.0*
* beginning of the journey!
