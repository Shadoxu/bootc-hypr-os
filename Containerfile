FROM quay.io/fedora/fedora-bootc:41

# -------------------------------------------------
# Enable required repos
# -------------------------------------------------
RUN dnf -y install dnf-plugins-core && \
    dnf -y copr enable solopasha/hyprland && \
    dnf clean all

# -------------------------------------------------
# Install base system packages
# -------------------------------------------------
COPY system/packages.txt /tmp/packages.txt

RUN dnf -y install \
    $(cat /tmp/packages.txt) && \
    dnf clean all

# -------------------------------------------------
# DMS shell (simple session manager)
# -------------------------------------------------
COPY system/dms.sh /usr/local/bin/dms
RUN chmod +x /usr/local/bin/dms

# -------------------------------------------------
# Hyprland default config (user override later)
# -------------------------------------------------
RUN mkdir -p /etc/skel/.config/hypr
COPY hypr/hyprland.conf /etc/skel/.config/hypr/hyprland.conf

# -------------------------------------------------
# Set default shell session
# -------------------------------------------------
RUN echo 'exec dms' >> /etc/skel/.bash_profile

# -------------------------------------------------
# No services enabled (bootc handles lifecycle)
# -------------------------------------------------
