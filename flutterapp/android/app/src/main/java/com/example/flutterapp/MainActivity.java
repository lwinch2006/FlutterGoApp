package com.example.flutterapp;

import androidx.annotation.NonNull;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;
import Services.MathService;
import Services.GreetingService;

public class MainActivity extends FlutterActivity {
    private static final String CHANNEL = "github.com/lwinch2006/FlutterGoApp/Services";

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);
        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL)
                .setMethodCallHandler(
                        (call, result) -> {
                            switch (call.method) {
                                case "getRandomNumber":
                                    MathService mathService = new MathService();
                                    result.success(mathService.getRandomNumber());
                                    break;

                                case "getGreeting":
                                    GreetingService greetingService = new GreetingService();
                                    result.success(greetingService.getGreeting());
                                    break;

                                default:
                                    result.notImplemented();
                                    break;
                            }
                        }
                );
    }
}
