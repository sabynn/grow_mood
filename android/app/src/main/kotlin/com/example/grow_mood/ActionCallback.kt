package com.example.grow_mood

import android.content.Context
import android.net.Uri
import androidx.glance.GlanceId
import androidx.glance.action.ActionParameters
import androidx.glance.appwidget.action.ActionCallback
import com.example.grow_mood.base.HomeWidgetBackgroundIntent
import com.example.grow_mood.const.CURRENT_PAGE_KEY
import com.example.grow_mood.const.MOOD_DESCRIPTION_KEY
import com.example.grow_mood.const.MOOD_KEY

class ChooseMoodAction : ActionCallback {
    override suspend fun onAction(
        context: Context,
        glanceId: GlanceId,
        parameters: ActionParameters
    ) {

        val backgroundIntent = HomeWidgetBackgroundIntent.getBroadcast(
            context,
            Uri.parse("moodWidget://${parameters[ActionParameters.Key<Int>(MOOD_KEY)]}")
        )
        backgroundIntent.send()

    }
}

class ChooseMoodDescriptionAction : ActionCallback {
    override suspend fun onAction(
        context: Context,
        glanceId: GlanceId,
        parameters: ActionParameters
    ) {

        val backgroundIntent = HomeWidgetBackgroundIntent.getBroadcast(
            context,
            Uri.parse("moodWidget://${parameters[ActionParameters.Key<Int>(MOOD_DESCRIPTION_KEY)]}")
        )
        backgroundIntent.send()
    }
}

class ChangePageAction : ActionCallback {
    override suspend fun onAction(
        context: Context,
        glanceId: GlanceId,
        parameters: ActionParameters
    ) {
        var page = parameters[ActionParameters.Key<Int>(CURRENT_PAGE_KEY)]
        if(page == null) page = 0

        val backgroundIntent = HomeWidgetBackgroundIntent.getBroadcast(
            context,
            Uri.parse("moodWidget://${page}")
        )
        backgroundIntent.send()
    }
}

