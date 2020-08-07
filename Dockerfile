FROM registry.access.redhat.com/ubi8/ubi-minimal

ENV SUMMARY="Minimal kubectl and oc ubi8-minimal image." \
	DESCRIPTION="Minimal [kubectl](https://kubernetes.io/docs/reference/kubectl/overview/) UBI-based image. This image can be used for kubernetes based tasks."

LABEL summary="$SUMMARY" \
	description="$DESCRIPTION" \
	io.k8s.description="$DESCRIPTION" \
	io.k8s.display-name="Kubectl ubi8-minimal" \
	io.openshift.tags="oc,kubectl" \
	name="smerschjohann/ubikube-minimal:latest" \
	vendor="Simon Merschjohann" \
	version="0.1.0" \
	release="0" \
	maintainer="Simon Merschjohann <simon@merschjohann.net>"

# Install requirements
RUN microdnf install -y tar gzip findutils
RUN curl https://mirror.openshift.com/pub/openshift-v4/clients/ocp/latest/openshift-client-linux.tar.gz | tar -xvzC /usr/local/bin/ \
    && curl https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64 -o /usr/local/bin/jq \
    && chmod a+x /usr/local/bin/*

USER 1001

ENTRYPOINT [ "kubectl" ]
CMD [ "--help" ]
