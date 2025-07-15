# CEDT - Circular Economy Digital Twin
# Makefile for development and deployment automation

.PHONY: help install install-dev test test-cov lint format clean build deploy docker-build docker-run docs

# Default target
help:
	@echo "CEDT - Available Commands:"
	@echo "================================"
	@echo "🚀 Development:"
	@echo "  install        Install production dependencies"
	@echo "  install-dev    Install development dependencies"
	@echo "  setup          Complete development environment setup"
	@echo ""
	@echo "🧪 Testing:"
	@echo "  test           Run all tests"
	@echo "  test-cov       Run tests with coverage report"
	@echo "  test-unit      Run unit tests only"
	@echo "  test-integration Run integration tests only"
	@echo ""
	@echo "🔍 Code Quality:"
	@echo "  lint           Run linting (flake8, mypy)"
	@echo "  format         Format code (black, isort)"
	@echo "  format-check   Check code formatting without changes"
	@echo "  pre-commit     Run pre-commit hooks"
	@echo ""
	@echo "📦 Build & Deploy:"
	@echo "  build          Build distribution packages"
	@echo "  docker-build   Build Docker images"
	@echo "  docker-run     Run application in Docker"
	@echo "  deploy         Deploy to production"
	@echo ""
	@echo "📚 Documentation:"
	@echo "  docs           Generate documentation"
	@echo "  docs-serve     Serve documentation locally"
	@echo ""
	@echo "🧹 Maintenance:"
	@echo "  clean          Clean build artifacts"
	@echo "  clean-pyc      Clean Python cache files"
	@echo "  clean-build    Clean build directories"

# Installation
install:
	pip install -r requirements.txt
	pip install -e .

install-dev:
	pip install -r requirements.txt
	pip install -e ".[dev,docs,quantum,blockchain]"
	pre-commit install

setup: install-dev
	@echo "🔧 Setting up development environment..."
	@if [ ! -f .env ]; then cp .env.example .env; echo "📝 Created .env file"; fi
	@echo "✅ Development environment ready!"

# Testing
test:
	pytest -v

test-cov:
	pytest --cov=app --cov-report=html --cov-report=term-missing

test-unit:
	pytest tests/unit/ -v

test-integration:
	pytest tests/integration/ -v -m "not slow"

test-slow:
	pytest tests/integration/ -v -m "slow"

test-quantum:
	pytest tests/quantum/ -v -m "quantum"

test-blockchain:
	pytest tests/blockchain/ -v -m "blockchain"

# Code Quality
lint:
	flake8 app/ tests/
	mypy app/
	@echo "✅ Linting complete!"

format:
	black app/ tests/
	isort app/ tests/
	@echo "✅ Code formatting complete!"

format-check:
	black --check app/ tests/
	isort --check-only app/ tests/

pre-commit:
	pre-commit run --all-files

# Build & Package
build: clean
	python -m build

clean: clean-build clean-pyc
	rm -rf .coverage htmlcov/
	rm -rf .pytest_cache/
	rm -rf .mypy_cache/
	find . -name '*.egg-info' -exec rm -rf {} +

clean-pyc:
	find . -name '*.pyc' -exec rm -f {} +
	find . -name '*.pyo' -exec rm -f {} +
	find . -name '*~' -exec rm -f {} +
	find . -name '__pycache__' -exec rm -rf {} +

clean-build:
	rm -rf build/
	rm -rf dist/
	rm -rf .eggs/

# Docker
docker-build:
	docker build -t cedt:latest .
	docker build -t cedt:quantum -f Dockerfile.quantum .

docker-run:
	docker-compose up -d

docker-stop:
	docker-compose down

docker-logs:
	docker-compose logs -f

# Documentation
docs:
	cd docs && make html

docs-serve:
	cd docs && make html && python -m http.server 8000 -d _build/html

docs-clean:
	cd docs && make clean

# Development Server
dev-server:
	uvicorn app.main:app --host 0.0.0.0 --port 8000 --reload

dev-worker:
	python -m app.workers.main

dev-blockchain:
	ganache-cli --deterministic --accounts 10 --host 0.0.0.0 --port 8545

# Database
db-upgrade:
	alembic upgrade head

db-downgrade:
	alembic downgrade -1

db-migration:
	alembic revision --autogenerate -m "$(message)"

db-reset:
	alembic downgrade base
	alembic upgrade head

# Monitoring
monitor:
	docker-compose -f docker-compose.monitoring.yml up -d

stop-monitor:
	docker-compose -f docker-compose.monitoring.yml down

# Security
security-check:
	bandit -r app/
	safety check

# Performance
benchmark:
	python scripts/benchmark.py

load-test:
	locust -f tests/performance/locustfile.py

# Quantum Computing Setup
quantum-setup:
	@echo "🔬 Setting up quantum computing environment..."
	pip install ".[quantum]"
	python scripts/setup_quantum.py

# Blockchain Setup
blockchain-setup:
	@echo "⛓️ Setting up blockchain environment..."
	pip install ".[blockchain]"
	python scripts/setup_blockchain.py

# Data Pipeline
data-pipeline:
	python scripts/data_pipeline.py

simulate-iot:
	python scripts/simulate_iot_data.py

# Deployment
deploy-staging:
	@echo "🚀 Deploying to staging..."
	kubectl apply -f k8s/staging/

deploy-production:
	@echo "🚀 Deploying to production..."
	kubectl apply -f k8s/production/

deploy: deploy-production

# CI/CD
ci-install:
	pip install -r requirements.txt
	pip install -e ".[dev]"

ci-test: lint test-cov

ci-build: clean build

ci-deploy: ci-install ci-test ci-build deploy

# Version Management
version-patch:
	bumpversion patch

version-minor:
	bumpversion minor

version-major:
	bumpversion major

# Environment Variables
env-template:
	@echo "📝 Environment variables template:"
	@echo "=================================="
	@cat .env.example

check-env:
	@python scripts/check_environment.py

# Utilities
logs:
	tail -f logs/app.log

health-check:
	curl -f http://localhost:8000/health

api-docs:
	@echo "📖 API Documentation available at:"
	@echo "   Swagger UI: http://localhost:8000/docs"
	@echo "   ReDoc: http://localhost:8000/redoc"

# Development Tools
jupyter:
	jupyter notebook

ipython:
	ipython

shell:
	python -c "from app.main import app; import IPython; IPython.embed()"

# Git Hooks
install-hooks:
	pre-commit install
	pre-commit install --hook-type commit-msg

# Default Python version check
python-version:
	@python --version
	@echo "Required: Python 3.9+"