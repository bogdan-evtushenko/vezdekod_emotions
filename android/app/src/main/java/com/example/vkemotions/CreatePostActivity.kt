package com.example.vkemotions

import android.annotation.SuppressLint
import android.app.Activity
import android.content.Intent
import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import kotlinx.android.synthetic.main.activity_create_post.*

class CreatePostActivity : AppCompatActivity() {
    private val progressBarDialog by lazy { ProgressBarDialog(this) }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_create_post)

        initViews()
    }

    @SuppressLint("SetTextI18n")
    private fun initViews() {
        btnPost.setOnClickListener {

        }
        btnChooseEmotion.setOnClickListener {
            startActivityForResult(
                Intent(this, ChooseEmotionActivity::class.java),
                REQUEST_CHOOSE_EMOTION
            )
        }
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        if (resultCode != Activity.RESULT_OK) return
        when (requestCode) {
            REQUEST_CHOOSE_EMOTION -> {
                val emotion =
                    data?.getSerializableExtra(EXTRA_EMOTION_ID) ?: throw IllegalStateException()
                println("Here choosing emotion stopped on $emotion")
            }
        }
    }

    companion object {
        const val EXTRA_EMOTION_ID = "extra_emotion_id"
        const val REQUEST_CHOOSE_EMOTION = 1
    }
}