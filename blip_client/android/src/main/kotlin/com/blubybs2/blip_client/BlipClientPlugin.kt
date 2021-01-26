package com.blubybs2.blip_client

import android.app.Activity
import android.content.Context
import androidx.annotation.NonNull
import java.net.URI

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar
import net.take.blipchat.AuthType
import net.take.blipchat.BlipClient
import net.take.blipchat.models.Account
import net.take.blipchat.models.Account.Gender.MALE
import net.take.blipchat.models.Account.Gender.FEMALE
import net.take.blipchat.models.AuthConfig
import net.take.blipchat.models.BlipOptions

/** BlipClientPlugin */
class BlipClientPlugin: FlutterPlugin, MethodCallHandler, ActivityAware {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
  private lateinit var context : Context
  private lateinit var activity: Activity

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "plugins.blubybs2.com/blip_client")
    channel.setMethodCallHandler(this)

    context = flutterPluginBinding.applicationContext
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    if (call.method == "openBlipChat") {
      openBlipChat(call.arguments as Map<String, Any>)
    } else if (call.method == "closeBlipChat") {
      closeBlipChat()
    } else if (call.method == "getPlatformVersion") {
      result.success("Android ${android.os.Build.VERSION.RELEASE}")
    } else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

  override fun onAttachedToActivity(@NonNull binding: ActivityPluginBinding) { // fun onAttachedToActivity(@NonNull binding: ActivityPluginBinding) {
    activity = binding.activity
  }

  override fun onDetachedFromActivity() {
    TODO("Not yet implemented")
  }

  override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
    TODO("Not yet implemented")
  }

  override fun onDetachedFromActivityForConfigChanges() {
    TODO("Not yet implemented")
  }

  private fun openBlipChat(params: Map<String, Any>) {
    val apiKey = getAPIKey(params)
    val blipOptions = makeBlipOoptions(params)

    BlipClient.openBlipThread(context, apiKey, blipOptions)
  }

  private fun makeBlipOoptions(@NonNull params: Map<String, Any>): BlipOptions {
    val _options = params["options"] as Map<String, Any>
    val _authConfig = _options["authConfig"] as Map<String, Any>
    val _account = _options["account"] as Map<String, Any>

    var authConfig: AuthConfig
    var account: Account

    if (_authConfig["authType"] == 0) {
      authConfig = AuthConfig(AuthType.Guest)
    } else {
      authConfig = AuthConfig(
        AuthType.Dev,
        _authConfig["userIdentity"] as String,
        _authConfig["userPassword"] as String
      )
    }

    account = Account()

    if (_account["fullName"] != null) {
      account.fullName = _account["fullName"] as String
    }

    if (_account["address"] != null) {
      account.address = _account["address"] as String
    }

    if (_account["city"] != null) {
      account.city = _account["city"] as String
    }

    if (_account["email"] != null) {
      account.email = _account["email"] as String
    }

    if (_account["phoneNumber"] != null) {
      account.phoneNumber = _account["phoneNumber"] as String
    }

    if (_account["photoUri"] != null) {
      account.photoUri = URI.create(_account["photoUri"] as String)
    }

    if (_account["cellPhoneNumber"] != null) {
      account.cellPhoneNumber = _account["cellPhoneNumber"] as String
    }

    // if (_account["gender"] != null) {
    //   if ((_account["gender"] as Int) == 0) {
    //     account.gender = Gender.MALE
    //   } else {
    //     account.gender = Gender.FEMALE
    //   }
    // }

    if (_account["culture"] != null) {
      account.culture = _account["culture"] as String
    }

    if (_account["extras"] != null) {
      account.extras = _account["extras"] as Map<String, String>
    }

    if (_account["password"] != null) {
      account.password = _account["password"] as String
    }

    if (_account["oldPassword"] != null) {
      account.oldPassword = _account["oldPassword"] as String
    }

    if (_account["isTemporary"] != null) {
      account.isTemporary = _account["isTemporary"] as Boolean
    }

    if (_account["allowGuestSender"] != null) {
      account.allowAnonymousSender = _account["allowGuestSender"] as Boolean
    }

    if (_account["allowUnknownSender"] != null) {
      account.allowUnknownSender = _account["allowUnknownSender"] as Boolean
    }

    if (_account["storeMessageContent"] != null) {
      account.storeMessageContent = _account["storeMessageContent"] as Boolean
    }

    if (_account["encryptMessageContent"] != null) {
      account.encryptMessageContent = _account["encryptMessageContent"] as Boolean
    }

    val options = BlipOptions()
    options.authConfig = authConfig
    options.account = account

    return options
  }

  private fun getAPIKey(params: Map<String, Any>): String {
    val apiKey = params["appKey"] as String

    return apiKey
  }

  private fun closeBlipChat() {
    //
  }
}
