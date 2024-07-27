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
import androidx.glance.material3.ColorProviders
import com.example.grow_mood.base.DefaultState
import com.example.grow_mood.base.DefaultStateDefinition
import com.example.grow_mood.const.MOOD_KEY
import androidx.compose.material3.lightColorScheme
import androidx.compose.ui.graphics.Color
import com.example.grow_mood.const.AppColorScheme


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
        var page by remember { mutableIntStateOf(0) }

        if (page == 0) {
            BaseWidget(context, mood) { page += 1 }
        } else if (page == 1) {
            DescribeWidget(context, mood) { page -= 1 };
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





