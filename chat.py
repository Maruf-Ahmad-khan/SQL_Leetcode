import os
import logging
from dotenv import load_dotenv
import google.generativeai as genai

# Load environment variables from .env
load_dotenv()

# Configure logging
if not os.path.exists('logs'):
    os.makedirs('logs')

logging.basicConfig(
    filename='logs/app.log',
    filemode='a',
    format='%(asctime)s - %(levelname)s - %(message)s',
    level=logging.INFO
)

# Gemini Bot Class
class GeminiBot:
    def __init__(self):
        self.api_key = os.getenv("GOOGLE_API_KEY")
        if not self.api_key:
            logging.error("GOOGLE_API_KEY not found in environment variables.")
            raise ValueError("GOOGLE_API_KEY not set.")
        genai.configure(api_key=self.api_key)
        self.model = genai.GenerativeModel('gemini-2.0-flash')  # Use 'gemini-2.0-pro' for a more advanced model
        logging.info("GeminiBot initialized successfully.")

    def ask(self, question: str) -> str:
        try:
            logging.info(f"Question asked: {question}")
            response = self.model.generate_content(question)
            logging.info("Received response successfully.")
            return response.text
        except Exception as e:
            logging.error(f"Error during API call: {e}")
            return "Sorry, something went wrong while processing your request."
