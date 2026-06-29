# Base image with Foundry + Anvil
FROM ghcr.io/foundry-rs/foundry:latest

# Run as root to expose port
USER root

# Expose Anvil RPC port (Railway will map this)
EXPOSE 8545

# Set entrypoint to start Anvil binding to 0.0.0.0 so it can receive external traffic
ENTRYPOINT ["anvil", "--fork-url", "https://base-mainnet.g.alchemy.com/v2/hHwVfu3SnmP4km7mMQ8_N", "--chain-id", "8453", "--host", "0.0.0.0", "--port", "8545", "--auto-impersonate"]
