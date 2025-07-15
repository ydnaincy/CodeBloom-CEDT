#!/usr/bin/env python3
"""
CEDT - Circular Economy Digital Twin
Setup configuration for package installation
"""

from setuptools import setup, find_packages
import os

# Read the contents of README file
this_directory = os.path.abspath(os.path.dirname(__file__))
with open(os.path.join(this_directory, 'README.md'), encoding='utf-8') as f:
    long_description = f.read()

# Read requirements from requirements.txt
with open('requirements.txt') as f:
    requirements = [line.strip() for line in f if line.strip() and not line.startswith('#')]

setup(
    name="cedt",
    version="0.1.0",
    author="CEDT Team",
    author_email="team@cedt.ai",
    description="Circular Economy Digital Twin with Predictive Refill Intelligence",
    long_description=long_description,
    long_description_content_type="text/markdown",
    url="https://github.com/your-org/cedt",
    packages=find_packages(where="app"),
    package_dir={"": "app"},
    classifiers=[
        "Development Status :: 3 - Alpha",
        "Intended Audience :: Developers",
        "Intended Audience :: Science/Research",
        "License :: OSI Approved :: MIT License",
        "Operating System :: OS Independent",
        "Programming Language :: Python :: 3",
        "Programming Language :: Python :: 3.9",
        "Programming Language :: Python :: 3.10",
        "Programming Language :: Python :: 3.11",
        "Topic :: Scientific/Engineering :: Artificial Intelligence",
        "Topic :: Software Development :: Libraries :: Python Modules",
        "Topic :: System :: Distributed Computing",
    ],
    python_requires=">=3.9",
    install_requires=requirements,
    extras_require={
        "dev": [
            "pytest>=7.4.3",
            "pytest-asyncio>=0.21.1",
            "pytest-cov>=4.1.0",
            "black>=23.11.0",
            "flake8>=6.1.0",
            "isort>=5.12.0",
            "pre-commit>=3.5.0",
        ],
        "docs": [
            "sphinx>=7.2.0",
            "sphinx-rtd-theme>=1.3.0",
            "sphinxcontrib-asyncio>=0.3.0",
        ],
        "quantum": [
            "dwave-ocean-sdk>=6.9.0",
            "qiskit>=0.45.0",
            "cirq>=1.2.0",
        ],
        "blockchain": [
            "web3>=6.12.0",
            "eth-account>=0.10.0",
            "brownie-eth>=1.19.0",
        ],
    },
    entry_points={
        "console_scripts": [
            "cedt-server=cedt.api.main:main",
            "cedt-worker=cedt.workers.main:main",
            "cedt-setup=cedt.setup:setup_environment",
        ],
    },
    include_package_data=True,
    package_data={
        "cedt": [
            "config/*.yaml",
            "data/*.json",
            "static/*",
            "templates/*",
        ],
    },
    project_urls={
        "Bug Reports": "https://github.com/your-org/cedt/issues",
        "Source": "https://github.com/your-org/cedt",
        "Documentation": "https://cedt.readthedocs.io/",
    },
    keywords="circular-economy digital-twin sustainability ai blockchain quantum machine-learning",
    zip_safe=False,
)