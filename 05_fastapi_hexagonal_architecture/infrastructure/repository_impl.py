from typing import List, Optional
from sqlalchemy.orm import Session
from domain.models import Todo
from domain.repositories import TodoRepository
from .database import TodoModel

class SqlAlchemyTodoRepository(TodoRepository):
    def __init__(self, db_session: Session):
        self.db = db_session

    def get_all(self) -> List[Todo]:
        todos = self.db.query(TodoModel).all()
        return [Todo(id=todo.id, title=todo.title, description=todo.description, completed=todo.completed) for todo in todos]

    def get_by_id(self, todo_id: int) -> Optional[Todo]:
        todo = self.db.query(TodoModel).filter(TodoModel.id == todo_id).first()
        if todo:
            return Todo(id=todo.id, title=todo.title, description=todo.description, completed=todo.completed)
        return None

    def create(self, todo: Todo) -> Todo:
        db_todo = TodoModel(title=todo.title, description=todo.description, completed=todo.completed)
        self.db.add(db_todo)
        self.db.commit()
        self.db.refresh(db_todo)
        return Todo(id=db_todo.id, title=db_todo.title, description=db_todo.description, completed=db_todo.completed)

    def update(self, todo: Todo) -> Optional[Todo]:
        db_todo = self.db.query(TodoModel).filter(TodoModel.id == todo.id).first()
        if not db_todo:
            return None
        db_todo.title = todo.title
        db_todo.description = todo.description
        db_todo.completed = todo.completed
        self.db.commit()
        self.db.refresh(db_todo)
        return Todo(id=db_todo.id, title=db_todo.title, description=db_todo.description, completed=db_todo.completed)

    def delete(self, todo_id: int) -> bool:
        db_todo = self.db.query(TodoModel).filter(TodoModel.id == todo_id).first()
        if not db_todo:
            return False
        self.db.delete(db_todo)
        self.db.commit()
        return True