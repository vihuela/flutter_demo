package uooc.flutterapp

import android.content.Intent
import android.os.Bundle
import io.flutter.app.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant


class MainActivity : FlutterActivity() {
    private var sharedText: String? = "ffffff"

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        GeneratedPluginRegistrant.registerWith(this)

        val intent = getIntent()
        val action = intent.getAction()
        val type = intent.getType()

        if (Intent.ACTION_MAIN.equals(action) && type != null) {
            if ("text/plain".equals(type)) {
                handleSendText(intent); // Handle text being sent
            }
        }

        MethodChannel(flutterView, "app.channel.shared.data").setMethodCallHandler { call, result ->
            if (call.method.contentEquals("getSharedText")) {
                result.success(sharedText)
                sharedText = null
            }
        }
    }

    fun handleSendText(intent: Intent) {
        sharedText = intent.getStringExtra(Intent.EXTRA_TEXT)
    }

}
