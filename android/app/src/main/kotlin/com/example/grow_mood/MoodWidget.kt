package com.example.grow_mood

import android.content.Context
import androidx.compose.runtime.Composable
import androidx.compose.ui.unit.dp
import androidx.glance.GlanceId
import androidx.glance.GlanceModifier
import androidx.glance.GlanceTheme
import androidx.glance.appwidget.GlanceAppWidget
import androidx.glance.appwidget.provideContent
import androidx.glance.background
import androidx.glance.currentState
import androidx.glance.layout.Alignment
import androidx.glance.layout.Column
import androidx.glance.layout.padding
import androidx.glance.layout.Row
import androidx.glance.text.Text
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.unit.sp
import androidx.glance.Button
import androidx.glance.Image
import androidx.glance.ImageProvider
import androidx.glance.action.clickable
import androidx.glance.appwidget.action.actionRunCallback
import androidx.glance.layout.Box
import androidx.glance.layout.Spacer
import androidx.glance.layout.fillMaxWidth
import androidx.glance.layout.size
import androidx.glance.text.FontWeight
import androidx.glance.text.TextAlign
import androidx.glance.text.TextStyle
import androidx.glance.layout.height
import com.example.grow_mood.base.DefaultState
import com.example.grow_mood.base.DefaultStateDefinition
import com.example.grow_mood.base.actionStartActivity

class MyAppWidget : GlanceAppWidget() {
    override val stateDefinition = DefaultStateDefinition()

    override suspend fun provideGlance(context: Context, id: GlanceId) {
        // Load data needed to render the AppWidget.
        // Use `withContext` to switch to another thread for long running
        // operations.
        provideContent {
            // create your AppWidget here
            GlanceTheme {
                MyContent(context, currentState())
            }
        }
    }


    @Composable
    private fun MyContent(context: Context, currentState: DefaultState) {
        val data = currentState.preferences
        val mood = data.getString("mood", "")


        fun getImageResIdForMood(mood: String): Int {
            return when (mood) {
                "very unpleasant" -> R.drawable.mood_very_unpleasant
                "unpleasant" -> R.drawable.mood_unpleasant
                "neutral" -> R.drawable.mood_neutral
                "pleasant" -> R.drawable.mood_pleasant
                "very pleasant" -> R.drawable.mood_very_pleasant
                else -> R.drawable.mood_neutral
            }
        }

        //TODO: pindahin ke fun Composable lain,
        // terus disini bakal diisi logic mutable yg ngecek
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
                            "Step 1/2",
                            style = TextStyle(fontSize = 8.sp, textAlign = TextAlign.Left),
                        )
                        Text(
                            "How you’re feeling right now?",
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
                                "I’m feeling $mood",
                                style = TextStyle(
                                    fontSize = 14.sp,
                                    fontWeight = FontWeight.Medium,
                                    textAlign = TextAlign.Left
                                ),
                            )
                        }
                        Spacer(GlanceModifier.size(12.dp))
                        Row(
                            modifier = GlanceModifier.fillMaxWidth()
                        ) {
                            Image(
                                provider = ImageProvider(
                                    if (mood == "very unpleasant")
                                        R.drawable.chosen_very_unpleasant
                                    else
                                        R.drawable.gray_very_unpleasant
                                ),
                                contentDescription = null,
                                modifier = GlanceModifier.defaultWeight().height(30.dp)
                                    .clickable
                                        (onClick = actionRunCallback<VeryUnpleasantAction>())
                            )
                            Image(
                                provider = ImageProvider(
                                    if (mood == "unpleasant")
                                        R.drawable.chosen_unpleasant
                                    else
                                        R.drawable.gray_unpleasant
                                ),
                                contentDescription = null,
                                modifier = GlanceModifier.defaultWeight().height(30.dp)
                                    .clickable
                                        (onClick = actionRunCallback<UnpleasantAction>())
                            )
                            Image(
                                provider = ImageProvider(
                                    if (mood == "neutral")
                                        R.drawable.chosen_neutral
                                    else
                                        R.drawable.gray_neutral
                                ),
                                contentDescription = null,
                                modifier = GlanceModifier.defaultWeight().height(30.dp)
                                    .clickable
                                        (onClick = actionRunCallback<NeutralAction>())
                            )
                            Image(
                                provider = ImageProvider(
                                    if (mood == "pleasant")
                                        R.drawable.chosen_pleasant
                                    else
                                        R.drawable.gray_pleasant
                                ),
                                contentDescription = null,
                                modifier = GlanceModifier.defaultWeight().height(30.dp)
                                    .clickable
                                        (onClick = actionRunCallback<PleasantAction>())
                            )
                            Image(
                                provider = ImageProvider(
                                    if (mood == "very pleasant")
                                        R.drawable.chosen_very_pleasant
                                    else
                                        R.drawable.gray_very_pleasant
                                ),
                                contentDescription = null,
                                modifier = GlanceModifier.defaultWeight().height(30.dp)
                                    .clickable
                                        (onClick = actionRunCallback<VeryPleasantAction>())
                            )
                        }
                        Spacer(GlanceModifier.size(4.dp))
                        Row(
                            modifier = GlanceModifier.fillMaxWidth()
                        ) {
                            Text(
                                "Very Unpleasant",
                                style = TextStyle(
                                    fontSize = 8.sp,
                                    fontWeight = FontWeight.Normal,
                                    textAlign = TextAlign.Left,
                                ),
                            )
                            Spacer(GlanceModifier.defaultWeight())
                            Text(
                                "Very Pleasant",
                                style = TextStyle(
                                    fontSize = 8.sp,
                                    fontWeight = FontWeight.Normal,
                                    textAlign = TextAlign.Left
                                ),
                            )
                        }
                    }
                }
                Spacer(GlanceModifier.size(4.dp))

                Row(
                    modifier = GlanceModifier.fillMaxWidth(),
                    verticalAlignment = Alignment.CenterVertically,
                    horizontalAlignment = Alignment.End
                ) {
                    Button(
                        "Next",
                        onClick = actionRunCallback<WidgetNext>(),
                        style = TextStyle(
                            fontSize = 10.sp,
                            fontWeight = FontWeight.Normal,
                            textAlign = TextAlign.Left
                        ),
//                        colors = ButtonDefaults.buttonColors(backgroundColor = ColorProvider(R.color.neutral_contrast))
                    )
                }
            }
        }
    }
}




