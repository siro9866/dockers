ARG ELK_VERSION

# https://github.com/elastic/elasticsearch-docker
FROM docker.elastic.co/elasticsearch/elasticsearch:${ELK_VERSION}

# Add your elasticsearch plugins setup here
# Example: RUN elasticsearch-plugin install analysis-icu

# NORI 플러그인 설치
RUN elasticsearch-plugin install --batch analysis-nori
# dict 디렉토리 생성
RUN mkdir -p /usr/share/elasticsearch/config/dict