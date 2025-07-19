import streamlit as st
from auth.login import login, require_admin
from streamlit.components.v1 import html

st.set_page_config(page_title="GBT Unified App", layout="wide")

login()
require_admin()

st.title("🔗 GBT Network Bridge Dashboard")

st.markdown("## 🦊 Connect Wallet")
wallet = html(open("frontend/wallet_connect.html").read(), height=300)

st.markdown("---")
st.markdown("## 🌉 Bridge")
col1, col2 = st.columns(2)

with col1:
    addr_in = st.text_input("🔁 Deposit to (Wallet Address)")
    amt_in = st.number_input("💰 Amount to Deposit", min_value=0.0)
    if st.button("Deposit"):
        st.success(f"✅ {amt_in} GBT deposited to {addr_in}")

with col2:
    addr_out = st.text_input("🔁 Withdraw to (Wallet Address)")
    amt_out = st.number_input("💸 Amount to Withdraw", min_value=0.0)
    if st.button("Withdraw"):
        st.success(f"✅ {amt_out} GBT withdrawn to {addr_out}")

st.markdown("---")
st.markdown("## 🔁 Relayer: Auto Burn on L1 → Mint on L2")
st.info("Backend service listens for Layer1 burn and triggers Layer2 mint.")
