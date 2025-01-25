logger_config = {
    "version": 1,
    "formatters": {
       "standard": {
        "format": "%(asctime)s [%(levelname)s] %(name)s: %(message)s",
        "datefmt": "%H:%M:%S"
        },
        "green_formatter": {
            "class": "custom_logging.formatter.GreenLogFormatter",
        }
    },
    "handlers": {
        "console": {
            "class": "logging.StreamHandler"
        },
        "custom": {
            "class": "custom_logging.handler.CustomHandler",
            "formatter": "green_formatter",
        }
    },
    "loggers": {
        "filter": {
            "level": "DEBUG",
            "handlers": ["custom"],
            "propagate": False
        },
        "root": {
            "level": "INFO",
            "handlers": ["console"]
        }
    }
}