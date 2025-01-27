from abc import ABC, abstractmethod
from typing import List, Optional
from .models import Todo

class TodoRepository(ABC):
    @abstractmethod
    def get_all(self) -> List[Todo]:
        pass

    @abstractmethod
    def get_by_id(self, todo_id: int) -> Optional[Todo]:
        pass

    @abstractmethod
    def create(self, todo: Todo) -> Todo:
        pass

    @abstractmethod
    def update(self, todo: Todo) -> Optional[Todo]:
        pass

    @abstractmethod
    def delete(self, todo_id: int) -> bool:
        pass