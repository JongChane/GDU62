--/jspstudy/src/main/java/sql/study.sql
create table board (
	num int primary key,		-- 게시글 번호. 기본키
	writer varchar(30), 		-- 작성자 이름
	pass varchar(20),		  	-- 게시글 비밀번호
	title varchar(100),			-- 글제목
	content varchar(2000),	-- 글내용
	file1 varchar(200),	  	-- 첨부파일명 
	boardid varchar(2),			-- 게시판종류 : 1 - 공지사항, 2 - 자유게시판, 3 - QnA
	regdate datetime,				-- 등록일시
	readcnt int(10),				-- 조회수. 상세보기 시 1씩 증가
	grp int,								-- 답글 작성시 원글의 게시글 번호
	grplevel int(3),				-- 답글의 레벨.
	grpstep int(5)					-- 그룹의 출력 순서
	);
	
drop table member;
drop table board;
create table member (
	id varchar (20) primary key,
	pass varchar(20),
	name varchar(20),
	gender int(1),
	tel varchar(15),
	email varchar(50),
	picture varchar(200)
);

select * from member

create table book (
	writer varchar (20) primary key,
	title varchar(20),
	content varchar(200)
);

select * from board

drop table comment
CREATE TABLE COMMENT (
num INT REFERENCES board(num), -- 보드 테이블의 num을 참조설정
seq INT,
writer VARCHAR(30),
content VARCHAR(2000),
regdate DATETIME,
PRIMARY KEY(num,seq) -- 중복키 설정
)

select * from comment

SELECT * ,
(SELECT COUNT(*) FROM COMMENT c WHERE c.num = b.num) commcnt
FROM board b WHERE boardid = 2 ORDER BY grp DESC, grpstep asc