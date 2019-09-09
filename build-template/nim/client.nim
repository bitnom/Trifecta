import nerve, nerve/promises
import api
# This file can be compiled for native or JS targets

const host = if defined(js): "" else: "http://127.0.0.1:1234"

proc main() {.async.} =
  let helloClient = IPCService.newHttpClient(host)

  echo await helloClient.greet("Hello", "Nerve") # prints Hello World

when defined(js):
  discard main()
else:
  waitFor main()