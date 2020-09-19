package com.example.vkemotions

import android.annotation.SuppressLint
import android.app.Activity
import android.content.Intent
import android.os.Bundle
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import com.example.vkemotions.models.Address
import com.example.vkemotions.models.Emotion
import com.example.vkemotions.models.Post
import com.google.android.libraries.places.api.Places
import com.google.android.libraries.places.api.model.Place
import com.google.android.libraries.places.widget.Autocomplete
import com.google.android.libraries.places.widget.model.AutocompleteActivityMode
import kotlinx.android.synthetic.main.activity_create_post.*

class CreatePostActivity : AppCompatActivity() {
    private val progressBarDialog by lazy { ProgressBarDialog(this) }
    private val post = Post()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_create_post)
        initViews()
    }

    @SuppressLint("SetTextI18n")
    private fun initViews() {

        btnPost.setOnClickListener {
            post.description = editText.text.toString()
            when {
                post.emotion == null -> {
                    showToast("Выберите настроение пожалуйста")
                }
                post.address == null -> {
                    showToast("Выберите локацию пожалуйста")
                }
                else -> {
                    posts.add(post)
                    finish()
                }
            }
        }
        btnClose.setOnClickListener { finish() }
        btnChooseEmotion.setOnClickListener {
            startActivityForResult(
                Intent(this, ChooseEmotionActivity::class.java),
                REQUEST_CHOOSE_EMOTION
            )
        }
        btnChooseLocation.setOnClickListener {
            pickAddress()
        }
    }

    private fun showToast(message: String) {
        Toast.makeText(this, message, Toast.LENGTH_SHORT).show()
    }

    private fun pickAddress() {
        if (!Places.isInitialized()) {
            Places.initialize(applicationContext, "AIzaSyBaRvcdvKvyKZYSq0LOa85GVm27twDH204")
        }
        val fields: List<Place.Field> = listOf(Place.Field.NAME, Place.Field.LAT_LNG)
        val intent =
            Autocomplete.IntentBuilder(AutocompleteActivityMode.FULLSCREEN, fields).build(this)
        startActivityForResult(intent, REQUEST_PLACE_PICKER)
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        if (resultCode != Activity.RESULT_OK) return
        when (requestCode) {
            REQUEST_CHOOSE_EMOTION -> {
                val emotion = data?.getSerializableExtra(EXTRA_EMOTION_ID) as? Emotion
                    ?: throw IllegalStateException()
                post.emotion = emotion
            }
            REQUEST_PLACE_PICKER -> {
                val place = Autocomplete.getPlaceFromIntent(data!!)
                val address = Address(place.latLng!!.latitude, place.latLng!!.longitude, place.name)
                post.address = address
            }
        }
    }

    companion object {
        const val EXTRA_EMOTION_ID = "extra_emotion_id"
        const val REQUEST_CHOOSE_EMOTION = 1
        const val REQUEST_PLACE_PICKER = 2
    }
}