# ZenSync

A blockchain-based meditative tool for syncing digital assets and tracking mindfulness achievements.

## Features
- Create and manage meditation sessions
- Track mindfulness achievements as NFTs 
- Earn ZenTokens for consistent practice
- Share achievements with the community

## Getting Started
1. Deploy the contracts
2. Initialize your meditation profile
3. Start tracking sessions

## Contracts
- `zen-token.clar`: Core token for rewards
- `zen-nft.clar`: NFT contract for achievements
- `zen-session.clar`: Session tracking logic with duration validation (5-180 minutes)

## Testing
Run tests with: `clarinet test`

## Session Guidelines
- Minimum session length: 5 minutes
- Maximum session length: 180 minutes (3 hours)
- Earn 1 token per minute of meditation
