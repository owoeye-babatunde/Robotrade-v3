# Robotrade Trading System

Robotrade is an AI-enhanced, modular trading system designed for automated trading, analysis, and prediction in financial markets. It leverages advanced data pipelines, machine learning, and real-time data processing to support research, backtesting, and live trading.

## Features

- Modular microservices architecture (Rust & Python)
- Real-time and historical data ingestion
- Technical indicators and news sentiment analysis
- Prediction APIs and model training pipelines
- Kubernetes-native deployment and Docker support

## Getting Started

1. Clone the repository
2. Review the `self-note/` folder for setup guides
3. Use the provided Dockerfiles and Kubernetes manifests for deployment

## Folder Structure

- `services/` - Microservices for data, prediction, trading, etc.
- `deployments/` - Kubernetes manifests for dev/prod
- `docker/` - Dockerfiles for each service
- `scripts/` - Utility scripts for build and deployment
- `self-note/` - Developer notes and setup instructions

## Requirements

- Docker & Kubernetes
- Python 3.10+ and/or Rust (for relevant services)

## License

MIT License
