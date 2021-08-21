
create table word_tbl
(
word_no int identity(1,1) primary key,
kor nvarchar(40),
eng varchar(40)
)



select * from word_tbl
select * from idiom_tbl

create table idiom_tbl
(
idiom_no int identity(1,1) primary key,
idiom_name nvarchar(40),
idiom_kor ntext,
idiom_eng text
)

insert into idiom_tbl values(N'역지사지', N'처지를 바꾸어서 생각하여 보다', 'Put yourself in my shoes.')
insert into idiom_tbl values(N'일석이조', N'한가지일을 해서 두가지의 이익을 얻는 것', 'Kill two birds with one stone.')
insert into idiom_tbl values(N'새옹지마', N'인생의 길흉화복은 변화가 많아 예측하기 어렵다는 말', 'In life there are always ups and downs.')
insert into idiom_tbl values(N'설상가상', N'눈이 내리고 그 위에 서리가 내린다는 말', 'When it rains, it pours.')
insert into idiom_tbl values(N'조삼모사', N'눈 앞에 보이는 차이만 알고 결과가 같은 것을 모르는 어리석음을 비유할 때 쓰는 말', 'Either way, it is the same.')
insert into idiom_tbl values(N'고진감래', N'고생 끝에 낙이 온다', 'Sweet after bitter.')
insert into idiom_tbl values(N'화양연화', N'인생 중 가장 행복한 시기', 'The happiest moment of my life.')
insert into idiom_tbl values(N'호형호제', N'서로 형 아우라 부를 정도로 가까운 친구 사이', 'Best friends who call each other brother.')
insert into idiom_tbl values(N'칠전팔기', N'일곱 번 넘어져도 여덟 번 일어선다', 'Righteous man falls seven times, and rises again.')
insert into idiom_tbl values(N'사필귀정', N'모든 일은 반드시 옳은 데로 돌아온다', 'Justice will prevail.')
insert into idiom_tbl values(N'대기만성', N'큰 그릇은 늦게 완성된다.', 'A late bloomer.')

delete idiom_tbl where idiom_no='1001'



insert into word_tbl(kor, eng) values(N'접근', 'access')
update idiom_tbl set idiom_eng='Righteous man falls seven times, and rises again.' where idiom_no=9

DBCC CHECKIDENT(word_tbl, RESEED, 11)
DBCC CHECKIDENT(idiom_tbl, RESEED, 10)

select * from word_tbl 
SELECT * FROM word_tbl where word_no=1
SELECT COUNT(*) as cnt FROM word_tbl
SELECT * FROM idiom_tbl where CONVERT(VARCHAR, idiom_eng)='Put yourself in my shoes.'

select top 1 word_no from word_tbl order by word_no desc; 
