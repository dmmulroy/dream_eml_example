#1 "bin/template.eml.html"
let render param =
let ___eml_buffer = Buffer.create 4096 in
(Buffer.add_string ___eml_buffer "<html>\n<body>\n  <h1>The URL parameter was ");
(Printf.bprintf ___eml_buffer "%s" (Dream_pure.Formats.html_escape (
#4 "bin/template.eml.html"
                                  param 
)));
(Buffer.add_string ___eml_buffer "!</h1>\n</body>\n</html>\n\n");
(Buffer.contents ___eml_buffer)
#8 "bin/template.eml.html"
let () =
  Dream.run
  @@ Dream.logger
  @@ Dream.router [

    Dream.get "/:word"
      (fun request ->
        Dream.param request "word"
        |> render
        |> Dream.html);

  ]
