import nerve, nerve/web

service IPCService, "/ipc":

  # Normal Nim proc definition
  proc hello(): Future[wstring] =   # Return type must be a future
    result = newFuture[wstring]()   # wstring is compatiable with karax's kstring
    result.complete("pong")  # More on why its needed later

  proc greet(greeting, name: wstring): Future[wstring] =
    result = fwrap(greeting & " " & name) # Utility function for declaring and completing a future