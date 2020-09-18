package com.example.vkemotions

import android.view.View
import com.example.vkdonations.epoxy.BaseEpoxyModel
import kotlinx.android.synthetic.main.view_posts_stub.view.*

class PostsStubEpoxyModel(
    private val onClickListener: () -> Unit
) : BaseEpoxyModel(R.layout.view_posts_stub) {
    init {
        id("PostsStubEpoxyModel")
    }

    override fun bind(view: View): Unit = with(view) {
        super.bind(view)
        btnTryAgain.setOnClickListener { onClickListener() }
    }
}