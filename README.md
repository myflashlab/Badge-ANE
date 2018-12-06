# Badge ANE for iOS Adobe AIR apps #
With Badge ANE you can read and write badge values for your iOS apps.

* [Click here for ASDOC](http://myflashlab.github.io/asdoc/index.html?com/myflashlab/air/extensions/badge/package-detail.html)
* [See the ANE setup requirements](https://github.com/myflashlab/Badge-ANE/blob/master/src/ANE/extension.xml)

**IMPORTANT:** Implementing ANEs in your AIR projects means you may be required to add some [dependencies](https://github.com/myflashlab/common-dependencies-ANE) or copy some frameworks or editing your app's manifest file. Our ANE setup instruction is designed in a human-readable format but you may still need to familiarize yourself with this format. [Read this post for more information](https://www.myflashlabs.com/understanding-ane-setup-instruction/)

If you think manually setting up ANEs in your projects is confusing or time-consuming, you better check the [ANELAB Software](https://github.com/myflashlab/ANE-LAB/).

[![The ANE-LAB Software](https://www.myflashlabs.com/wp-content/uploads/2017/12/myflashlabs-ANE-LAB_features.jpg)](https://github.com/myflashlab/ANE-LAB/)

# Tech Support #
If you need our professional support to help you with implementing and using the ANE in your project, you can join [MyFlashLabs Club](https://www.myflashlabs.com/product/myflashlabs-club-membership/) or buy a [premium support package](https://www.myflashlabs.com/product/myflashlabs-support/). Otherwise, you may create new issues at this repository and the community might help you.

# Air Usage
```actionscript
import com.myflashlab.air.extensions.badge.Badge;

// If you are using the FCM ANE to manage notifications, you don't need to call this method.
// because those ANEs have already registered your app for notification in iOS settings.
Badge.register();

// to read the current badge number
trace("current badge is: " + Badge.value);

// to write a new badge value
Badge.value = 2;
```

Are you using this ANE in your project? Maybe you'd like to buy us a beer :beer:?

[![paypal](https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_donations&business=payments@myflashlabs.com&lc=US&item_name=Donation+to+Badge+ANE&no_note=0&cn=&currency_code=USD&bn=PP-DonationsBF:btn_donateCC_LG.gif:NonHosted)

Add your name to the below list? Donate anything more than $100 and it will be.

## Sponsored by... ##
<table align="left">
    <tr>
        <td align="left"><img src="https://via.placeholder.com/128?text=LOGO" width="60" height="60"></td>
        <td align="left"><a href="#">your_website.com</a><br>Your company motto can be here!</td>
    </tr>
</table>