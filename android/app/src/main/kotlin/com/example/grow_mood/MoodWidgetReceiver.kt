package com.example.grow_mood

import androidx.glance.appwidget.GlanceAppWidget
import com.example.grow_mood.base.DefaultReceiver

class MoodWidgetReceiver : DefaultReceiver<GlanceAppWidget>() {
    override val glanceAppWidget: GlanceAppWidget = MyAppWidget()
}