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
import kotlinx.android.synthetic.main.toolbar_layout.*

class ChooseEmotionActivity : AppCompatActivity() {
    private val epoxyController by lazy { EpoxyController(::setResultOk) }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_choose_emotion)
        ivBack.setOnClickListener { finish() }

        recyclerView.run {
            layoutManager =
                LinearLayoutManager(this@ChooseEmotionActivity, LinearLayoutManager.VERTICAL, false)
            adapter = epoxyController.adapter
        }

        epoxyController.data = listOf(
            Emotion("1F603", "улыбка"),
            Emotion("1F605", "нервный смех"),
            Emotion("1F602", "смех до слез"),
            Emotion("1F609", "подмигивает"),
            Emotion("1F60A", "приятно"),
            Emotion("1F970", "очень приятно"),
            Emotion("1F60D", "влюблен"),
            Emotion("1F618", "поцелуй"),
            Emotion("1F621", "злой"),
            Emotion("1F62D", "громко рыдает"),
            Emotion("1F615", "растерянный"),
            Emotion("1F60B", "вкусно"),
            Emotion("1F973", "вечеринка"),
            Emotion("1F60E", "крутой"),
            Emotion("1F633", "шок"),
            Emotion("1F631", "ужас"),
            Emotion("1F60F", "ухмылка"),
            Emotion("1F637", "карантин")
        )
    }

    private fun setResultOk(emotion: Emotion) {
        val data = Intent().apply {
            putExtra(EXTRA_EMOTION_ID, emotion)
        }
        setResult(Activity.RESULT_OK, data)
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