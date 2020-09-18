package com.example.vkemotions

import android.app.Activity
import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import androidx.recyclerview.widget.LinearLayoutManager
import com.example.vkdonations.epoxy.BaseEpoxyController
import com.example.vkemotions.CreatePostActivity.Companion.EXTRA_EMOTION_ID
import com.example.vkemotions.models.Emotion
import com.example.vkemotions.models.Post
import kotlinx.android.synthetic.main.activity_create_post.*
import kotlinx.android.synthetic.main.activity_main.*

class ChooseEmotionActivity : AppCompatActivity() {
    private val epoxyController by lazy { EpoxyController(::setResultOk) }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_choose_emotion)

        btnClose.setOnClickListener { finish() }
        recyclerView.run {
            layoutManager =
                LinearLayoutManager(this@ChooseEmotionActivity, LinearLayoutManager.VERTICAL, false)
            adapter = epoxyController.adapter
        }

        epoxyController.data = listOf(
            Emotion("1F600", "growning face"),
            Emotion("1F600", "growning face"),
            Emotion("1F600", "growning face"),
            Emotion("1F600", "growning face"),
            Emotion("1F600", "growning face"),
            Emotion("1F600", "growning face"),
            Emotion("1F600", "growning face")
        )
    }

    private fun setResultOk(emotion: Emotion) {
        val data = Intent().apply {
            putExtra(EXTRA_EMOTION_ID, emotion)
        }
        setResult(Activity.RESULT_OK, data)
        println("Here data : $data")
        finish()
    }

    class EpoxyController(
        private val onEmotionClickListener: (Emotion) -> Unit
    ) : BaseEpoxyController<Emotion>() {

        override fun buildModels() {
            data?.forEach { emotion ->
                EmotionItemEpoxyModel(emotion, onEmotionClickListener).addTo(this)
            }
        }
    }
}