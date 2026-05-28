# n8n Workflow Builder

This project enables Claude to build high-quality n8n workflows using the n8n MCP server and n8n skills.

## Environment

- **n8n Instance**: n8n Cloud
- **MCP Server**: n8n-mcp (czlonkowski/n8n-mcp)
- **Skills**: n8n-skills (czlonkowski/n8n-skills)

## Available MCP Tools

### Documentation & Discovery

| Tool | Purpose |
|------|---------|
| `tools_documentation` | Access MCP tool documentation |
| `search_nodes` | Full-text search across 1,084 nodes (filter by core/community/verified) |
| `get_node` | Retrieve node details (minimal/standard/full modes) |
| `validate_node` | Validate node configuration |
| `validate_workflow` | Complete workflow validation including AI Agent checks |
| `search_templates` | Search 2,709 templates (by keyword/nodes/task/metadata) |
| `get_template` | Retrieve complete workflow JSON from templates |

### Workflow Management

| Tool | Purpose |
|------|---------|
| `n8n_create_workflow` | Create new workflows |
| `n8n_get_workflow` | Retrieve existing workflows |
| `n8n_update_workflow` | Full workflow update |
| `n8n_update_partial_workflow` | Partial workflow update |
| `n8n_delete_workflow` | Delete workflows |
| `n8n_list_workflows` | List all workflows |
| `n8n_validate_workflow` | Validate before deployment |

### Execution Management

| Tool | Purpose |
|------|---------|
| `n8n_test_workflow` | Test/trigger workflows |
| `n8n_list_executions` | List execution history |
| `n8n_get_execution` | Get execution details |
| `n8n_delete_execution` | Delete execution records |

## Available Skills

These skills activate automatically based on context:

1. **n8n Expression Syntax** - Correct `{{}}` patterns and variable access
2. **n8n MCP Tools Expert** - Effective use of MCP server tools
3. **n8n Workflow Patterns** - 5 proven architectural approaches
4. **n8n Validation Expert** - Interpret and resolve validation errors
5. **n8n Node Configuration** - Operation-aware node setup
6. **n8n Code JavaScript** - JavaScript in Code nodes
7. **n8n Code Python** - Python with limitations awareness

## Workflow Building Process

### 1. Understand Requirements
- Clarify the workflow's purpose and triggers
- Identify required integrations and data flow
- Determine error handling needs

### 2. Search Templates First
```
search_templates → Find similar workflows
get_template → Get workflow JSON as starting point
```

### 3. Research Nodes
```
search_nodes → Find appropriate nodes
get_node → Get configuration details
```

### 4. Build Incrementally
- Start with trigger node
- Add nodes one at a time
- Validate after each addition

### 5. Validate Before Deployment
```
validate_workflow → Check for errors
Fix any issues → Re-validate
```

### 6. Test
```
n8n_test_workflow → Run with test data
Verify outputs → Adjust as needed
```

## Safety Rules

- **NEVER edit production workflows directly** - Always create copies
- **NEVER deploy without validation** - Use `validate_workflow` first
- **NEVER skip testing** - Always test with realistic data
- **NEVER use default values blindly** - Configure parameters explicitly

## Quality Standards

### Before Creating
- Search templates for existing patterns
- Understand all required node configurations
- Plan error handling strategy

### During Building
- Validate nodes as you add them
- Use proper n8n expression syntax
- Follow established workflow patterns

### Before Deployment
- Run `validate_workflow` with strict profile
- Test with representative data
- Verify error handling works

## Workflow Patterns

Use these 5 proven patterns as architectural foundations:

1. **Webhook Processing** - External triggers → Process → Respond
2. **HTTP API Integration** - Fetch data → Transform → Store/Send
3. **Database Operations** - Query → Process → Update
4. **AI Workflows** - Input → AI processing → Output handling
5. **Scheduled Tasks** - Cron trigger → Batch process → Report

## Expression Syntax Reference

```javascript
// Access input data
{{ $json.fieldName }}

// Access previous node output
{{ $('NodeName').item.json.field }}

// Access all items from a node
{{ $('NodeName').all() }}

// Conditional logic
{{ $json.status === 'active' ? 'yes' : 'no' }}

// Date/time
{{ $now.toISO() }}
{{ $today.format('yyyy-MM-dd') }}
```

## Common Mistakes to Avoid

- Using expressions inside Code nodes (use variables instead)
- Forgetting `$json.body` for webhook data access
- Not handling empty/null values
- Skipping validation before deployment
- Editing production workflows directly
