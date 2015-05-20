import unittest
from etlegacy_stats import ETLegacyParser


class TestETParse(unittest.TestCase):

    def test_parse(self):
        p = ETLegacyParser('1182590.csv')
        p.process()


if __name__ == '__main__':
    unittest.main()
