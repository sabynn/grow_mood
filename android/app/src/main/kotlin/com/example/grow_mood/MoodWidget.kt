package com.example.grow_mood

import android.content.Context
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableIntStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.glance.GlanceId
import androidx.glance.GlanceTheme
import androidx.glance.appwidget.GlanceAppWidget
import androidx.glance.appwidget.provideContent
import androidx.glance.currentState
import com.example.grow_mood.base.DefaultState
import com.example.grow_mood.base.DefaultStateDefinition
import com.example.grow_mood.const.MOOD_KEY
import com.example.grow_mood.const.AppColorScheme
import com.example.grow_mood.const.CURRENT_PAGE_KEY
import com.example.grow_mood.const.MOOD_DESCRIPTION_KEY


class MyAppWidget : GlanceAppWidget() {
    override val stateDefinition = DefaultStateDefinition()

    override suspend fun provideGlance(context: Context, id: GlanceId) {
        // Load data needed to render the AppWidget.
        // Use `withContext` to switch to another thread for long running
        // operations.
        provideContent {
            // create your AppWidget here
            GlanceTheme(AppColorScheme.colors) {
                MyContent(context, currentState())
            }
        }
    }


    @Composable
    private fun MyContent(context: Context, currentState: DefaultState) {
        val data = currentState.preferences
        val mood = data.getString(MOOD_KEY, "")
        var description = data.getString(MOOD_DESCRIPTION_KEY, "")
        //        var page by remember { mutableIntStateOf(0) }

        when (val page = data.getInt(CURRENT_PAGE_KEY, 0)) {
            0 -> {
                BaseWidget(context, mood, page)
            }
            1 -> {
                DescribeWidget(context, mood, description, page)
            }
            2 -> {
                RecommendationWidget(context, mood, page)
            }
        }
    }
}

public fun getImageResIdForMood(mood: String): Int {
    return when (mood) {
        "very unpleasant" -> R.drawable.mood_very_unpleasant
        "unpleasant" -> R.drawable.mood_unpleasant
        "neutral" -> R.drawable.mood_neutral
        "pleasant" -> R.drawable.mood_pleasant
        "very pleasant" -> R.drawable.mood_very_pleasant
        else -> R.drawable.mood_neutral
    }
}





