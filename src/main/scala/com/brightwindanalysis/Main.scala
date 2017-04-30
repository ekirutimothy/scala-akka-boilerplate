/*
 * Copyright (C) BrightWind - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 */

package com.brightwindanalysis

import akka.actor.ActorSystem
import akka.event.Logging
import akka.stream.ActorMaterializer
import com.brightwindanalysis.http.Web

object Main extends Web with App {

  private[this] implicit val actorSystem = ActorSystem("scala-akka-boilerplate")
  private[this] implicit val materializer = ActorMaterializer()
  private[this] implicit val executionContext = actorSystem.dispatcher

  private[this] val log = Logging(actorSystem, getClass.getName)

  bindAndHandleHttp {
    log.debug("onStart")
    log.error("ignore me: slack test")
  }
}
