package com.example.vkemotions.models

import java.io.Serializable

data class Emotion(
    val emoji: String,
    val description: String
) : Serializable