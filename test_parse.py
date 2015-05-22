import unittest
from etlegacy_stats import ETLegacyParser, get_config, connect_db


class TestETParse(unittest.TestCase):

    def test_parse(self):
        cparser = get_config('config.ini')
        engine, meta = connect_db(cparser)
        p = ETLegacyParser('1182590.csv')
        p.process(engine, meta)


if __name__ == '__main__':
    unittest.main()
