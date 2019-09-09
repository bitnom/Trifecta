import os

when system.hostOS == "windows" or system.hostOS == "linux" or system.hostOS == "macosx":
    import webview

    var cwd = getCurrentDir()
    var wv = newWebView("App", "file://" & cwd & "/index.html")
    wv.run()

discard """import asynchttpserver, asyncdispatch, nerve, nerve/web
import api

let server = newAsyncHttpServer()

proc generateCb(): proc (req: Request): Future[void] {.gcsafe.} =
  # Generate server callback in a function to avoid making the rpc server global
  # A threadlocal var could be used instead, or a manual gcsafe annotation

  let helloServer = IPCService.newServer()

  proc cb(req: Request) {.async, gcsafe.} =
    case req.url.path
    of IPCService.rpcUri: # Const string provided to service
      # Do the rpc dispatch for the service, with the given server
      await req.respond(Http200, $ await IPCService.routeRpc(helloServer, req.body))
    of "/client.js": # Send client file (make sure to compile it first)
      let headers = newHttpHeaders()
      headers["Content-Type"] = "application/javascript"
      await req.respond(Http200, readFile("client.js"), headers)
    of "/": # Send index html
      await req.respond(Http200, '''<html><head><meta charset="UTF-8"></head><body>Testing</body><script src="client.js"></script></html>''')
    else: # Not found
      await req.respond(Http404, "Not Found")

  result = cb




waitFor server.serve(Port(42727), generateCb())"""
