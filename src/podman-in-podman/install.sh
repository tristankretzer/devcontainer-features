#!/bin/sh
set -e

apt-get update -q
apt-get upgrade -yq
DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends \
    podman \
    fuse-overlayfs \
    slirp4netns \
    uidmap

# Replace setuid bits by proper file capabilities for uidmap binaries.
# See <https://github.com/containers/podman/discussions/19931>.
DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends \
    libcap2-bin
chmod 0755 /usr/bin/newuidmap /usr/bin/newgidmap
setcap cap_setuid=ep /usr/bin/newuidmap
setcap cap_setgid=ep /usr/bin/newgidmap
apt-get autoremove --purge -y libcap2-bin

if [ "${INSTALLPODMANDOCKER}" = "true" ]; then
  DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends \
    podman-docker
fi;

rm -rf /var/lib/apt/lists/*

REMOTE_USER_ID=$(id "${_REMOTE_USER}" -u)
REMOTE_GROUP_ID=$(id "${_REMOTE_USER}" -g)

tee /etc/subuid > /dev/null \
<<EOF
root:1:65535
${_REMOTE_USER}:1:$((REMOTE_USER_ID - 1))
${_REMOTE_USER}:$((REMOTE_USER_ID + 1)):$((65535 - REMOTE_USER_ID))
EOF

tee /etc/subgid > /dev/null \
<<EOF
root:1:65535
${_REMOTE_USER}:1:$((REMOTE_GROUP_ID - 1))
${_REMOTE_USER}:$((REMOTE_GROUP_ID + 1)):$((65535 - REMOTE_GROUP_ID))
EOF

tee /etc/containers/containers.conf > /dev/null \
<<EOF
[containers]
netns="host"
userns="host"
ipcns="host"
utsns="host"
cgroupns="host"
cgroups="disabled"
log_driver = "k8s-file"
[engine]
cgroup_manager = "cgroupfs"
events_logger="file"
runtime="crun"
EOF

mkdir -p "${_REMOTE_USER_HOME}"/.config/containers
tee "${_REMOTE_USER_HOME}"/.config/containers/containers.conf > /dev/null \
<<EOF
[containers]
volumes = [
	"/proc:/proc",
]
default_sysctls = []
EOF
chown -R "${_REMOTE_USER}": "${_REMOTE_USER_HOME}"/.config
