# Contributing to CEDT

Thank you for your interest in contributing to CEDT (Circular Economy Digital Twin)! This document provides guidelines and instructions for contributing to our project.

## 🌟 Overview

CEDT is an innovative system that combines IoT, AI, blockchain, and quantum computing to create a sustainable circular economy platform. We welcome contributions from developers, researchers, and sustainability enthusiasts.

## 🚀 Getting Started

### Prerequisites

- Python 3.9 or higher
- Node.js 16+ (for frontend components)
- Docker and Docker Compose
- Git

### Development Setup

1. **Fork and Clone the Repository**
   ```bash
   git clone https://github.com/your-username/cedt.git
   cd cedt
   ```

2. **Set up Python Environment**
   ```bash
   python -m venv venv
   source venv/bin/activate  # On Windows: venv\Scripts\activate
   pip install -r requirements.txt
   pip install -e .
   ```

3. **Install Development Dependencies**
   ```bash
   pip install -r requirements.txt[dev]
   pre-commit install
   ```

4. **Environment Configuration**
   ```bash
   cp .env.example .env
   # Edit .env with your configuration
   ```

5. **Run Tests**
   ```bash
   pytest
   ```

## 📋 Development Workflow

### Branch Naming Convention

- `feature/description` - New features
- `bugfix/description` - Bug fixes
- `hotfix/description` - Critical fixes
- `docs/description` - Documentation updates
- `refactor/description` - Code refactoring

### Commit Message Format

We follow the [Conventional Commits](https://www.conventionalcommits.org/) specification:

```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

**Types:**
- `feat` - New feature
- `fix` - Bug fix
- `docs` - Documentation changes
- `style` - Code style changes
- `refactor` - Code refactoring
- `test` - Adding or updating tests
- `chore` - Maintenance tasks

**Examples:**
```
feat(predictive-refill): implement SARIMAX forecasting model
fix(blockchain): resolve web3 connection timeout issues
docs(api): update endpoint documentation
```

## 🏗️ Project Structure

```
cedt/
├── app/                    # Main application code
│   ├── api/               # FastAPI endpoints
│   ├── core/              # Core business logic
│   ├── models/            # Data models
│   ├── services/          # Service layer
│   ├── workers/           # Background workers
│   └── utils/             # Utility functions
├── docs/                  # Documentation
├── tests/                 # Test files
├── scripts/               # Deployment scripts
├── config/                # Configuration files
└── data/                  # Sample data
```

## 🧪 Testing Guidelines

### Running Tests

```bash
# Run all tests
pytest

# Run with coverage
pytest --cov=app --cov-report=html

# Run specific test file
pytest tests/test_predictive_refill.py

# Run with verbose output
pytest -v
```

### Writing Tests

- Write tests for all new features
- Follow the AAA pattern (Arrange, Act, Assert)
- Use descriptive test names
- Mock external dependencies
- Include integration tests for critical paths

Example test structure:
```python
def test_predictive_refill_forecasting():
    # Arrange
    mock_iot_data = create_mock_iot_data()
    
    # Act
    result = predictive_refill_service.forecast(mock_iot_data)
    
    # Assert
    assert result.confidence > 0.8
    assert result.predicted_runout_date is not None
```

## 📚 Code Style Guidelines

### Python

- Follow PEP 8 standards
- Use type hints for all functions
- Maximum line length: 88 characters
- Use meaningful variable names
- Add docstrings for all public functions

```python
def predict_refill_date(
    consumption_data: List[ConsumptionRecord],
    product_id: str,
    confidence_threshold: float = 0.8
) -> PredictionResult:
    """
    Predict when a product will need refilling based on consumption patterns.
    
    Args:
        consumption_data: Historical consumption records
        product_id: Unique identifier for the product
        confidence_threshold: Minimum confidence level for predictions
        
    Returns:
        PredictionResult containing forecast and confidence metrics
    """
```

### Code Formatting

We use automated formatting tools:
- **Black** for code formatting
- **isort** for import sorting
- **flake8** for linting

Run before committing:
```bash
black app/
isort app/
flake8 app/
```

## 🎯 Contribution Areas

### High Priority Areas

1. **Predictive Models**
   - Improve SARIMAX forecasting accuracy
   - Add alternative forecasting methods
   - Implement ensemble models

2. **Blockchain Integration**
   - Zero-knowledge proof implementations
   - Smart contract optimizations
   - Cross-chain compatibility

3. **Quantum Computing**
   - QUBO formulation improvements
   - Quantum-classical hybrid algorithms
   - Performance benchmarking

4. **IoT Integration**
   - New sensor support
   - Edge computing capabilities
   - Real-time data processing

### Documentation Needs

- API documentation
- Architecture diagrams
- Tutorial content
- Performance benchmarks

## 🔍 Code Review Process

1. **Create Pull Request**
   - Use the provided PR template
   - Include clear description of changes
   - Link related issues
   - Add screenshots for UI changes

2. **Review Checklist**
   - Code follows style guidelines
   - Tests are included and passing
   - Documentation is updated
   - No breaking changes (or properly documented)
   - Security considerations addressed

3. **Approval Process**
   - At least one maintainer approval required
   - All CI checks must pass
   - Address review feedback promptly

## 🚨 Security Guidelines

- Never commit sensitive data (API keys, passwords)
- Use environment variables for configuration
- Validate all inputs
- Follow OWASP security practices
- Report security vulnerabilities privately

## 📊 Performance Considerations

- Profile code for performance bottlenecks
- Use async/await for I/O operations
- Implement caching where appropriate
- Monitor memory usage
- Document performance implications

## 🐛 Bug Reports

When reporting bugs, please include:
- Clear description of the issue
- Steps to reproduce
- Expected vs actual behavior
- Environment details
- Relevant logs or error messages

## 💡 Feature Requests

For new features:
- Describe the use case
- Explain the business value
- Provide examples or mockups
- Consider implementation complexity
- Check if it aligns with project goals

## 🌐 Community Guidelines

- Be respectful and inclusive
- Help others learn and grow
- Provide constructive feedback
- Follow the Code of Conduct
- Participate in discussions

## 📞 Getting Help

- **GitHub Issues**: Bug reports and feature requests
- **Discussions**: General questions and ideas
- **Email**: team@cedt.ai for direct contact
- **Documentation**: Check the wiki first

## 🏆 Recognition

Contributors will be recognized:
- In the project README
- In release notes
- With GitHub contributor badges
- In academic publications (with consent)

## 📜 License

By contributing to CEDT, you agree that your contributions will be licensed under the MIT License.

---

Thank you for contributing to CEDT! Together, we're building a more sustainable future through innovative technology. 🌱