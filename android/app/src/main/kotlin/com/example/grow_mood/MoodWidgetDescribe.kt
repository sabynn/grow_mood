package com.example.grow_mood

import android.content.Context
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.glance.Button
import androidx.glance.ButtonDefaults
import androidx.glance.GlanceModifier
import androidx.glance.GlanceTheme
import androidx.glance.Image
import androidx.glance.ImageProvider
import androidx.glance.action.ActionParameters
import androidx.glance.action.actionParametersOf
import androidx.glance.action.clickable
import androidx.glance.appwidget.action.actionRunCallback
import androidx.glance.background
import androidx.glance.layout.Alignment
import androidx.glance.layout.Box
import androidx.glance.layout.Column
import androidx.glance.layout.Row
import androidx.glance.layout.Spacer
import androidx.glance.layout.fillMaxWidth
import androidx.glance.layout.height
import androidx.glance.layout.padding
import androidx.glance.layout.size
import androidx.glance.text.FontWeight
import androidx.glance.text.Text
import androidx.glance.text.TextAlign
import androidx.glance.text.TextStyle
import com.example.grow_mood.base.actionStartActivity
import com.example.grow_mood.const.CURRENT_PAGE_KEY
import com.example.grow_mood.const.MOOD_DESCRIPTION_KEY
import java.util.Locale

