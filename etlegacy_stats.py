import csv
from sqlalchemy import create_engine, Table, MetaData


class ETLegacyParser(object):

    def __init__(self, fp):
        self.fp = fp

    def process(self):
        # TODO: This needs to be read from config
        user = "root"
        pwd = "root"
        host = "127.0.0.1"
        port = 3306
        dbname = "Wolf"
        engine = create_engine("mysql://{}:{}@{}:{}/{}".format(user, pwd, host, port, dbname))
        meta = MetaData()
        player_stats = Table('Stats', meta, autoload=True, autoload_with=engine)
        match = Table('Match', meta, autoload=True, autoload_with=engine)
        if match is None:
            print "FUCKED"
            return
        with open(self.fp, 'r') as f:
            reader = csv.reader(f, delimiter=',', quotechar='`')
            i = iter(reader)
            with engine.connect() as connection:
                sql = self.create_match(i, match)
                result = connection.execute(sql)
                match_id = result.lastrowid
            for line in i:
                if len(line) > 3:
                    break
                killer, victim, weapon = line
                print killer, victim, weapon
            for line in i:
                a = PlayerStats(line)
                with engine.connect() as connection:
                    connection.execute(a.to_sql(match_id, player_stats))

    def create_match(self, i, tbl):
        mapname, created_on = i.next()
        return tbl.insert().values({'mapname': mapname,
                                    'created_on': created_on})


class PlayerStats(object):

    MAPPER = ['client_uuid',
              'client_name',
              'player_num',
              'w0_atts',
              'w0_deaths',
              'w0_hs',
              'w0_hits',
              'w0_kills',
              'w1_atts',
              'w1_deaths',
              'w1_hs',
              'w1_hits',
              'w1_kills',
              'w2_atts',
              'w2_deaths',
              'w2_hs',
              'w2_hits',
              'w2_kills',
              'w3_atts',
              'w3_deaths',
              'w3_hs',
              'w3_hits',
              'w3_kills',
              'w4_atts',
              'w4_deaths',
              'w4_hs',
              'w4_hits',
              'w4_kills',
              'w5_atts',
              'w5_deaths',
              'w5_hs',
              'w5_hits',
              'w5_kills',
              'w6_atts',
              'w6_deaths',
              'w6_hs',
              'w6_hits',
              'w6_kills',
              'w7_atts',
              'w7_deaths',
              'w7_hs',
              'w7_hits',
              'w7_kills',
              'w8_atts',
              'w8_deaths',
              'w8_hs',
              'w8_hits',
              'w8_kills',
              'w9_atts',
              'w9_deaths',
              'w9_hs',
              'w9_hits',
              'w9_kills',
              'w10_atts',
              'w10_deaths',
              'w10_hs',
              'w10_hits',
              'w10_kills',
              'w11_atts',
              'w11_deaths',
              'w11_hs',
              'w11_hits',
              'w11_kills',
              'w12_atts',
              'w12_deaths',
              'w12_hs',
              'w12_hits',
              'w12_kills',
              'w13_atts',
              'w13_deaths',
              'w13_hs',
              'w13_hits',
              'w13_kills',
              'w14_atts',
              'w14_deaths',
              'w14_hs',
              'w14_hits',
              'w14_kills',
              'w15_atts',
              'w15_deaths',
              'w15_hs',
              'w15_hits',
              'w15_kills',
              'w16_atts',
              'w16_deaths',
              'w16_hs',
              'w16_hits',
              'w16_kills',
              'w17_atts',
              'w17_deaths',
              'w17_hs',
              'w17_hits',
              'w17_kills',
              'w18_atts',
              'w18_deaths',
              'w18_hs',
              'w18_hits',
              'w18_kills',
              'w19_atts',
              'w19_deaths',
              'w19_hs',
              'w19_hits',
              'w19_kills',
              'w20_atts',
              'w20_deaths',
              'w20_hs',
              'w20_hits',
              'w20_kills',
              'w21_atts',
              'w21_deaths',
              'w21_hs',
              'w21_hits',
              'w21_kills',
              'w22_atts',
              'w22_deaths',
              'w22_hs',
              'w22_hits',
              'w22_kills',
              'w23_atts',
              'w23_deaths',
              'w23_hs',
              'w23_hits',
              'w23_kills',
              'w24_atts',
              'w24_deaths',
              'w24_hs',
              'w24_hits',
              'w24_kills',
              'w25_atts',
              'w25_deaths',
              'w25_hs',
              'w25_hits',
              'w25_kills',
              'battlesense',
              'engineering',
              'medic',
              'fieldops',
              'lightweapons',
              'heavyweapons',
              'covertops']

    def __init__(self, line):
        self.line = line

    @property
    def guid(self):
        return self.line[0]

    @property
    def name(self):
        return self.line[1]

    @property
    def player_number(self):
        return self.line[2]

    def to_sql(self, match_id, tbl):
        values = dict(zip(self.MAPPER, self.line))
        values['match_id'] = match_id
        return tbl.insert().values(**values)
