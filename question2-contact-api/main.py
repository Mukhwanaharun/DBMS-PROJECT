from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
from typing import List
import mysql.connector

app = FastAPI()

class Contact(BaseModel):
    id: int = None
    name: str
    email: str
    phone: str

db = mysql.connector.connect(
    host="localhost",
    user="youruser",
    password="yourpassword",
    database="ContactDB"
)
cursor = db.cursor(dictionary=True)

@app.get("/contacts", response_model=List[Contact])
def get_contacts():
    cursor.execute("SELECT * FROM contacts")
    return cursor.fetchall()

@app.post("/contacts")
def add_contact(contact: Contact):
    cursor.execute("INSERT INTO contacts (name, email, phone) VALUES (%s, %s, %s)",
                   (contact.name, contact.email, contact.phone))
    db.commit()
    return {"message": "Contact added"}
