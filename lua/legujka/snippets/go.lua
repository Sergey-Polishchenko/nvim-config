local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt

return {
  -- 1. Basic errors
  s("err-check", fmt([[
  if err != nil {{
    return {1}
  }}]], { i(0) })),

  s("err-wrap", fmt([[
  if err != nil {{
    return fmt.Errorf("{1}: %w", err)
  }}]], { i(1, "context") })),

  s("err-log", fmt([[
  if err != nil {{
    log.Printf("{1}: %v", err)
    {2}
  }}]], { i(1, "message"), i(0) })),

  s("err-inline", fmt([[
  if {1}, err := {2}; err != nil {{
    {3}
  }}]], { i(1), i(2), i(0) })),

  s("comma-ok", fmt([[
  {1}, ok := {2}
  if !ok {{
    {3}
  }}]], { i(1, "v"), i(2), i(0) })),

  -- 2. Panic/Recover
  s("panic-recover", fmt([[
  defer func() {{
    if r := recover(); r != nil {{
      {1}
    }}
  }}()]], { i(0) })),

  -- 3. HTTP Handlers
  s("http-get", fmt([[
  http.HandleFunc("{}", func(w http.ResponseWriter, r *http.Request) {{
    if r.Method != http.MethodGet {{
      http.Error(w, "Method not allowed", http.StatusMethodNotAllowed)
      return
    }}
    {}
  }})]], { i(1, "/endpoint"), i(0) })),

  s("http-json-response", fmt([[
  w.Header().Set("Content-Type", "application/json")
  if err := json.NewEncoder(w).Encode({}); err != nil {{
    http.Error(w, err.Error(), http.StatusInternalServerError)
  }}]], { i(1) })),

  -- 4. Testing
  s("test-func", fmt([[
  func Test{}(t *testing.T) {{
    tests := []struct {{
      name string
      want {}
    }}{{
      // Test cases
    }}
    
    for _, tt := range tests {{
      t.Run(
        tt.name,
        func(t *testing.T) {{
          got := {}()
          if got != tt.want {{
            t.Errorf("{}() = %v, want %v", got, tt.want)
          }}
        }},
      )
    }}
  }}]], {
    i(1, "FunctionName"),
    i(2, "returnType"),
    i(3, "functionCall"),
    i(4, "functionName")
  })),

  s("test-http", fmt([[
  func Test{}(t *testing.T) {{
    req := httptest.NewRequest("GET", "{}", nil)
    w := httptest.NewRecorder()
    
    {}(w, req)
    
    resp := w.Result()
    if resp.StatusCode != http.StatusOK {{
      t.Fatalf("unexpected status: %v", resp.Status)
    }}
  }}]], {
    i(1, "HandlerName"),
    i(2, "http://example.com"),
    i(3, "handler")
  })),

  -- 4. Goroutines and channels
  s("waitgroup", fmt([[
  var wg sync.WaitGroup
  wg.Add(1)
  go func() {{
    defer wg.Done()
    {}
  }}()
  wg.Wait()]], { i(0) })),

  s("chan-buffered", fmt([[
  ch := make(chan {}, {})
  defer close(ch)]], {
    i(1, "int"),
    i(2, "10")
  })),

  -- 5. JSON
  s("json-marshal", fmt([[
  b, err := json.Marshal({})
  if err != nil {{
    return nil, fmt.Errorf("marshal failed: %w", err)
  }}]], { i(1) })),

  -- 6. Конфигурация
  s("env-var", fmt([[
  {} := os.Getenv("{}")
  if {} == "" {{
    return fmt.Errorf("{} environment variable not set")
  }}]], {
    i(1, "var"),
    i(2, "ENV_NAME"),
    f(function(args) return args[1][1] end, {1}),
    f(function(args) return args[2][1] end, {2})
  })),

  -- 7. Utilities
  s("defer-close", fmt([[
  defer func() {{
    if err := {}.Close(); err != nil {{
      log.Printf("close error: %v", err)
    }}
  }}()]], { i(1) })),

  -- 8. Data Bases
  s("pg-connect", fmt([[
  connStr := "postgres://{}:{}@{}:5432/{}?sslmode=disable"
  db, err := sql.Open("postgres", connStr)
  if err != nil {{
    return nil, fmt.Errorf("db open failed: %w", err)
  }}]], {
    i(1, "user"),
    i(2, "password"),
    i(3, "localhost"),
    i(4, "dbname")
  })),

  -- 9. Context
  s("ctx-timeout", fmt([[
  ctx, cancel := context.WithTimeout(context.Background(), {}*time.Second)
  defer cancel()]], { i(1, "5") })),

  -- 10. Interfaces
  s("error-impl", fmt([[
  type {}Error struct {{
    Msg string
  }}

  func (e *{}Error) Error() string {{
    return e.Msg
  }}]], {
    i(1, "Custom"),
    f(function(args) return args[1][1] end, {1})
  })),
}
