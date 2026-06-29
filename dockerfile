# Base image with Foundry + Anvil
FROM ghcr.io/foundry-rs/foundry:latest

# Run as root to expose port
USER root

# Expose Anvil RPC port
EXPOSE 8546

# Set entrypoint to start Anvil
ENTRYPOINT ["anvil", "--fork-url", "https://base-mainnet.g.alchemy.com/v2/hHwVfu3SnmP4km7mMQ8_N", "--chain-id", "8453", "--host", "0.0.0.0", "--port", "8547", "--auto-impersonate"]


# 1. Swap 1000 BNB for USDT on the local Anvil fork
# cast send 0x10ED43C718714eb63d5aA57B78B54704E256024E "swapExactETHForTokens(uint256,address[],address,uint256)" 1000 "[0xbb4CdB9CBd36B01bD1cBaEBF2De08d9173bc095c,0x55d398326f99059fF775485246999027B3197955]" 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266 9999999999 --value 1000ether --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 --rpc-url https://anvilbsc-production.up.railway.app

# 2. Swap 1000 BNB for USDC on the local Anvil fork
# cast send 0x10ED43C718714eb63d5aA57B78B54704E256024E "swapExactETHForTokens(uint256,address[],address,uint256)" 1000 "[0xbb4CdB9CBd36B01bD1cBaEBF2De08d9173bc095c,0x8AC76a51cc950d9822D68b83fE1Ad97B32Cd580d]" 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266 9999999999 --value 1000ether --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 --rpc-url https://anvilbsc-production.up.railway.app