@Composable
fun DescribeWidget(context: Context, mood: String?, description: String?, page: Int?) {

    Box(
        modifier = GlanceModifier
            .background(Color.White)
            .padding(16.dp)
            .clickable(onClick = actionStartActivity<MainActivity>(context))
    ) {
        Column(
            verticalAlignment = Alignment.Vertical.CenterVertically,
        ) {
            Row(
                modifier = GlanceModifier.fillMaxWidth(),
            ) {
                Column() {
                    Text(
                        "Step 2/2",
                        style = TextStyle(fontSize = 8.sp, textAlign = TextAlign.Left),
                    )
                    Text(
                        "How’d you describe this feeling?",
                        style = TextStyle(
                            fontSize = 14.sp,
                            fontWeight = FontWeight.Medium,
                            textAlign = TextAlign.Left
                        ),
                    )
                }
                Spacer(GlanceModifier.defaultWeight())
                Image(
                    provider = ImageProvider(R.drawable.logo_grab),
                    contentDescription = null,
                    modifier = GlanceModifier.size(32.dp)
                )
            }
            Spacer(GlanceModifier.size(4.dp))
            Row(
                modifier = GlanceModifier.fillMaxWidth()
            ) {
                Image(
                    provider = ImageProvider(getImageResIdForMood(mood ?: "neutral")),
                    contentDescription = null,
                    modifier = GlanceModifier.size(80.dp)
                )
                Spacer(GlanceModifier.size(16.dp))
                Column(modifier = GlanceModifier.fillMaxWidth()) {
                    if (mood != null) {
                        Text(
                            mood.replaceFirstChar { if (it.isLowerCase()) it.titlecase(Locale.getDefault()) else it.toString() },
                            style = TextStyle(
                                fontSize = 14.sp,
                                fontWeight = FontWeight.Medium,
                                textAlign = TextAlign.Left
                            ),
                        )
                    }
                    Spacer(GlanceModifier.size(12.dp))
                    when (mood) {
                        "very unpleasant", "unpleasant" -> {
                            Row(
                                modifier = GlanceModifier.fillMaxWidth()
                            ) {
                                Button(
                                    "Angry",
                                    onClick = actionRunCallback<ChooseMoodDescriptionAction>(
                                        actionParametersOf(
                                            ActionParameters.Key<String>(MOOD_DESCRIPTION_KEY) to "angry"
                                        )
                                    ),
                                    style = TextStyle(
                                        fontSize = 10.sp,
                                        fontWeight = FontWeight.Bold,
                                        textAlign = TextAlign.Center,
                                    ),
                                    modifier = GlanceModifier.defaultWeight().height(30.dp),
                                    colors = ButtonDefaults.buttonColors(
                                        backgroundColor =
                                        if (description == "angry")
                                            GlanceTheme.colors.primary
                                        else GlanceTheme.colors.secondary
                                    )
                                )
                                Spacer(GlanceModifier.size(4.dp))
                                Button(
                                    "Sad",
                                    onClick = actionRunCallback<ChooseMoodDescriptionAction>(
                                        actionParametersOf(
                                            ActionParameters.Key<String>(MOOD_DESCRIPTION_KEY) to "sad"
                                        )
                                    ),
                                    style = TextStyle(
                                        fontSize = 10.sp,
                                        fontWeight = FontWeight.Bold,
                                        textAlign = TextAlign.Center,
                                    ),
                                    modifier = GlanceModifier.defaultWeight().height(30.dp),
                                    colors = ButtonDefaults.buttonColors(
                                        backgroundColor =
                                        if (description == "sad")
                                            GlanceTheme.colors.primary
                                        else GlanceTheme.colors.secondary
                                    )
                                )
                                Spacer(GlanceModifier.size(4.dp))
                                Button(
                                    "Drained",
                                    onClick = actionRunCallback<ChooseMoodDescriptionAction>(
                                        actionParametersOf(
                                            ActionParameters.Key<String>(MOOD_DESCRIPTION_KEY) to "drained"
                                        )
                                    ),
                                    style = TextStyle(
                                        fontSize = 10.sp,
                                        fontWeight = FontWeight.Bold,
                                        textAlign = TextAlign.Center,
                                    ),
                                    modifier = GlanceModifier.defaultWeight().height(30.dp),
                                    colors = ButtonDefaults.buttonColors(
                                        backgroundColor =
                                        if (description == "drained")
                                            GlanceTheme.colors.primary
                                        else GlanceTheme.colors.secondary
                                    )
                                )
                            }
                        }

                        "neutral" -> {
                            Row(
                                modifier = GlanceModifier.fillMaxWidth()
                            ) {
                                Button(
                                    "Calm",
                                    onClick = actionRunCallback<ChooseMoodDescriptionAction>(
                                        actionParametersOf(
                                            ActionParameters.Key<String>(MOOD_DESCRIPTION_KEY) to "calm"
                                        )
                                    ),
                                    style = TextStyle(
                                        fontSize = 10.sp,
                                        fontWeight = FontWeight.Bold,
                                        textAlign = TextAlign.Center,
                                    ),
                                    modifier = GlanceModifier.defaultWeight().height(30.dp),
                                    colors = ButtonDefaults.buttonColors(
                                        backgroundColor =
                                        if (description == "calm")
                                            GlanceTheme.colors.primary
                                        else GlanceTheme.colors.secondary
                                    )
                                )
                                Spacer(GlanceModifier.size(4.dp))
                                Button(
                                    "Drained",
                                    onClick = actionRunCallback<ChooseMoodDescriptionAction>(
                                        actionParametersOf(
                                            ActionParameters.Key<String>(MOOD_DESCRIPTION_KEY) to "drained"
                                        )
                                    ),
                                    style = TextStyle(
                                        fontSize = 10.sp,
                                        fontWeight = FontWeight.Bold,
                                        textAlign = TextAlign.Center,
                                    ),
                                    modifier = GlanceModifier.defaultWeight().height(30.dp),
                                    colors = ButtonDefaults.buttonColors(
                                        backgroundColor =
                                        if (description == "drained")
                                            GlanceTheme.colors.primary
                                        else GlanceTheme.colors.secondary
                                    )
                                )
                            }
                        }

                        "very pleasant", "pleasant" -> {
                            Row(
                                modifier = GlanceModifier.fillMaxWidth()
                            ) {
                                Button(
                                    "Excited",
                                    onClick = actionRunCallback<ChooseMoodDescriptionAction>(
                                        actionParametersOf(
                                            ActionParameters.Key<String>(MOOD_DESCRIPTION_KEY) to "excited"
                                        )
                                    ),
                                    style = TextStyle(
                                        fontSize = 10.sp,
                                        fontWeight = FontWeight.Bold,
                                        textAlign = TextAlign.Center,
                                    ),
                                    modifier = GlanceModifier.defaultWeight().height(30.dp),
                                    colors = ButtonDefaults.buttonColors(
                                        backgroundColor =
                                        if (description == "excited")
                                            GlanceTheme.colors.primary
                                        else GlanceTheme.colors.secondary
                                    )
                                )
                                Spacer(GlanceModifier.size(4.dp))
                                Button(
                                    "Proud",
                                    onClick = actionRunCallback<ChooseMoodDescriptionAction>(
                                        actionParametersOf(
                                            ActionParameters.Key<String>(MOOD_DESCRIPTION_KEY) to "proud"
                                        )
                                    ),
                                    style = TextStyle(
                                        fontSize = 10.sp,
                                        fontWeight = FontWeight.Bold,
                                        textAlign = TextAlign.Center,
                                    ),
                                    modifier = GlanceModifier.defaultWeight().height(30.dp),
                                    colors = ButtonDefaults.buttonColors(
                                        backgroundColor =
                                        if (description == "proud")
                                            GlanceTheme.colors.primary
                                        else GlanceTheme.colors.secondary
                                    )
                                )
                                Spacer(GlanceModifier.size(4.dp))
                                Button(
                                    "Calm",
                                    onClick = actionRunCallback<ChooseMoodDescriptionAction>(
                                        actionParametersOf(
                                            ActionParameters.Key<String>(MOOD_DESCRIPTION_KEY) to "calm"
                                        )
                                    ),
                                    style = TextStyle(
                                        fontSize = 10.sp,
                                        fontWeight = FontWeight.Bold,
                                        textAlign = TextAlign.Center,
                                    ),
                                    modifier = GlanceModifier.defaultWeight().height(30.dp),
                                    colors = ButtonDefaults.buttonColors(
                                        backgroundColor =
                                        if (description == "calm")
                                            GlanceTheme.colors.primary
                                        else GlanceTheme.colors.secondary
                                    )
                                )
                            }
                        }
                    }
                }
            }
            Spacer(GlanceModifier.size(4.dp))
            Row(
                modifier = GlanceModifier.fillMaxWidth(),
                verticalAlignment = Alignment.CenterVertically,
                horizontalAlignment = Alignment.End
            ) {
                if (page != null) {
                    Box(
                        modifier = GlanceModifier
                            .padding(8.dp)
                            .clickable(
                                actionRunCallback<ChangePageAction>(
                                    actionParametersOf(
                                        ActionParameters.Key<Int>(CURRENT_PAGE_KEY) to (page - 1)
                                    )
                                ),
                            )
                    ) {
                        Text(
                            "Back",
                            style = TextStyle(color = GlanceTheme.colors.primary, fontSize = 10.sp)
                        )
                    }
                    Spacer(GlanceModifier.size(8.dp))
                    Button(
                        "Log Mood",
                        onClick = actionRunCallback<ChangePageAction>(
                            actionParametersOf(
                                ActionParameters.Key<Int>(CURRENT_PAGE_KEY) to (page + 1)
                            )
                        ),
                        style = TextStyle(
                            fontSize = 10.sp,
                            fontWeight = FontWeight.Normal,
                            textAlign = TextAlign.Left
                        ),
                        colors = ButtonDefaults.buttonColors(backgroundColor = GlanceTheme.colors.primary)
                    )
                }

            }
        }
    }
}
