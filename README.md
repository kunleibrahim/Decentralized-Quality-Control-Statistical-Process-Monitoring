# Decentralized Quality Control Statistical Process Monitoring

A comprehensive blockchain-based quality control system built on Stacks using Clarity smart contracts. This system provides decentralized management of quality processes, statistical analysis, and improvement coordination.

## Overview

This system consists of five interconnected smart contracts that work together to provide a complete quality control solution:

1. **Quality Engineer Verification** - Manages certification and verification of quality engineers
2. **Process Monitoring** - Tracks and monitors quality control processes
3. **Statistical Analysis** - Performs statistical calculations and analysis
4. **Control Chart Management** - Manages quality control charts and trend analysis
5. **Improvement Coordination** - Coordinates quality improvement initiatives

## Features

### Quality Engineer Verification
- Engineer certification management
- Multiple certification levels (Junior, Senior)
- Expiration date tracking
- Specialization areas
- Active status management

### Process Monitoring
- Process definition and configuration
- Real-time measurement recording
- Tolerance limit management
- Measurement frequency tracking
- Process activation/deactivation

### Statistical Analysis
- Basic statistical calculations (mean, variance, standard deviation)
- Control limit calculations
- Process capability indices
- Statistical report generation
- Control limit validation

### Control Chart Management
- Multiple chart types (X-bar, R-chart, p-chart)
- Real-time point plotting
- Out-of-control detection
- Violation rule checking
- Trend analysis

### Improvement Coordination
- Improvement initiative management
- Corrective action tracking
- Priority and status management
- Effectiveness rating
- Metrics tracking and improvement measurement

## Smart Contract Architecture

\`\`\`
┌─────────────────────────────────────────────────────────────┐
│                    Quality Control System                    │
├─────────────────────────────────────────────────────────────┤
│  Quality Engineer    │  Process         │  Statistical      │
│  Verification        │  Monitoring      │  Analysis         │
│  - Certifications    │  - Processes     │  - Statistics     │
│  - Verification      │  - Measurements  │  - Control Limits │
│  - Expiration        │  - Tolerances    │  - Calculations   │
├─────────────────────────────────────────────────────────────┤
│  Control Chart       │  Improvement Coordination            │
│  Management          │  - Initiatives   │  - Actions        │
│  - Charts            │  - Priorities    │  - Metrics        │
│  - Points            │  - Status        │  - Effectiveness  │
│  - Rules             │  - Assignments   │  - Tracking       │
└─────────────────────────────────────────────────────────────┘
\`\`\`

## Getting Started

### Prerequisites
- Stacks blockchain node
- Clarity development environment
- Clarinet CLI tool

### Deployment

1. Clone the repository
2. Deploy contracts in the following order:
   \`\`\`bash
   clarinet deploy quality-engineer-verification
   clarinet deploy process-monitoring
   clarinet deploy statistical-analysis
   clarinet deploy control-chart
   clarinet deploy improvement-coordination
   \`\`\`

### Usage Examples

#### 1. Verify a Quality Engineer
\`\`\`clarity
(contract-call? .quality-engineer-verification verify-engineer
'SP1HTBVD3JG9C05J7HBJTHGR0GGW7KX975CN0QKK1
u2
"Statistical Process Control")
\`\`\`

#### 2. Create a Quality Process
\`\`\`clarity
(contract-call? .process-monitoring create-process
"PROD-001"
"Widget diameter measurement"
u100
u105
u95
u3600)
\`\`\`

#### 3. Record a Measurement
\`\`\`clarity
(contract-call? .process-monitoring record-measurement
"PROD-001"
u102
(some "Normal operation"))
\`\`\`

#### 4. Create Control Chart
\`\`\`clarity
(contract-call? .control-chart create-control-chart
"CHART-001"
"PROD-001"
"X-bar"
u25
u5)
\`\`\`

#### 5. Create Improvement Initiative
\`\`\`clarity
(contract-call? .improvement-coordination create-improvement-initiative
"INIT-001"
"Reduce process variation"
"Implement new measurement system"
"PROD-001"
u2
'SP1HTBVD3JG9C05J7HBJTHGR0GGW7KX975CN0QKK1
u1640995200)
\`\`\`

## Contract Functions

### Quality Engineer Verification
- \`verify-engineer\` - Verify a quality engineer
- \`revoke-verification\` - Revoke engineer verification
- \`is-verified-engineer\` - Check if engineer is verified
- \`get-engineer-info\` - Get engineer information

### Process Monitoring
- \`create-process\` - Create a new quality process
- \`record-measurement\` - Record a process measurement
- \`deactivate-process\` - Deactivate a process
- \`get-process-info\` - Get process information
- \`is-measurement-in-control\` - Check if measurement is within limits

### Statistical Analysis
- \`calculate-basic-statistics\` - Calculate process statistics
- \`set-control-limits\` - Set statistical control limits
- \`get-statistical-report\` - Get statistical analysis report
- \`is-point-in-control\` - Check if point is within control limits

### Control Chart Management
- \`create-control-chart\` - Create a new control chart
- \`add-chart-point\` - Add a point to the chart
- \`deactivate-chart\` - Deactivate a chart
- \`get-chart-info\` - Get chart information

### Improvement Coordination
- \`create-improvement-initiative\` - Create improvement initiative
- \`add-corrective-action\` - Add corrective action
- \`update-initiative-status\` - Update initiative status
- \`complete-corrective-action\` - Complete corrective action
- \`update-improvement-metrics\` - Update improvement metrics

## Security Features

- **Access Control**: Only verified quality engineers can perform critical operations
- **Data Integrity**: All data is stored immutably on the blockchain
- **Audit Trail**: Complete history of all quality activities
- **Decentralization**: No single point of failure
- **Transparency**: All quality data is publicly verifiable

## Testing

Run the test suite using:
\`\`\`bash
npm test
\`\`\`

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests for new functionality
5. Submit a pull request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

For support and questions, please open an issue in the GitHub repository.
