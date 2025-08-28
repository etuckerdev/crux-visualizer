# Crux-Core Manifold Reasoner v2 - Package Overview

## 📦 Complete Developer Package

This release package contains everything needed to deploy and use the Crux-Core Manifold Reasoner v2 system.

### Package Contents

```
release-package/
├── bin/
│   └── manifold_reasoner_v2          # Main executable binary
├── config/
│   ├── .env.example                  # Environment configuration template
│   └── docker-compose.yml            # Service orchestration
├── docs/
│   ├── README.md                     # Main documentation
│   ├── API_REFERENCE.md              # Complete API documentation
│   ├── TROUBLESHOOTING.md           # Troubleshooting guide
│   ├── CHANGELOG.md                  # Version history and changes
│   └── advanced_examples.md          # Advanced usage examples
├── examples/
│   ├── basic_queries.txt             # Basic usage examples
│   └── advanced_patterns.txt         # Advanced query patterns
└── scripts/
    ├── setup_services.sh             # Automated service setup
    ├── run_tests.sh                  # Comprehensive testing
    ├── benchmark.sh                  # Performance benchmarking
    └── health_check.sh               # Service health monitoring
```

## 🚀 Quick Start

### Prerequisites
- Linux x86_64 system
- Docker and Docker Compose
- 8GB RAM minimum, 16GB recommended
- NVIDIA GPU with CUDA 11.0+ (optional, for GPU acceleration)

### One-Command Setup

```bash
# 1. Extract the package
cd /path/to/release-package

# 2. Copy configuration
cp config/.env.example config/.env

# 3. Start all services
docker-compose up -d

# 4. Wait for services to be ready (may take 2-3 minutes)
./scripts/setup_services.sh

# 5. Test the system
echo "What is artificial intelligence?" | ./bin/manifold_reasoner_v2
```

## 📋 Detailed Setup Instructions

### Step 1: System Requirements Check

```bash
# Check available memory
free -h

# Check Docker installation
docker --version
docker-compose --version

# Check GPU (optional)
nvidia-smi
```

### Step 2: Configuration

```bash
# Navigate to package directory
cd release-package

# Copy environment template
cp config/.env.example config/.env

# Edit configuration if needed
nano config/.env
```

### Step 3: Service Deployment

```bash
# Start services in background
docker-compose up -d

# Monitor startup logs
docker-compose logs -f

# Wait for services to be healthy
./scripts/setup_services.sh
```

### Step 4: Verification

```bash
# Run health check
./scripts/health_check.sh

# Test basic functionality
./scripts/run_tests.sh

# Run performance benchmark
./scripts/benchmark.sh
```

## 🔧 Configuration Options

### Environment Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `CRUX_OPENAI_BASE_URL` | LLM service URL | `http://127.0.0.1:8083` |
| `CRUX_CHAT_MODEL` | Model name | `mistral-7b-instruct` |
| `CRUX_MAX_WORKERS` | Concurrent workers | `128` |
| `CRUX_GPU_MEMORY_THRESHOLD` | GPU memory limit | `0.2` |

### Service Ports

| Service | Port | Description |
|---------|------|-------------|
| LLM Server | 8083 | Language model synthesis |
| Manifold Interpreter | 8085 | Geometric analysis |

## 📊 Usage Examples

### Command Line

```bash
# Basic query
echo "Explain quantum computing" | ./bin/manifold_reasoner_v2

# With options
echo "What is AI?" | ./bin/manifold_reasoner_v2 --enable-learning --timeout 120

# Save full output
echo "Complex query" | ./bin/manifold_reasoner_v2 --dump-full-output result.json
```

### Programmatic Usage

```python
# Python client example
import subprocess
import json

result = subprocess.run(
    ['./bin/manifold_reasoner_v2'],
    input="What is machine learning?",
    text=True,
    capture_output=True
)

response = json.loads(result.stdout)
print(response['final_answer'])
```

## 🔍 Monitoring & Maintenance

### Health Monitoring

```bash
# Continuous health check
watch -n 30 ./scripts/health_check.sh

# View service logs
docker-compose logs -f llm-server
docker-compose logs -f manifold-interpreter
```

### Performance Monitoring

```bash
# Real-time performance
./scripts/benchmark.sh

# Analyze logs
tail -f routing_data.csv

# System resources
top -p $(pgrep manifold_reasoner)
```

### Log Analysis

```bash
# Recent activity
tail -20 routing_data.csv

# Performance summary
awk -F',' '{sum+=$2; count++} END {print "Avg:", sum/count, "ms"}' routing_data.csv

# Error analysis
grep -i "error" routing_data.csv | tail -10
```

