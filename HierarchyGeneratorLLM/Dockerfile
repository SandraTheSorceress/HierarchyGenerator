FROM ollama/ollama:0.6.4

RUN apt-get update && apt-get install -y --no install-recommends ca-certificates && update-ca-certificates
COPY install_phi.sh /install_phi.sh
RUN chmod +x /install_phi.sh
RUN ./install_phi.sh