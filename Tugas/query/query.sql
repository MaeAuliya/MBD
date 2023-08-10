--1
select b_title from peminjaman as p
join book as b on b.b_id = p.b_id
join users as u on p.u_id = u.u_id
where u.u_name like 'Maila Angge'


--2
select u_name from users
join peminjaman on users.u_id = peminjaman.u_id
join book on peminjaman.b_id = book.b_id
where book.b_title like 'Edensor'

--3
select a_name,count(book.b_id) as jumlah from author
join book on book.a_id = author.a_id
join peminjaman on book.b_id = peminjaman.b_id
join users on peminjaman.u_id = users.u_id
group by a_name
order by jumlah desc

--4
select distinct b_title as judul_buku from book
join peminjaman on book.b_id = peminjaman.b_id
join users on peminjaman.u_id = users.u_id
where users.u_name = 'Karolina Smith' or users.u_name = 'Alessandra Pragua'

--5
select u_name as nama,p_tanggal as tanggal from users
join peminjaman on users.u_id = peminjaman.u_id
where not p_tanggal = '2022-02-9'
ORDER BY tanggal ASC

--6
select distinct a_name,count(peminjaman.b_id) as jumlah from author
join book on book.a_id = author.a_id
join peminjaman on book.b_id = peminjaman.b_id
join users on peminjaman.u_id = users.u_id
group by a_name 
order by jumlah desc 
limit 1


--7
select b_title,count(peminjaman.b_id) as jumlah from author
join book on book.a_id = author.a_id
join peminjaman on book.b_id = peminjaman.b_id
join users on peminjaman.u_id = users.u_id
group by b_title
having count(book.b_id) > 2
order by jumlah asc
