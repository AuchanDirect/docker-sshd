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
  --volume /shared/file/path:/home/ssh/data \
  --volume ~/.ssh/id_rsa.pub:/etc/ssh/authorized_keys:ro \
  -p 2222:22 docker-sshd
```

Client:

```bash
ssh -p 2222 ssh@localhost
```

# Warning

The host private key are generated at Docker build time.
Keep and inject your known private keys on a production servers !

```bash
docker run --rm -it \
  --volume /shared/file/path:/home/ssh/data \
  --volume ~/.ssh/id_rsa.pub:/etc/ssh/authorized_keys:ro \
  --volume /secure/ssh_host_dsa_key:/etc/ssh/ssh_host_dsa_key:ro \
  --volume /secure/ssh_host_ecdsa_key:/etc/ssh/ssh_host_ecdsa_key:ro \
  --volume /secure/ssh_host_ed25519_key:/etc/ssh/ssh_host_ed25519_key:ro \
  --volume /secure/ssh_host_rsa_key:/etc/ssh/ssh_host_rsa_key:ro \
  -p 2222:22 docker-sshd
```
