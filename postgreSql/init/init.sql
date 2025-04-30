-- 1. pgvector 확장 설치
CREATE EXTENSION IF NOT EXISTS vector;

-- 2. timescaledb 확장 설치 (TimescaleDB 기능 사용)
CREATE EXTENSION IF NOT EXISTS timescaledb;

-- 3. 벡터 테이블 생성 (예: 3차원 벡터)
CREATE TABLE IF NOT EXISTS items (
                                     id SERIAL PRIMARY KEY,
                                     name TEXT,
                                     embedding VECTOR(3), -- 벡터 차원 수 설정
    created_at TIMESTAMPTZ DEFAULT now()
    );

-- 4. TimescaleDB 하이퍼테이블 변환 (created_at 기준)
SELECT create_hypertable('items', 'created_at', if_not_exists => TRUE);

-- 5. 샘플 데이터 삽입
INSERT INTO items (name, embedding) VALUES
                                        ('apple', '[0.1, 0.2, 0.3]'),
                                        ('banana', '[0.4, 0.5, 0.6]'),
                                        ('cherry', '[0.7, 0.8, 0.9]');
