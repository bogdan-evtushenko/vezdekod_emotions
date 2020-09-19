package com.example.vkemotions

import android.view.View
import com.example.vkdonations.epoxy.BaseEpoxyModel
import com.example.vkemotions.models.Emotion
import kotlinx.android.synthetic.main.view_emotion_item.view.*

class EmotionItemEpoxyModel(
    private val emotion: Emotion,
    private val onClickListener: (Emotion) -> Unit
) : BaseEpoxyModel(R.layout.view_emotion_item) {
    init {
        id("EmotionItemEpoxyModel", emotion.toString())
    }

    override fun bind(view: View): Unit = with(view) {
        super.bind(view)
        tvEmoji.text = getEmoji(Integer.parseInt(emotion.emoji, 16))
        tvDescription.text = emotion.description
        parentLayout.setOnClickListener {
            onClickListener(emotion)
        }
    }


    private fun getEmoji(unicode: Int): String {
        return String(Character.toChars(unicode))
    }
}