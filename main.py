import streamlit as st
from chat import GeminiBot

# Initialize the GeminiBot
bot = GeminiBot()

st.set_page_config(page_title="Gemini Q&A Chatbot")
st.title("🤖 Gemini Q&A Chatbot")

user_input = st.text_input("Enter your question:")

if st.button("Ask"):
    if user_input.strip():
        response = bot.ask(user_input)
        st.subheader("Response:")
        st.write(response)
    else:
        st.warning("Please enter a valid question.")
