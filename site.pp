# when puppet agent -t is applied from "client.mysql.com" mysql client will be installed on node client.mysql.com 
node 'client.mysql.com' {
  class { '::mysql::client': 
  }
# To deploy mysql server on node server.mysql.com
# override_options help you to set/override max_connections value to 1024 in my.cnf file
node 'server.mysql.com' {
 include mysqltest
}
 



