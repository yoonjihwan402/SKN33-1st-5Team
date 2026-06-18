create database cardb;
grant all privileges on cardb.* to skn_ai@'%';

show grants for skn_ai@'%';

# 위 구문 실행후 데이터 소스 추가
# 계정은 skn_ai
# 데이터베이스 이름 : cardb