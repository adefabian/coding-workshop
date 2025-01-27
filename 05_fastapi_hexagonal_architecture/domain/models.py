from dataclasses import dataclass
from typing import Optional

@dataclass
class Todo:
    id: Optional[int]
    title: str
    description: Optional[str] = None
    completed: bool = False