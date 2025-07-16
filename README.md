# BitVault Protocol

![Stacks](https://img.shields.io/badge/Stacks-Bitcoin%20Layer%202-orange.svg)
![Clarity](https://img.shields.io/badge/Language-Clarity-brightgreen.svg)

> Revolutionary Bitcoin-native lending ecosystem that transforms dormant STX holdings into productive financial instruments through intelligent collateralization and algorithmic risk assessment.

## 🎯 Overview

BitVault represents the next evolution in Bitcoin DeFi, offering institutional-grade lending services that unlock liquidity from STX assets without forcing users to sell. Through advanced collateral management, dynamic interest calculations, and autonomous liquidation protocols, BitVault creates a seamless bridge between Bitcoin's security and modern financial primitives.

The protocol empowers users to leverage their STX holdings while maintaining exposure to Bitcoin's long-term value proposition through sophisticated risk management and real-time position monitoring.

## 🏗️ System Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                    BitVault Protocol                        │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  ┌─────────────────┐    ┌─────────────────┐                │
│  │   User Layer    │    │   Admin Layer   │                │
│  │                 │    │                 │                │
│  │ • Deposit       │    │ • Risk Params   │                │
│  │ • Borrow        │    │ • Liquidation   │                │
│  │ • Repay         │    │ • Protocol Fee  │                │
│  │ • Withdraw      │    │                 │                │
│  └─────────────────┘    └─────────────────┘                │
│            │                      │                        │
│            └──────────────────────┴─────────────┐          │
│                                                  │          │
│  ┌─────────────────────────────────────────────┴─────────┐ │
│  │              Core Protocol Layer                      │ │
│  │                                                       │ │
│  │ • Collateral Management                               │ │
│  │ • Risk Assessment Engine                              │ │
│  │ • Liquidation Engine                                  │ │
│  │ • Position Tracking                                   │ │
│  └───────────────────────────────────────────────────────┘ │
│                                                             │
├─────────────────────────────────────────────────────────────┤
│                    Stacks Blockchain                        │
└─────────────────────────────────────────────────────────────┘
```

## 🔧 Contract Architecture

### Core Components

#### 1. **Risk Management System**

- **Collateral Ratio Enforcement**: Maintains minimum 150% collateralization
- **Liquidation Threshold**: Triggers at 130% ratio to protect protocol
- **Dynamic Risk Parameters**: Configurable by protocol administrators

#### 2. **Position Management**

- **User Positions**: Tracks individual collateral and debt balances
- **Global Metrics**: Monitors total deposits and borrows across protocol
- **Atomic Updates**: Ensures consistency during state changes

#### 3. **Liquidation Engine**

- **Health Monitoring**: Continuous position health assessment
- **Automated Liquidation**: Permissionless liquidation of unhealthy positions
- **Capital Efficiency**: Optimized liquidation process to minimize losses

### Data Structures

```clarity
;; User Position Tracking
user-positions: {
  total-collateral: uint,
  total-borrowed: uint,
  loan-count: uint
}

;; Loan Records (Extended Structure)
loans: {
  borrower: principal,
  collateral-amount: uint,
  borrowed-amount: uint,
  interest-rate: uint,
  start-height: uint,
  last-interest-update: uint,
  active: bool
}
```

## 🌊 Data Flow

### 1. Collateral Deposit Flow

```
User STX → Protocol Contract → User Position Update → Global Metrics Update
```

### 2. Borrowing Flow

```
Borrow Request → Collateral Validation → Risk Assessment → STX Transfer → Position Update
```

### 3. Repayment Flow

```
STX Payment → Debt Reduction → Position Update → Collateral Ratio Improvement
```

### 4. Liquidation Flow

```
Health Check → Threshold Breach → Liquidation Trigger → Asset Transfer → Position Cleanup
```

## 🚀 Key Features

### For Users

- **🔒 Collateralized Lending**: Secure STX-backed borrowing
- **💰 Capital Efficiency**: Leverage STX holdings without selling
- **📊 Real-time Monitoring**: Transparent position tracking
- **⚡ Instant Liquidity**: Quick access to borrowed funds

### For Protocol

- **🛡️ Risk Management**: Multi-layered protection mechanisms
- **🔄 Automated Operations**: Self-executing liquidations and interest calculations
- **📈 Scalable Architecture**: Designed for institutional-grade volume
- **💎 Bitcoin Security**: Built on Stacks for Bitcoin-level security

## 📋 Risk Parameters

| Parameter | Default Value | Range | Description |
|-----------|---------------|-------|-------------|
| Minimum Collateral Ratio | 150% | 110% - 500% | Required overcollateralization |
| Liquidation Threshold | 130% | 110% - 150% | Liquidation trigger point |
| Protocol Fee | 1% | 0% - 10% | Revenue collection rate |

## 🔧 Installation & Development

### Prerequisites

- [Clarinet](https://docs.hiro.so/clarinet) - Stacks development tool
- [Node.js](https://nodejs.org/) v16+ - For testing framework
- [Git](https://git-scm.com/) - Version control

### Setup

```bash
# Clone the repository
git clone https://github.com/raymondbassey/BitVault.git
cd BitVault

# Install dependencies
npm install

# Check contract syntax
clarinet check

# Run test suite
npm test

# Run tests with coverage
npm run test:report

# Watch mode for development
npm run test:watch
```

## 🧪 Testing

The protocol includes comprehensive test coverage:

```bash
# Run all tests
npm test

# Run with coverage report
npm run test:report

# Development mode with file watching
npm run test:watch
```

## 📚 API Reference

### Public Functions

#### Core Operations

- `(deposit)` - Deposit STX as collateral
- `(borrow (amount uint))` - Borrow STX against collateral
- `(repay (amount uint))` - Repay borrowed STX
- `(withdraw (amount uint))` - Withdraw collateral

#### Liquidation

- `(liquidate (user principal))` - Liquidate undercollateralized position

#### Administrative

- `(set-minimum-collateral-ratio (new-ratio uint))` - Update collateral requirements
- `(set-liquidation-threshold (new-threshold uint))` - Update liquidation parameters
- `(set-protocol-fee (new-fee uint))` - Update protocol fee structure

### Read-Only Functions

- `(get-user-position (user principal))` - Retrieve user position data
- `(get-protocol-stats)` - Get comprehensive protocol statistics

## ⚠️ Security Considerations

- **Collateral Requirements**: Maintain adequate collateralization to avoid liquidation
- **Market Volatility**: STX price fluctuations affect position health
- **Liquidation Risk**: Positions below threshold face immediate liquidation
- **Smart Contract Risk**: Protocol is subject to smart contract vulnerabilities

## 🤝 Contributing

We welcome contributions to the BitVault protocol! Please read our [Contributing Guidelines](CONTRIBUTING.md) before submitting PRs.

### Development Workflow

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests for new functionality
5. Ensure all tests pass
6. Submit a pull request

## 📄 License

This project is licensed under the ISC License - see the [LICENSE](LICENSE) file for details.

## 🔗 Links

- [Stacks Documentation](https://docs.stacks.co/)
- [Clarity Language Reference](https://docs.stacks.co/clarity/)
- [Clarinet Documentation](https://docs.hiro.so/clarinet/)
