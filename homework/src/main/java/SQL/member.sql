 create database jspweb;
 
 create table jspweb.member (
	mno int primary key auto_increment,
    mid varchar(20) not null,
    mpassword varchar(10) not null,
    mname varchar(10),
    memail varchar(30),
    mphone varchar(20),
    maddress varchar(100) 
 );
 
create table jspweb.board(
    bno int primary key auto_increment , 
    btitle varchar(100) not null , 
    bcontents varchar(5000) ,
    bwriter varchar(100) ,
    bdate varchar(100) not null ,
    bcount int 
);

create table jspweb.reply (
	rno int primary key auto_increment,
    bno int not null,
    rwriter varchar(100),
    rcontents varchar(1000),
    rdate varchar(100),
    foreign key(bno) references board(bno) on delete CASCADE
);