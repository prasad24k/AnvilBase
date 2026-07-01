# Base image with Foundry + Anvil
FROM ghcr.io/foundry-rs/foundry:latest

# Run as root to expose port
USER root

# Expose Anvil RPC port (Railway will map this)
EXPOSE 8545

# Start Anvil with Base fork (no periodic reset)
ENTRYPOINT ["sh", "-c", "\
  RPC_URL='https://base-mainnet.g.alchemy.com/v2/hHwVfu3SnmP4km7mMQ8_N'; \
  echo 'Starting Base mainnet fork...'; \
  exec anvil \
    --fork-url \"$RPC_URL\" \
    --chain-id 8453 \
    --host 0.0.0.0 \
    --port 8545 \
    --auto-impersonate \
"]
