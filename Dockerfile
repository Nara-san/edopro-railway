FROM dyxel/multirole:latest

# 작업 디렉토리 설정 (디렉토리가 없으면 생성됨)
WORKDIR /app

# Railway 포트 환경변수 설정
ENV PORT=${PORT:-7911}

# 설정 파일 생성 (작업 디렉토리에)
RUN echo "{\"port\": ${PORT:-7911}, \"maxRooms\": 10, \"concurrencyHint\": -1}" > config.json

EXPOSE $PORT

# multirole 실행 파일 찾아서 실행
CMD ["sh", "-c", "find / -name multirole -type f 2>/dev/null | head -1 | xargs -I {} {} || echo 'Multirole executable not found'"]