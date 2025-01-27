import sys
import os

# Get the absolute path of the project root directory
project_root = os.path.dirname(os.path.abspath(__file__))

# Add the project root to Python path if it's not already there
if project_root not in sys.path:
    sys.path.append(project_root)