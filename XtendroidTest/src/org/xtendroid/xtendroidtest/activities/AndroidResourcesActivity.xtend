package org.xtendroid.xtendroidtest.activities

import org.xtendroid.app.AndroidActivity
import org.xtendroid.xtendroidtest.R
import org.xtendroid.app.OnCreate
import org.xtendroid.content.res.AndroidResources
import org.xtendroid.xtendroidtest.BuildConfig

/**
 * Created by jasmsison on 26/12/15.
 */
@AndroidActivity(R.layout.activity_main)
class AndroidResourcesActivity {

    /**
     * Tree-shaking during the dex process will remove unnecessary methods/classes
     */
    @AndroidResources(type=R.string, path="res/values/values.xml")
    var Strings1 strings1

    @AndroidResources(type=R.integer, path="res/values/values.xml")
    var Integers1 integers1

    @AndroidResources(type=R.color, path="res/values/values.xml")
    var Colors1 colors1

    @AndroidResources(type=R.dimen, path="res/values/values.xml")
    val Dimens1 dimens1

    @AndroidResources(type=R.bool, path="res/values/values.xml")
    val Bools1 bools1

/*
R
R.anim
R.animator
R.array
R.attr
R.bool
R.color
R.dimen
R.drawable
R.fraction
R.id
R.integer
R.interpolator
R.layout
R.menu
R.mipmap
R.plurals
R.raw
R.string
R.style
R.styleable
R.transition
R.xml
*/

    @OnCreate
    def init()
    {

    }
}