FROM python:3-slim

ENV DRYRUN 'True'
ENV DEBUG 'True'
ENV DEBUG_LEVEL 'INFO'
ENV SLEEP_DURATION '3600'
ENV LOGFILE 'log.log'

ENV USER_MAPPING ''
ENV LIBRARY_MAPPING ''

ENV PLEX_BASEURL ''
ENV PLEX_TOKEN ''
ENV PLEX_USERNAME ''
ENV PLEX_PASSWORD ''
ENV PLEX_SERVERNAME ''

ENV JELLYFIN_BASEURL ''
ENV JELLYFIN_TOKEN ''

ENV BLACKLIST_LIBRARY ''
ENV WHITELIST_LIBRARY ''
ENV BLACKLIST_LIBRARY_TYPE  '' 
ENV WHITELIST_LIBRARY_TYPE  ''
ENV BLACKLIST_USERS  ''
ENV WHITELIST_USERS  ''

WORKDIR /app

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        build-essential && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY ./requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["python", "-u", "main.py"]
