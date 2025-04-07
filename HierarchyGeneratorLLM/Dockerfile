FROM ollama/ollama:0.6.4

COPY install_phi.sh /install_phi.sh
RUN chmod +x /install_phi.sh

ENTRYPOINT ["/install_phi.sh"]

# RUN ./install_phi.sh