package digi.mind.dmp

import io.flutter.embedding.android.FlutterActivity
import androidx.annotation.NonNull;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugins.GeneratedPluginRegistrant;
import android.os.Bundle
import com.yandex.mapkit.MapKitFactory;

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        MapKitFactory.setApiKey("96bf4dbd-4376-4fb3-84f8-dfc66c89bce2")
        GeneratedPluginRegistrant.registerWith(flutterEngine)
    }
}
