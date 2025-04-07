#!/bin/sh
ollama serve &

# Wait for Ollama to be ready
sleep 3

# Pull model
ollama pull phi3:mini

wait