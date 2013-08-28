Xtendroid
=========

Xtendroid is an Android library that combines the power of Xtend with some utility classes/annotations for productive Android development. With Xtendroid, you can spend a lot less time writing boilerplate code and benefit from the tooling support provided by the Xtend framework. Xtendroid is based on the convention-over-configuration philosophy, so resources in Android map automatically to Java getters and setters by name (CamelCase to resource_name mapping).

Examples
--------

If you display toasts often, you know that typing out Toast.makeText... is a pain, and it's not easy to add it to a base class, since Activities may extend multiple base classes (like ListActivity, FragmentActivity, etc.) Here's the easy way using Xtendroid:

```xtend
import static extension com.tobykurien.xtendroid.utils.AlertUtils.*

// elsewhere
toast("My message")

// or in a fragment
activity.toast("My message")
```

Want to access a view in your Activity? Instead of

```java
TextView myTextView;

// elsewhere
myTextView = (TextView) findViewById(R.id.my_text_view);
myTextView.setText("some text");
```

do this using Xtendroid:

```xtend
@AndroidView TextView myTextView // maps to R.id.my_text_view

// elsewhere
getMyTextView.text = "some text" // use the getter for lazy-loading
```

Do you find the AsyncTask boilerplate code too messy? Try the BgTask class:
```xtend
val progressBar = new ProgressDialog(...)
new BgTask<String>.runInBg([|
   // this bit runs in the background
   var retVal = fetchStringFromSomewhere()
   // need to update progress?
   runOnUiThread[| progressBar.progress = 10 ]
   retVal
],[result|
   // this runs in the UI thread
   toast("Got back: " + result) // How cool is this?
])
```

If you are using SharedPreferences, and you have a PreferenceActivity to allow the user to change app settings, then the BasePreferences class and @Preference annotation makes it super-easy to access the settings in your Activity:

Create a Settings class:
```xtend
class Settings extends BasePreferences {
   @Preference boolean enabled = true // maps to preference "enabled"
   @Preference String authToken = ""  // maps to preference "auth_token"

   // convenience method to get instance
   def static Settings getSettings(Context context) {
      return getPreferences(context, typeof(Settings)) as Settings
   }
}
```

Now you can use the Settings class in any Activity:
```xtend
import static extension Settings.*

// elsewhere
if (settings.enabled) {
   settings.authToken = "new auth token" // How cool is this?
}
```

Do you have a list of POJO's that you want to display inside a ListView? The BeanAdapter makes this super easy!

row_user.xml:
```xml
<LinearLayout ... >
 <TextView android:id="@+id/first_name" .../>
 <TextView android:id="@+id/last_name" .../>
 <ImageView android:id="@+id/avatar" .../>
</LinearLayout>
```

The POJO:
```xtend
class User {
  @Property String firstName
  @Property String lastName
  @Property Bitmap avatar
}
```

The Activity:
```xtend
@AndroidView ListView userList // maps to R.id.user_list

// in onCreate
var List<User> users = getUsers(...) // load the POJO's
var adapter = new BeanAdapter<User>(this, R.layout.row_user, users)
getUserList.adapter = adapter
```

For an example of a project that uses this library, see the Webapps project http://github.com/tobykurien/webapps

Getting Started
----------------

Git clone this repository and import it using Eclipse. Add it as a library project to your Xtend project. Now you can use it as shown in the examples above.

More documentation coming soon. This project is in early alpha stage, so expect changes as it matures. Feel free to fork and send me pull requests.

Xtend
-----

For more about Xtend, see http://xtend-lang.org


