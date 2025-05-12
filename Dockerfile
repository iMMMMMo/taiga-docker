FROM taigaio/taiga-back:6.7.0

EXPOSE 8000

CMD ["gunicorn", "-c", "/taiga-back/gunicorn.conf.py", "taiga.wsgi"]
