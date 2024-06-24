classDiagram
direction BT
class cleaning {
   integer status
   text startdatetime
   text enddatetime
   uuid cleaner
   uuid consumer
   uuid ctype
   uuid id
}
class company {
   uuid managers
   uuid workers
   uuid administrators
   text name
   uuid services
   text ico
}
class email {
   uuid sender
   uuid recipient
   text subject
   text body
   uuid id
}
class notification {
   text type
   text content
   text title
   text action_time
   uuid recipient
   text sender
   uuid user_id
   uuid id
}
class user {
   text fname
   text lname
   text pswd
   text email
   double precision rating
   text socials
   text phone
   text address
   uuid id
}

cleaning  -->  user : consumer:id
cleaning  -->  user : cleaner:id
company  -->  user : managers:id
company  -->  user : workers:id
company  -->  user : administrators:id
email  -->  user : sender:id
email  -->  user : recipient:id
notification  -->  company : sender:ico
notification  -->  user : user_id:id
notification  -->  user : recipient:id
