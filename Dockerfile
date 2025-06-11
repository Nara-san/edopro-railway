FROM node:18-alpine

# 필요한 패키지 설치
RUN apk add --no-cache git build-base python3

# 작업 디렉토리 설정
WORKDIR /app

# EDOpro-server-ts 클론
RUN git clone https://github.com/diangogav/EDOpro-server-ts.git .

# 의존성 설치
RUN npm install

# 빌드
RUN npm run build

# 포트 노출 (Railway에서 자동으로 PORT 환경변수 제공)
EXPOSE $PORT

# 서버 시작
CMD ["npm", "start"]