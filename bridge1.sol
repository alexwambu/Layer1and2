from web3 import Web3

L1_RPC = "http://localhost:8545"
L2_RPC = "http://GBTNetwork:8545"

w3_l1 = Web3(Web3.HTTPProvider(L1_RPC))
w3_l2 = Web3(Web3.HTTPProvider(L2_RPC))

def get_balance(address, token_contract):
    return token_contract.functions.balanceOf(address).call()

