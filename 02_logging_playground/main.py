import logging.config

from config import logger_config
from filter.custom_filter import MyCustomFilter

logging.config.dictConfig(logger_config)
logger: logging.Logger = logging.getLogger(__name__)

def main() -> None:
    # Example list of integers
    input_numbers: list[int] = [10, -2, 5, 0, -8, 12, 3]

    # Create an instance of our custom filter with a threshold of 0
    my_filter: MyCustomFilter = MyCustomFilter(threshold=0)

    # Filter the numbers
    filtered_numbers: list[int] = my_filter.filter_numbers(input_numbers)

    # Log the results instead of printing
    logger.debug(f"Original list: {input_numbers}")
    logger.info(f"Filtered list (threshold = 0): {filtered_numbers}")



if __name__ == '__main__':
    main()