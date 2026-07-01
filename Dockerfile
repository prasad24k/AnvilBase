# Base image with Foundry + Anvil
FROM ghcr.io/foundry-rs/foundry:latest

# Run as root to expose port
USER root

# Expose Anvil RPC port (Railway will map this)
EXPOSE 8545

# How often to re-pin the fork to the latest Base block (seconds)
ENV RESET_INTERVAL_SECONDS=300

# Start Anvil in the background, then periodically call anvil_reset
# to re-fork from the current Base tip, so pool reserves don't drift
# stale the longer this container stays up.
ENTRYPOINT ["sh", "-c", "\
  RPC_URL='https://base-mainnet.g.alchemy.com/v2/hHwVfu3SnmP4km7mMQ8_N'; \
  anvil --fork-url \"$RPC_URL\" --chain-id 8453 --host 0.0.0.0 --port 8545 --auto-impersonate & \
  ANVIL_PID=$!; \
  sleep 3; \
  ( while true; do \
      sleep \"$RESET_INTERVAL_SECONDS\"; \
      echo \"[refresh] re-pinning fork to latest Base block...\"; \
      cast rpc anvil_reset \"[{\\\"forking\\\":{\\\"jsonRpcUrl\\\":\\\"$RPC_URL\\\"}}]\" --rpc-url http://127.0.0.1:8545 \
        && echo \"[refresh] done\" \
        || echo \"[refresh] failed, will retry next cycle\"; \
    done ) & \
  wait $ANVIL_PID \
"]
