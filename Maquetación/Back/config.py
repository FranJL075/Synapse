# SETTINGS/Session
class Config:
    SECRET_KEY = 'mynewsecretKey'


class configuracionDesarrolo(Config):
    # CONFIGURACION DEL MYSQL
    DEBUG=True
   
    

config={
    'development':configuracionDesarrolo
}