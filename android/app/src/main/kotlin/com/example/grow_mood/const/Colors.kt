package com.example.grow_mood.const

import androidx.compose.material3.lightColorScheme
import androidx.compose.ui.graphics.Color
import androidx.glance.material3.ColorProviders

object AppColorScheme {

    private val AppColorScheme = lightColorScheme(
        primary = Color(0xFF00B14F),
        onPrimary = Color(0xFFFFFFFF),
        primaryContainer = Color(0xFFD9FCDE),
        secondary = Color(0xFF326BBF),
        onSecondary = Color(0xFF00B14F),
        onSecondaryContainer = Color(0xFF00B14F),
        tertiary = Color(0x00000000),
    )

    val colors = ColorProviders(
        light = AppColorScheme,
        dark = AppColorScheme
    )

}

