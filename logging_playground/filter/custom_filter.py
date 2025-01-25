import logging.config
logger = logging.getLogger(__name__)

class MyCustomFilter:
    """
    A custom filter class that filters out numbers below a given threshold.
    """

    def __init__(self, threshold: int=0):
        """
        Initialize the filter with a threshold value.
        Any number below this threshold will be filtered out.
        """
        self.threshold: int = threshold

    def filter_numbers(self, numbers: list[int]) -> list[int]:
        """
        Filters the input list of integers, returning only those
        that are >= the threshold.

        :param numbers: List of integers to be filtered
        :return: A new list containing numbers >= self.threshold
        """
        logger.info(f"Starting to remove numbers smaller than: {self.threshold}")
        logger.debug(f"Original List: {numbers}")
        return [num for num in numbers if num >= self.threshold]