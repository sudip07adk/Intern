"""
Utility functions for test support.
Includes common operations like waits, data generation, and helper functions.
"""

import time
from datetime import datetime


class TestUtils:
    """Utility class with common test helper methods."""

    @staticmethod
    def get_timestamp():
        """
        Get current timestamp for unique identification.

        Returns:
            str: Current timestamp in YYYYMMDD_HHMMSS format
        """
        return datetime.now().strftime("%Y%m%d_%H%M%S")

    @staticmethod
    def generate_dummy_email():
        """
        Generate a unique dummy email for testing.

        Returns:
            str: Unique email address
        """
        timestamp = datetime.now().strftime("%Y%m%d%H%M%S")
        return f"testuser_{timestamp}@test.com"

    @staticmethod
    def sleep(seconds):
        """
        Pause execution for specified seconds.

        Args:
            seconds (float): Number of seconds to sleep
        """
        time.sleep(seconds)

    @staticmethod
    def generate_order_data():
        """
        Generate dummy order data for testing.

        Returns:
            dict: Dictionary with dummy order information
        """
        return {
            "name": "Test User",
            "country": "United States",
            "city": "New York",
            "card": "4111111111111111",
            "month": "12",
            "year": "2025"
        }