package com.example.grow_mood.image

import android.content.Context
import android.graphics.Bitmap
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.rememberCoroutineScope
import androidx.compose.runtime.setValue
import androidx.compose.ui.unit.dp
import androidx.core.graphics.drawable.toBitmapOrNull
import androidx.glance.GlanceModifier
import androidx.glance.GlanceTheme
import androidx.glance.Image
import androidx.glance.ImageProvider
import androidx.glance.action.clickable
import androidx.glance.appwidget.CircularProgressIndicator
import androidx.glance.appwidget.provideContent
import androidx.glance.layout.ContentScale
import androidx.glance.layout.fillMaxSize
import androidx.glance.layout.height
import androidx.glance.layout.width
import coil.imageLoader
import coil.request.CachePolicy
import coil.request.ErrorResult
import coil.request.ImageRequest
import coil.request.SuccessResult
import com.example.grow_mood.const.AppColorScheme
import kotlinx.coroutines.launch

suspend fun Context.getRandomImage(url: String, force: Boolean = false): Bitmap? {
    val request = ImageRequest.Builder(this).data(url).apply {
        if (force) {
            memoryCachePolicy(CachePolicy.DISABLED)
            diskCachePolicy(CachePolicy.DISABLED)
        }
    }.build()

    return when (val result = imageLoader.execute(request)) {
        is ErrorResult -> throw result.throwable
        is SuccessResult -> result.drawable.toBitmapOrNull()
    }
}

@Composable
fun NetworkImage(context: Context, imageUrl: String) {
    val scope = rememberCoroutineScope()
    var randomImage by remember(imageUrl) { mutableStateOf<Bitmap?>(null) }

    LaunchedEffect(imageUrl) {
        randomImage = context.getRandomImage(imageUrl)
    }

    if (randomImage != null) {
        Image(
            provider = ImageProvider(randomImage!!),
            contentDescription = "Image from $imageUrl",
            contentScale = ContentScale.FillBounds,
            modifier = GlanceModifier.height(60.dp).width(60.dp).clickable {
                scope.launch {
                    randomImage = context.getRandomImage(imageUrl, force = true)
                }
            }
        )
    } else {
        CircularProgressIndicator()
    }
}