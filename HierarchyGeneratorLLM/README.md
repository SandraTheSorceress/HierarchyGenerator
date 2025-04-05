# Hierarchy Large Language Model (LLM)

## About OLlama

[Ollama](https://ollama.com/) is a tool that allows users to interact with AI models in a chat-based format. It enables you to run various AI models locally on your computer.

## Phi3 Mini

[Phi3 Mini](https://ollama.com/library/phi3) is a compact and efficient version of a machine learning model, designed for tasks like natural language processing. It balances performance and resource usage, making it ideal for use in environments with limited computing power.

## How to Test if the Docker Image is Working Using the Terminal

Follow these steps to test the Docker image for LLM:

1. Open a terminal in this directory.

2. Build the image:
    ```bash
	docker build . -t ollama_with_phi3:latest
    ```

3. Create and Start a New Container
    ```bash
	docker run -d -p 11434:11434 --name local_ollama_container ollama_with_phi3:latest
    ```
4. Run the phi3:mini model inside the running container:
    ```bash
	docker exec -it local_ollama_container ollama run phi3:mini
    ```
