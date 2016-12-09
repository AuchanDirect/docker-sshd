FROM alpine:3.3

# Add openssh
RUN apk add --no-cache openssh rsync

# Copy sshd config
RUN ssh-keygen -A
ADD sshd_config /etc/ssh/sshd_config

# Create user
RUN adduser -D -g ",,," -h /home/ssh ssh && \
  echo "ssh:" | chpasswd && \
  mkdir -p /home/ssh/.ssh && \
  chown root:root /home/ssh && \
  chmod 755 /home/ssh

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D", "-E", "/var/log/auth.log"]
