package com.example.vkemotions.models

import java.io.Serializable

data class Post(
    var emotion: Emotion? = null,
    var address: Address? = null,
    var description: String? = null
) : Serializable