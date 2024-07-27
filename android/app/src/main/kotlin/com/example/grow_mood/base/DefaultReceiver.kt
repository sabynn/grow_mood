package com.example.grow_mood.base

import android.appwidget.AppWidgetManager
import android.content.Context
import androidx.glance.appwidget.GlanceAppWidget
import androidx.glance.appwidget.GlanceAppWidgetManager
import androidx.glance.appwidget.GlanceAppWidgetReceiver
import androidx.glance.appwidget.state.updateAppWidgetState
import kotlinx.coroutines.runBlocking

abstract class DefaultReceiver<T : GlanceAppWidget> : GlanceAppWidgetReceiver() {

    abstract override val glanceAppWidget: T

    override fun onUpdate(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetIds: IntArray
    ) {
        super.onUpdate(context, appWidgetManager, appWidgetIds)
        runBlocking {
            appWidgetIds.forEach {
                val glanceId = GlanceAppWidgetManager(context).getGlanceIdBy(it)
                glanceAppWidget.apply {
                    if (this.stateDefinition is DefaultStateDefinition) {
                        // Must Update State
                        updateAppWidgetState<DefaultState>(
                            context = context,
                            this.stateDefinition as DefaultStateDefinition,
                            glanceId) { currentState ->
                            currentState
                        }
                    }
                    // Update widget.
                    update(context, glanceId)
                }
            }
        }
    }
}