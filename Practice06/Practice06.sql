DROP table book;
drop table author;

drop sequence seq_author_id;
drop sequence seq_book_id;

create table author(
    author_id number(10),
    author_name varchar2(100) not null,
    author_desc varchar2(500),
    primary key (author_id)
);

create table book(
    book_id number(10),
    title varchar2(100) not null,
    pubs VARCHAR2 (100),
    pub_date date,
    author_id number(10),
    primary key (book_id),
    
    constraint book_fk foreign key (author_id)
    references author(author_id)
);

insert into author
values (1, '김문열', '경북 영양');
insert into author
values (2, '박경리', '경상남도 통영');
insert into author
values (3, '유시민', '17대 국회의원');
insert into author
values (4, '기안84', '기안동에서 산 84년생');
insert into author
values (5, '강풀', '온라인 만화가 1세대');
insert into author
values (6, '김영하', '알쓸신잡');

insert into book
values(1, '우리들의 일그러진 영웅', '다림', '1998-02-22', 1);
insert into book
values(2, '삼국지', '만음사', '2002-03-01', 1);
insert into book
values(3, '토지', '마로니에북스', '2012-08-15', 2);
insert into book
values(4, '유시민의 글쓰기 특강', '생각의길', '2015-04-01', 3);
insert into book
values(5, '패션왕', '중앙북스(books)', '2012-02-22', 4);
insert into book
values(6, '순정만화', '재미주의', '2011-08-03', 5);
insert into book
values(7, '오직두사람', '문학동네', '2017-05-04', 6);
insert into book
values(8, '26년', '재미주의', '2012-02-04', 5);

create sequence seq_author_id 
increment by 1 
start with 1 
nocache;

create sequence seq_book_id --선택한 컬럼에 번호표를 붙여주겠다
increment by 1 -- 1씩증가한다
start with 1 -- 1부터 시작한다
nocache;

select * from book;
select * from author;

select  b.book_id,
        b.title,
        b.pubs,
        b.pub_date,
        a.author_id,
        a.author_name,
        a.author_desc
from book b, author a
where b.author_id = a.author_id;

update author
set author_desc = '서울특별시'
where author_id = 5;

