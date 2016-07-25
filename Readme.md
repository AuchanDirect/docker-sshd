# Docker SSHd

Create an ssh/scp/sftp access point.

This container runs an sshd process, allowing authentication by key for the "ssh" user.

Usage:
 * Mount your public keys in /home/ssh/.ssh/authorized_keys
 * Mount whatever files from the host filesystem into the user "home"
 * Expose the 22 port

# Exemple

Server

```bash
docker run --rm -it \
  --volume ~/.ssh/id_rsa.pub:/home/ssh/.ssh/authorized_keys:ro \
  --volume /shared/file/path:/home/ssh/data \
  -p 2222:22 docker-sshd
```

Client:

```bash
ssh -p 2222 ssh@localhost
```
