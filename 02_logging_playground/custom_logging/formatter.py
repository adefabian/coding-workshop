import logging

class GreenLogFormatter(logging.Formatter):
    """
    Custom formatter that colors all log messages green.
    """
    GREEN = "\033[92m"  # Bright green (use "\033[32m" for normal green)
    RESET = "\033[0m"

    def format(self, record):
        # First get the original formatted message
        original_msg = super().format(record)
        # Return the message wrapped in green color escape codes
        return f"{self.GREEN}{original_msg}{self.RESET}"