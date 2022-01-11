#
#  Simple SSH keyless etup script when ssh-copy-id isn't available
#
user=username
host=hostname
port=22

ssh $user@$host:$port 'mkdir -m 700 ~/.ssh; echo ' $(< ~/.ssh/id_rsa.pub) ' >> ~/.ssh/authorized_keys ; chmod 600 ~/.ssh/authorized_keys'
