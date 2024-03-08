-- double dash creates a comment
-- If i use "--@block" creates a button
-- @block
CREATE TABLE Users(
    id INT primary key auto_increment,
    email VARCHAR(255) not null unique,
    bio text,
    country VARCHAR(2)
);


--@block
insert INTO users(email, bio, country)
values  (
    'hgggggggjgj@gmail.com',
    'Come see me',
    'AR'
);

--@block  
INSERT INTO users (email, bio, country) 
VALUES ('hello@world.com', 'I love strangers!', 'US');


--@block
select * FROM users;

--@block
SELECT email, id from users
WHERE country= 'us'
AND id = 1
ORDER BY id ASC
limit 5;

--@block    
INSERT INTO users (email,bio,country)
values ('janacaradebanana@gmail.com',
'heeey',
'br'


--@block
SELECT email, id,country from users
WHERE country= 'us'
AND email like 'h%'
ORDER BY id desc
limit 2;

--@block

CREATE INDEX email_index ON Users(email);

--@block    
create TABLE Rooms(
    id INT auto_increment, 
    STREET VARCHAR(255),
    owner_id int not null,
    primary key(id),
    foreign key(owner_id) references  users(id)
);

--@block   

INSERT INTO rooms (owner_id, STREET)
values
(1,'salvador sailboat'),
(1,'palmas casa'),
(1,'brasilia apartamento'),
(1,'sf beach house')


--@block
select * from  users

inner join rooms
on rooms.owner_id = users.id;

--@block
select * from  users

left join rooms
on rooms.owner_id = users.id;

--@block
select * from  users

RIGHT join rooms
on rooms.owner_id = users.id;

--@block
select users.id AS users_id
rooms.id as rooms_id

from users

INNER JOIN rooms
on rooms.owner_id = users.id;

--@block

CREATE TABLE bookings(
    id INT auto_increment,
    guest_id INT not null,
    rooms_id int not null,
    check_in datetime,
    primary key(id),
    foreign key (guest_id) references users(id),
    foreign key (rooms_id) references rooms(id)
);

--@block
SELECT
rooms_id,
guest_id,
email,
bio
FROM bookings
INNER JOIN users on users.id = guest_id
WHERE rooms_id = 1;