package com.example.vkemotions

import android.annotation.SuppressLint
import android.view.View
import com.example.vkdonations.epoxy.BaseEpoxyModel
import com.example.vkemotions.models.Post
import kotlinx.android.synthetic.main.view_post_item.view.*

class PostItemEpoxyModel(
    private val post: Post
) : BaseEpoxyModel(R.layout.view_post_item) {
    init {
        id("PostItemEpoxyModel", post.toString() + (1..1000).random())
    }

    @SuppressLint("SetTextI18n")
    override fun bind(view: View): Unit = with(view) {
        super.bind(view)
        tvEmoji.text = "${getEmoji(
            Integer.parseInt(
                post.emotion!!.emoji,
                16
            )
        )}   ${post.emotion!!.description}"
        tvDescription.text = post.description
        tvLocation.text = post.address?.locationAddress.orEmpty()
    }


    private fun getEmoji(unicode: Int): String {
        return String(Character.toChars(unicode))
    }
}