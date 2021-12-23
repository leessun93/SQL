--webdb계정에 테이블 만들기
create table book(
    book_id number(5),
    title varchar(20),
    author varchar(20),
    pub_date date
    );
    
--컬럼 속성 변경
alter table book modify(title varchar2(100));
alter table book rename column title to subject;
alter table book modify(subject varchar2(100));


--컬럼 삭제
alter table book drop(author);

--테이블명변경
rename book to article;

select * from book;
select * from article;

--테이블 삭제
drop table article;


--author 테이블 만들기
create table author(
    author_id number(10),
    author_name varchar(100) not null,
    author_desc varchar(500),
    primary key(author_id)
    );
    
select * from author;

--book 테이블 만들기
create table book(
    book_id number(10),
    title varchar2(100) not null,
    pubs varchar2(100),
    pub_date date,
    author_id number(10),
    primary key(book_id),
    CONSTRAINT book_fk foreign key (author_id) REFERENCES author(author_id)
    );
    
select * from book;
select * from author;

--묵시적 방법
insert into author
values(1, '박경리', '토지 작가');

--명시적 방법
insert into author(author_id, author_name)
values(2, '이문열');

insert into author
values(3, '기안84', '웹툰작가');

--수정(UPDATE문)
UPDATE author
SET author_name = '김경리'
WHERE author_id = 1;

SELECT * FROM author;

--삭제!!!!!!!!!!
DELETE FROM author
WHERE author_id = 1;

DELETE FROM author;
/*************************
********SEQUENCE**********
*************************/
CREATE SEQUENCE seq_author_id
INCREMENT BY 1
START WITH 1;

DROP SEQUENCE seq_author_id;

INSERT INTO author
VALUES(seq_author_id.nextval, '박경리', '토지작가');

UPDATE author
SET author_desc = '토지 작가'
where author_id = 1;

INSERT INTO author
VALUES(seq_author_id.nextval, '이문열', '삼국지 작가');

INSERT  INTO author
VALUES(seq_author_id.nextval, '박경리', '토지');

INSERT  INTO author
VALUES(seq_author_id.nextval, '김경식씨', '장생농씨');

--시퀀스 조회
select * from user_sequences;
select seq_author_id.currval from dual;
select seq_author_id.nextval from dual;
DROP SEQUENCE seq_author_id;

