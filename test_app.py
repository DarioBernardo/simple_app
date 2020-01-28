import unittest
import json
from web_app import home


class TestHelloApp(unittest.TestCase):

    def test_web_main_method(self):
        self.assertEqual(json.loads(home().data), {"message": "OK"})


if __name__ == '__main__':
  unittest.main()
