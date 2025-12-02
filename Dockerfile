# hadolint ignore=DL3006
FROM registry.access.redhat.com/ubi9/ubi

WORKDIR /sonarqube_exporter/
COPY . .

# hadolint ignore=DL3041
RUN dnf install -y python3 python3-pip && \
    dnf clean all

RUN pip3 install --no-cache-dir -r requirements.txt

EXPOSE 8198
ENTRYPOINT [ "/bin/sh",  "entrypoint.sh" ]
