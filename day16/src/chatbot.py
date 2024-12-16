import json
import random

def load_data(file_path):
    try:
        with open(file_path, 'r') as file:
            return json.load(file)
    except FileNotFoundError:
        print(f"Error: {file_path} not found.")
        return []

def suggest_recipes():
    recipes = load_data("data/recipes.json")
    if recipes:
        print("Here are some holiday recipes you might enjoy:")
        for recipe in recipes:
            print(f"- {recipe['name']} (Ingredients: {', '.join(recipe['ingredients'])})")

def suggest_gifts():
    gifts = load_data("data/gifts.json")
    if gifts:
        print("Here are some holiday gift ideas:")
        for gift in gifts:
            print(f"- {gift['category']}: {', '.join(gift['suggestions'])}")

def chatbot():
    print("Welcome to the Holiday Chatbot!")
    print("I can help with holiday recipes or gift suggestions.")
    while True:
        user_input = input("\nWhat would you like help with? (recipes/gifts/exit): ").lower()
        if user_input == "recipes":
            suggest_recipes()
        elif user_input == "gifts":
            suggest_gifts()
        elif user_input == "exit":
            print("Happy holidays! Goodbye!")
            break
        else:
            print("I'm sorry, I didn't understand that. Please type 'recipes', 'gifts', or 'exit'.")

if __name__ == "__main__":
    chatbot()
