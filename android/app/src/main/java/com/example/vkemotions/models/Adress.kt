package com.example.vkemotions.models

import android.annotation.SuppressLint
import android.os.Parcelable
import kotlinx.android.parcel.Parcelize

@SuppressLint("ParcelCreator")
@Parcelize
data class Address(
    val latitude: Double = 0.0,
    val longitude: Double = 0.0,
    val locationAddress: String? = null
) : Parcelable