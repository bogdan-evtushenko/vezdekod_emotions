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
    private val progressBarDialog by lazy { ProgressBarDialog(this) }

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

        //progressBarDialog.show()
        /*fetchPosts {
            progressBarDialog.dismiss()
            epoxyController.data = it
        }*/
    }

    /*private fun fetchPosts(onCompleteListener: (List<Post>) -> Unit) = GlobalScope.launch {
        val response = try {
            restClient.fetchDonations(2131558458).asDeferred()
        } catch (e: CancellationException) {
            null
        } catch (t: Throwable) {
            println("Error: ${t.message}")
            null
        }

        println("Response Body: ${response?.body()}")

        withContext(Dispatchers.Main) {
            onCompleteListener(response?.body()!!.map { it.donation.apply { id = it.id } })
        }
    }*/

    class EpoxyController(
        private val stubOnClickListener: () -> Unit
    ) : BaseEpoxyController<Post>() {

        override fun buildModels() {
            data?.forEach { post ->
                //DonationItemEpoxyModel(donation).addTo(this)
            }

            PostsStubEpoxyModel(stubOnClickListener).addIf(data.isNullOrEmpty(), this)
        }
    }
}