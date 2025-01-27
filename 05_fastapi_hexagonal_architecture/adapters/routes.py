from fastapi import APIRouter, Depends, HTTPException, status
from typing import List
from sqlalchemy.orm import Session

from domain.models import Todo
from domain.repositories import TodoRepository
from infrastructure.database import SessionLocal
from infrastructure.repository_impl import SqlAlchemyTodoRepository
from application.service import TodoService

router = APIRouter()

# Dependency to get DB session
def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

# Dependency to get repository
def get_repository(db: Session = Depends(get_db)) -> TodoRepository:
    return SqlAlchemyTodoRepository(db)

# Dependency to get TodoService
def get_todo_service(repository: TodoRepository = Depends(get_repository)) -> TodoService:
    return TodoService(repository)

@router.post("/todos/", response_model=Todo, status_code=status.HTTP_201_CREATED)
def create_todo(todo: Todo, service: TodoService = Depends(get_todo_service)):
    created_todo = service.create_todo(todo)
    return created_todo

@router.get("/todos/", response_model=List[Todo])
def read_todos(service: TodoService = Depends(get_todo_service)):
    todos = service.get_all_todos()
    return todos

@router.get("/todos/{todo_id}", response_model=Todo)
def read_todo(todo_id: int, service: TodoService = Depends(get_todo_service)):
    todo = service.get_todo_by_id(todo_id)
    if not todo:
        raise HTTPException(status_code=404, detail="Todo not found")
    return todo

@router.put("/todos/{todo_id}", response_model=Todo)
def update_todo(todo_id: int, todo: Todo, service: TodoService = Depends(get_todo_service)):
    if todo_id != todo.id:
        raise HTTPException(status_code=400, detail="Todo ID mismatch")
    updated_todo = service.update_todo(todo)
    if not updated_todo:
        raise HTTPException(status_code=404, detail="Todo not found")
    return updated_todo

@router.delete("/todos/{todo_id}", status_code=status.HTTP_204_NO_CONTENT)
def delete_todo(todo_id: int, service: TodoService = Depends(get_todo_service)):
    success = service.delete_todo(todo_id)
    if not success:
        raise HTTPException(status_code=404, detail="Todo not found")
    return