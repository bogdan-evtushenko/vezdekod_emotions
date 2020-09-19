package com.example.vkemotions

import android.content.Intent
import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import androidx.recyclerview.widget.LinearLayoutManager
import com.example.vkdonations.epoxy.BaseEpoxyController
import com.example.vkemotions.models.Post
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : AppCompatActivity() {

    private val epoxyController by lazy { EpoxyController {} }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        btnDonations.setOnClickListener {
            startActivity(
                Intent(
                    this,
                    CreatePostActivity::class.java
                )
            )
        }

        recyclerView.run {
            layoutManager =
                LinearLayoutManager(this@MainActivity, LinearLayoutManager.VERTICAL, false)
            adapter = epoxyController.adapter
        }

        epoxyController.requestModelBuild()
    }

    override fun onStart() {
        super.onStart()
        epoxyController.data = posts
    }

    class EpoxyController(
        private val stubOnClickListener: () -> Unit
    ) : BaseEpoxyController<Post>() {

        override fun buildModels() {
            data?.forEach { post ->
                PostItemEpoxyModel(post).addTo(this)
            }

            PostsStubEpoxyModel(stubOnClickListener).addIf(data.isNullOrEmpty(), this)
        }
    }
}