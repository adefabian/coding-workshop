import logging


class CustomHandler(logging.Handler):
    """
    A custom logging handler that prefixes log messages with a custom string.
    """
    def __init__(self, prefix: str = "CUSTOM"):
        super().__init__()
        self.prefix = prefix

    def emit(self, record: logging.LogRecord):
        """
        Process a log record and output it with a custom prefix.
        """
        try:
            message = self.format(record)
            # Prefix the message
            prefixed_message = f"{self.prefix}: {message}"
            # For demonstration, we'll print it to the console
            print(prefixed_message)
        except Exception:
            self.handleError(record)