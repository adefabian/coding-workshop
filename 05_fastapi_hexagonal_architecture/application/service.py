from typing import List, Optional
from domain.models import Todo
from domain.repositories import TodoRepository

class TodoService:
    def __init__(self, repository: TodoRepository):
        self.repository = repository

    def get_all_todos(self) -> List[Todo]:
        return self.repository.get_all()

    def get_todo_by_id(self, todo_id: int) -> Optional[Todo]:
        return self.repository.get_by_id(todo_id)

    def create_todo(self, todo: Todo) -> Todo:
        return self.repository.create(todo)

    def update_todo(self, todo: Todo) -> Optional[Todo]:
        return self.repository.update(todo)

    def delete_todo(self, todo_id: int) -> bool:
        return self.repository.delete(todo_id)