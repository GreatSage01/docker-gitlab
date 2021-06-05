FROM sameersbn/gitlab:13.12.2
# op-docker.fzzixun.com/op/gitlab-docker-d:v1

ENV GITLAB_CACHE_DIR="/etc/docker-gitlab" \
    GITLAB_RUNTIME_DIR="${GITLAB_CACHE_DIR}/runtime" \
    GITLAB_HOME="/home/git" \
    GITLAB_LOG_DIR="/var/log/gitlab" \
    GITLAB_DATA_DIR="${GITLAB_HOME}/data" \
    GITLAB_INSTALL_DIR="${GITLAB_HOME}/gitlab"

COPY assets/runtime/ ${GITLAB_RUNTIME_DIR}/
EXPOSE 22/tcp 80/tcp 443/tcp

VOLUME ["${GITLAB_DATA_DIR}", "${GITLAB_LOG_DIR}","${GITLAB_HOME}/gitlab/node_modules"]
WORKDIR ${GITLAB_INSTALL_DIR}
ENTRYPOINT ["/sbin/entrypoint.sh"]
CMD ["app:start"]