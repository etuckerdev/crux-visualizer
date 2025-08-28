#!/bin/bash
# run_chat_demo.sh - Quick start script for Manifold Reasoner v2 Chat Demo

set -e

echo "=================================================="
echo "🚀 Building Manifold Reasoner v2 Chat Demo..."
echo "=================================================="
echo ""

# Check if we're in the right directory
if [ ! -f "Cargo.toml" ] || [ ! -f "src/main.rs" ]; then
    echo "❌ Error: Please run this script from the manifold-chat-demo directory"
    exit 1
fi

# Check if Rust is installed
if ! command -v cargo &> /dev/null; then
    echo "❌ Error: Rust is not installed. Please install Rust first:"
    echo "   curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh"
    exit 1
fi

# Check if the manifold reasoner binary exists
if [ ! -f "../release-package/bin/manifold_reasoner_v2" ]; then
    echo "❌ Error: manifold_reasoner_v2 binary not found in bin/ directory"
    echo "   Please ensure the manifold reasoner binary is available"
    exit 1
fi

# Make the binary executable
chmod +x bin/manifold_reasoner_v2

echo "✅ Rust installation verified"
echo "✅ Manifold reasoner binary found"
echo ""

# Build the chat demo
echo "🔨 Building chat demo..."
cargo build --release

if [ $? -ne 0 ]; then
    echo "❌ Error: Build failed"
    exit 1
fi

echo "✅ Chat demo built successfully"
echo ""

# Check if services are running (optional)
echo "🔍 Checking for required services..."
if curl -s http://localhost:8083/health > /dev/null 2>&1; then
    echo "✅ LLM service running on port 8083"
else
    echo "⚠️  Warning: LLM service not detected on port 8083"
    echo "   Some features may not work properly"
fi

if curl -s http://localhost:8085/health > /dev/null 2>&1; then
    echo "✅ Manifold interpreter running on port 8085"
else
    echo "⚠️  Warning: Manifold interpreter not detected on port 8085"
    echo "   Some features may not work properly"
fi
echo ""

echo "🌟 Starting interactive demo..."
echo "==================================="
echo ""
echo "Features enabled:"
echo "  ✅ Multi-path reasoning"
echo "  ✅ Real-time learning"
echo "  ✅ Semantic validation"
echo "  ✅ Cross-domain synthesis"
echo ""
echo "Available commands:"
echo "  help, h      - Show help"
echo "  stats, s     - Show session statistics"
echo "  visualize, v - Show manifold state"
echo "  paths        - Show reasoning paths"
echo "  learn, l     - Demonstrate learning"
echo "  reset, r     - Reset session"
echo "  benchmark, b - Run benchmark"
echo "  quit         - Exit demo"
echo ""
echo "Starting chat demo..."
echo ""

# Run the chat demo
./target/release/manifold-chat-demo