import uvicorn
from fastapi import FastAPI
from adapters.routes import router
from infrastructure.database import Base, engine
import logging.config

app = FastAPI(title="Hexagonal Architecture Todo App")

# Initialize logging
logger = logging.getLogger(__name__)

# Initialize the database
Base.metadata.create_all(bind=engine)
logger.info("Database tables created.")

# Include API routes
app.include_router(router)
logger.info("API routes included.")

if __name__ == "__main__":
    uvicorn.run("main:app", host="0.0.0.0", port=443, log_level="info")