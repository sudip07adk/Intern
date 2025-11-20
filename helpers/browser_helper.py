"""
Browser helper module for managing Selenium WebDriver initialization and configuration.
Provides centralized browser setup and teardown functionality.
"""

from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.chrome.service import Service


class BrowserHelper:
    """Helper class for browser initialization and management."""

    @staticmethod
    def get_chrome_driver(headless=False, implicit_wait=10):
        """
        Initialize and return a Chrome WebDriver instance.

        Args:
            headless (bool): Run browser in headless mode if True
            implicit_wait (int): Implicit wait timeout in seconds

        Returns:
            WebDriver: Configured Chrome WebDriver instance
        """
        chrome_options = Options()

        # Add headless mode if specified
        if headless:
            chrome_options.add_argument("--headless")

        # Common Chrome options for stability
        chrome_options.add_argument("--no-sandbox")
        chrome_options.add_argument("--disable-dev-shm-usage")
        chrome_options.add_argument("--disable-gpu")
        chrome_options.add_argument("--window-size=1920,1080")
        chrome_options.add_argument("--start-maximized")
        chrome_options.add_argument("--disable-blink-features=AutomationControlled")

        # Initialize WebDriver with WebDriver Manager
        service = Service(ChromeDriverManager().install())
        driver = webdriver.Chrome(service=service, options=chrome_options)

        # Set implicit wait
        driver.implicitly_wait(implicit_wait)

        return driver

    @staticmethod
    def close_browser(driver):
        """
        Close the browser and quit the WebDriver.

        Args:
            driver (WebDriver): WebDriver instance to close
        """
        if driver:
            driver.quit()