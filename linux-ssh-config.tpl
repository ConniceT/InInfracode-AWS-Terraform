cat << EOF >> ~/.ssh/config

Host ${host_name}
    HostName ${host_name}
    User ${user}
    IdentityFile ${identity_file}
EOF
