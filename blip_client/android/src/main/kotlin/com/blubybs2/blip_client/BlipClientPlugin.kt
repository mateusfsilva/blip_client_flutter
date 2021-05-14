package com.blubybs2.blip_client

import android.app.Activity
import android.content.Context
import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import net.take.blipchat.AuthType
import net.take.blipchat.BlipClient
import net.take.blipchat.models.Account
import net.take.blipchat.models.AuthConfig
import net.take.blipchat.models.BlipOptions
import org.json.JSONException
import org.json.JSONObject
import java.net.URI

/** BlipClientPlugin */
class BlipClientPlugin : FlutterPlugin, MethodCallHandler, ActivityAware {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel: MethodChannel
  private lateinit var context: Context
  private lateinit var activity: Activity

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "plugins.blubybs2.com/blip_client")
    channel.setMethodCallHandler(this)

    this.context = flutterPluginBinding.applicationContext
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    try {
      val jsonObject = JSONObject(call.arguments as String);

      if (call.method == "openBlipChat") {
        openBlipChat(jsonObject)

        result.success(true)
      } else if (call.method == "closeBlipChat") {
        closeBlipChat()
      } else if (call.method == "getPlatformVersion") {
        result.success("Android ${android.os.Build.VERSION.RELEASE}")
      } else {
        result.notImplemented()
      }
    } catch (e: JSONException) {
      result.success(false)
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

  override fun onAttachedToActivity(@NonNull binding: ActivityPluginBinding) {
    this.activity = binding.activity
  }

  override fun onDetachedFromActivity() {
    // this.activity = null
  }

  override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
    this.activity = binding.activity
  }

  override fun onDetachedFromActivityForConfigChanges() {
    // this.activity = null
  }

  private fun openBlipChat(params: JSONObject) {
    val apiKey = getAPIKey(params)
    val blipOptions = makeBlipOoptions(params)

    BlipClient.openBlipThread(this.context, apiKey, blipOptions)
  }

  private fun makeBlipOoptions(@NonNull params: JSONObject): BlipOptions {
    val _options = params.getJSONObject("options")
    val _authConfig = _options.getJSONObject("authConfig")
    val _account = _options.getJSONObject("account")

    var authConfig: AuthConfig
    var account: Account

    if (_authConfig.getInt("authType") == 0) {
      authConfig = AuthConfig(AuthType.Guest)
    } else {
      authConfig = AuthConfig(
          AuthType.Dev,
          _authConfig.getString("userIdentity"),
          _authConfig.getString("userPassword")
      )
    }

    account = Account()

    if (_account.has("fullName") && !_account.isNull("fullName")) {
      account.fullName = _account.getString("fullName")
    }

    if (_account.has("address") && !_account.isNull("address")) {
      account.address = _account.getString("address")
    }

    if (_account.has("city") && !_account.isNull("city")) {
      account.city = _account.getString("city")
    }

    if (_account.has("email") && !_account.isNull("email")) {
      account.email = _account.getString("email")
    }

    if (_account.has("phoneNumber") && !_account.isNull("phoneNumber")) {
      account.phoneNumber = _account.getString("phoneNumber")
    }

    if (_account.has("photoUri") && !_account.isNull("photoUri")) {
      account.photoUri = URI.create(_account.getString("photoUri"))
    }

    if (_account.has("cellPhoneNumber") && !_account.isNull("cellPhoneNumber")) {
      account.cellPhoneNumber = _account.getString("cellPhoneNumber")
    }

//    if (_account.has("gender") && _account.isNull("")) {
//      if ((_account["gender"] as Int) == 0) {
//        account.gender = Gender.MALE
//      } else {
//        account.gender = Gender::FEMALE
//      }
//    }

    if (_account.has("culture") && !_account.isNull("culture")) {
      account.culture = _account.getString("culture")
    }

    if (_account.has("extras") && !_account.isNull("extras")) {
      val obj = _account.getJSONObject("extras")
      val _extras = mutableMapOf<String, String>()

      for (extra in obj.keys()) {
        _extras.put(extra, obj.getString(extra))
      }

      account.extras = _extras
    }

    if (_account.has("password") && !_account.isNull("password")) {
      account.password = _account.getString("password")
    }

    if (_account.has("oldPassword") && !_account.isNull("oldPassword")) {
      account.oldPassword = _account.getString("oldPassword")
    }

    if (_account.has("isTemporary") && !_account.isNull("isTemporary")) {
      account.isTemporary = _account.getBoolean("isTemporary")
    }

    if (_account.has("allowGuestSender") && !_account.isNull("allowGuestSender")) {
      account.allowAnonymousSender = _account.getBoolean("allowGuestSender")
    }

    if (_account.has("allowUnknownSender") && !_account.isNull("allowUnknownSender")) {
      account.allowUnknownSender = _account.getBoolean("allowUnknownSender")
    }

    if (_account.has("storeMessageContent") && !_account.isNull("storeMessageContent")) {
      account.storeMessageContent = _account.getBoolean("storeMessageContent")
    }

    if (_account.has("encryptMessageContent") && !_account.isNull("encryptMessageContent")) {
      account.encryptMessageContent = _account.getBoolean("encryptMessageContent")
    }

    val options = BlipOptions()
    options.authConfig = authConfig
    options.account = account

    return options
  }

  private fun getAPIKey(params: JSONObject): String {
    val apiKey = params.getString("appKey")

    return apiKey
  }

  private fun closeBlipChat() {
    //
  }
}