## 🛠️ Troubleshooting

### Common Issues

1. **Connection Refused**
   ```bash
   # Check services
   docker-compose ps

   # Restart services
   docker-compose restart
   ```

2. **Out of Memory**
   ```bash
   # Reduce workers
   export CRUX_MAX_WORKERS=64

   # Check memory
   free -h
   ```

3. **Timeout Errors**
   ```bash
   # Increase timeout
   ./bin/manifold_reasoner_v2 --timeout 120

   # Skip services for speed
   ./bin/manifold_reasoner_v2 --skip-interpretation
   ```

### Advanced Debugging

```bash
# Enable debug logging
export RUST_LOG=debug

# Test individual services
curl http://localhost:8083/health
curl http://localhost:8085/health

# Isolate issues
./bin/manifold_reasoner_v2 --skip-synthesis --skip-interpretation
```

## 📈 Performance Optimization

### Memory Optimization

```bash
# Configure for low memory
export CRUX_MAX_WORKERS=32
export CRUX_GPU_MEMORY_THRESHOLD=0.5

# Monitor usage
nvidia-smi -l 5
```

### Speed Optimization

```bash
# Fast mode
./bin/manifold_reasoner_v2 --skip-interpretation

# Parallel processing
# (System automatically optimizes for available resources)
```

### Quality Optimization

```bash
# Maximum quality
./bin/manifold_reasoner_v2 --compute-embeddings --enable-learning

# Balanced mode (default)
./bin/manifold_reasoner_v2
```

## 🔄 Updates & Maintenance

### Service Updates

```bash
# Update Docker images
docker-compose pull

# Restart with new images
docker-compose up -d

# Verify updates
./scripts/health_check.sh
```

### Backup & Recovery

```bash
# Backup configuration
cp config/.env config/.env.backup

# Backup logs
cp routing_data.csv routing_data.csv.backup

# Restore from backup
cp config/.env.backup config/.env
```

## 📚 Documentation Resources

### Local Documentation
- `docs/README.md` - Main usage guide
- `docs/API_REFERENCE.md` - Complete API documentation
- `docs/TROUBLESHOOTING.md` - Problem resolution guide
- `docs/CHANGELOG.md` - Version history

### Online Resources
- [GitHub Repository](https://github.com/your-org/crux-core)
- [Documentation Wiki](https://github.com/your-org/crux-core/wiki)
- [Community Discussions](https://github.com/your-org/crux-core/discussions)

## 🤝 Support & Community

### Getting Help

1. **Check Documentation**: Review local docs and examples
2. **Run Diagnostics**: Use `./scripts/health_check.sh`
3. **Search Issues**: Check existing GitHub issues
4. **Community Support**: Join discussions and forums

### Reporting Issues

When reporting problems, include:

```bash
# System information
./scripts/health_check.sh

# Service logs
docker-compose logs --tail=50

# Configuration
cat config/.env

# Test case
echo "problematic query" | ./bin/manifold_reasoner_v2 --dump-full-output debug.json
```

## 📋 Checklist for Deployment

### Pre-Deployment
- [ ] System meets minimum requirements
- [ ] Docker and Docker Compose installed
- [ ] Package extracted to target directory
- [ ] Configuration file created from template

### Deployment
- [ ] Services started with `docker-compose up -d`
- [ ] Services verified healthy with `./scripts/setup_services.sh`
- [ ] Basic functionality tested
- [ ] Performance benchmarked

### Post-Deployment
- [ ] Monitoring configured
- [ ] Backup procedures established
- [ ] Documentation accessible to team
- [ ] Team trained on usage and troubleshooting

## 🎯 Success Metrics

### Performance Targets
- Query response time: < 30 seconds for complex queries
- Service uptime: > 99.5%
- Memory usage: < 8GB under normal load
- CPU utilization: < 80% during peak usage

### Quality Metrics
- Answer accuracy: > 90% for factual queries
- Geometric reasoning quality: > 85% consistency
- Error rate: < 5% of total queries
- User satisfaction: > 4.5/5 rating

---

## 📞 Contact Information

**Project**: Crux-Core Manifold Reasoner v2
**Version**: 2.0.0
**Release Date**: January 2024
**Maintainer**: AI Research Team

For questions, issues, or contributions:
- **GitHub**: https://github.com/your-org/crux-core
- **Email**: team@crux-core.ai
- **Documentation**: https://docs.crux-core.ai

---

*Thank you for using Crux-Core Manifold Reasoner v2! We hope this system enhances your geometric reasoning and AI capabilities.*
