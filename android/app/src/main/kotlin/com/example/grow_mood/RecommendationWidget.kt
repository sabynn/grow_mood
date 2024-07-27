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
import androidx.glance.layout.padding
import androidx.glance.layout.size
import androidx.glance.text.FontWeight
import androidx.glance.text.Text
import androidx.glance.text.TextAlign
import androidx.glance.text.TextStyle
import com.example.grow_mood.base.actionStartActivity
import com.example.grow_mood.const.CURRENT_PAGE_KEY
import com.example.grow_mood.image.NetworkImage

@Composable
fun RecommendationWidget(context: Context, mood: String?, page: Int?) {
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
                        "Your mood: $mood",
                        style = TextStyle(fontSize = 8.sp, textAlign = TextAlign.Left),
                    )
                    Text(
                        "You need this treat!",
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
                NetworkImage(
                    context = context,
                    imageUrl = "https://cdn.discordapp.com/attachments/784066636935331860/1266782651851997296/Rectangle_48.png?ex=66a666c7&is=66a51547&hm=7194295f441a0a53fe9cdc0f4361ec32d75c5a2c3e87bb4d960c3d0d79ca52b2&"
                )
                Spacer(GlanceModifier.size(16.dp))
                Column(modifier = GlanceModifier.fillMaxWidth()) {
                    Text(
                        "Dark Chocolate",
                        style = TextStyle(
                            fontSize = 14.sp,
                            fontWeight = FontWeight.Bold,
                            textAlign = TextAlign.Left
                        ),
                    )
                    Spacer(GlanceModifier.size(4.dp))
                    Text(
                        "Sugar boost serotonin levels",
                        style = TextStyle(
                            fontSize = 12.sp,
                            fontWeight = FontWeight.Normal,
                            textAlign = TextAlign.Left
                        ),
                    )
                    Spacer(GlanceModifier.size(8.dp))
                    Box(
                        modifier = GlanceModifier
                            .padding(8.dp)
                            .clickable(
                                actionStartActivity<MainActivity>(context),
                            )
                    ) {
                        Text(
                            "All Recommendations",
                            style = TextStyle(
                                color = GlanceTheme.colors.secondary,
                                fontSize = 8.sp,
                                fontWeight = FontWeight.Normal
                            )
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
                if (page != null) {
                    Box(
                        modifier = GlanceModifier
                            .padding(8.dp)
                            .clickable(
                                actionRunCallback<ChangePageAction>(
                                    actionParametersOf(
                                        ActionParameters.Key<Int>(CURRENT_PAGE_KEY) to 0
                                    )
                                )
                            )
                    ) {
                        Text(
                            "Done",
                            style = TextStyle(color = GlanceTheme.colors.primary, fontSize = 10.sp)
                        )
                    }
                }
                Spacer(GlanceModifier.size(8.dp))
                if (page != null) {
                    Button(
                        "Buy In GrabFood",
                        onClick = actionStartActivity<MainActivity>(context),
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