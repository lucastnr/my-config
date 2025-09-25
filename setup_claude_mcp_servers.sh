bash <<'EOF'
echo "🔧  Installing Claude MCP servers (latest versions)…"

# Playwright — modern multi‑browser automation
claude mcp add playwright -s user \
  -- npx -y @playwright/mcp-server || true

# Fetch — simple HTTP GET/POST
claude mcp add fetch -s user \
  -- npx -y @kazuph/mcp-fetch || true

# Browser‑Tools — DevTools logs, screenshots, etc.
claude mcp add browser-tools -s user \
  -- npx -y @agentdeskai/browser-tools-mcp || true

# Atlassian — Jira, Confluence, etc.
claude mcp add atlassian -s user \
  -- npx -y mcp-remote https://mcp.atlassian.com/v1/sse || true

echo "--------------------------------------------------"
echo "✅  MCP registration finished."
echo ""
echo "🔴  To enable Browser‑Tools, run this in a *second* terminal and leave it open:"
echo "    npx -y @agentdeskai/browser-tools-server"
echo "--------------------------------------------------"
claude mcp list
EOF
