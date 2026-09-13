// Define a local service object
define Service::"CustomerDB" {
    type: "PostgreSQL",
    endpoint: "localhost:5432"
}

// Define an AI model that interacts with tools via the Model Context Protocol (MCP)
define Agent::"Analyst" {
    model: "Claude-3.5-Sonnet",
    protocol: "McpRegistry"
}

// Chain execution using the Universal Form
understand CustomerDB * coordinate Analyst * run Analyst
