package com.example.grow_mood

import android.content.Context
import androidx.compose.runtime.Composable
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.glance.Button
import androidx.glance.ButtonDefaults
import androidx.glance.GlanceModifier
import androidx.glance.GlanceTheme
import androidx.glance.action.ActionParameters
import androidx.glance.action.actionParametersOf
import androidx.glance.action.clickable
import androidx.glance.appwidget.action.actionRunCallback
import androidx.glance.background
import androidx.glance.layout.Alignment
import androidx.glance.layout.Box
import androidx.glance.layout.Column
import androidx.glance.layout.fillMaxHeight
import androidx.glance.layout.fillMaxWidth
import androidx.glance.layout.height
import androidx.glance.layout.padding
import androidx.glance.text.FontWeight
import androidx.glance.text.Text
import androidx.glance.text.TextAlign
import androidx.glance.text.TextStyle
import com.example.grow_mood.base.actionStartActivity
import com.example.grow_mood.const.CURRENT_PAGE_KEY

@Composable
fun LoggedWidget() {
    Box(
        modifier = GlanceModifier
            .background(Color.White)
            .padding(32.dp)
            .height(140.dp)
            .fillMaxWidth(),
        contentAlignment = Alignment.Center // Center content within the Box
    ) {
        Column(
            verticalAlignment = Alignment.Vertical.CenterVertically,
            horizontalAlignment = Alignment.Horizontal.CenterHorizontally,
        ) {
            Text(
                "Logged. Wait for Recommendation",
                style = TextStyle(fontWeight = FontWeight.Bold, color = GlanceTheme.colors.primary)
            )
            Button(
                "Cancel",
                onClick = actionRunCallback<ChangePageAction>(
                    actionParametersOf(
                        ActionParameters.Key<Int>(CURRENT_PAGE_KEY) to 0
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