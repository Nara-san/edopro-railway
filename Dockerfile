# 안정적인 멀티롤 서버 사용
FROM dyxel/multirole:latest

# Railway 포트 설정
ENV PORT=${PORT:-7911}

# 기본 설정 파일 생성
RUN echo '{"port": '${PORT:-7911}', "maxRooms": 10}' > /app/config.json

EXPOSE $PORT

CMD ["./multirole"]