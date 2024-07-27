package com.example.grow_mood.base

import android.content.Context
import android.content.SharedPreferences
import android.os.Environment
import androidx.datastore.core.DataStore
import androidx.glance.state.GlanceStateDefinition
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.flow
import java.io.File

class DefaultState(val preferences: SharedPreferences)

class DefaultStateDefinition : GlanceStateDefinition<DefaultState> {
    override suspend fun getDataStore(context: Context, fileKey: String): DataStore<DefaultState> {
        val preferences = context.getSharedPreferences(DefaultPlugin.PREFERENCES, Context.MODE_PRIVATE)
        return HomeWidgetGlanceDataStore(preferences)
    }

    override fun getLocation(context: Context, fileKey: String): File {
        return Environment.getDataDirectory()
    }

}

private class HomeWidgetGlanceDataStore(private val preferences: SharedPreferences) : DataStore<DefaultState> {
    override val data: Flow<DefaultState>
        get() = flow { emit(DefaultState(preferences)) }

    override suspend fun updateData(transform: suspend (t: DefaultState) -> DefaultState): DefaultState {
        return transform(DefaultState(preferences))
    }
}