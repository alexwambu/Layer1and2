import time
from web3_client import w3_l1, w3_l2
import json

bridge_l1 = w3_l1.eth.contract(address="0xBridgeL1", abi=json.load(open("bridge_abi/BridgeL1.json")))
bridge_l2 = w3_l2.eth.contract(address="0xBridgeL2", abi=json.load(open("bridge_abi/BridgeL2.json")))
admin_key = "YOUR_PRIVATE_KEY"

def relayer():
    while True:
        events = bridge_l1.events.Burn.createFilter(fromBlock='latest').get_all_entries()
        for e in events:
            user = e['args']['user']
            amount = e['args']['amount']
            tx = bridge_l2.functions.mint(user, amount).buildTransaction({
                'from': w3_l2.eth.accounts[0],
                'nonce': w3_l2.eth.getTransactionCount(w3_l2.eth.accounts[0])
            })
            signed = w3_l2.eth.account.sign_transaction(tx, admin_key)
            w3_l2.eth.sendRawTransaction(signed.rawTransaction)
        time.sleep(10)
