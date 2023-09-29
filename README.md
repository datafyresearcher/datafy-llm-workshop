<h1 align="center">
📖 Datafy LLM Workshop 
</h1>

A collection of notebooks for the workshop on LLM


## Learning Objectives

- What is Prompt Engineering
- LiteLL Implementation of LLM Models
- Learn the fundamentals of LLM and LangChain toolkits.
- Models, Memory, Chains & Agents

## 🔧 Features

- Collection of Notebooks
- Local venev setup using Poetry
- Docker Support with Optimisation Cache etc
- Run the Notebook Server with Docker

This repo contains  

1. `notebooks\` : LangChain/LiteLLM for LLM Application Development


## 💻 Generate API Key for LAMINI

1. Sign up on https://platform.openai.com/
2. Generate OpenAI API keys
4. `dotenv` can also be used to setup the key. Use the `env.example` to create `env` file


## 💻 Running Locally

1. Clone the repository📂

```bash
git clone https://github.com/amjadraza/datafy-llm-workshop.git
```

2. Install dependencies with [Poetry](https://python-poetry.org/) and activate virtual environment🔨

```bash
poetry install
poetry shell
```

3. Copy and Modify `env.example` to `.env`

Generate the HF API Key to be able to hosted models for inference and set the variables accordingly.

4. Run the JupyterLab server🚀

```bash

jupyter lab

```


Run Notebooks using Docker
--------------------------
This project includes `Dockerfile` to run the app in Docker container. In order to optimise the Docker Image
size and building time with cache techniques, I have follow tricks in below Article 
https://medium.com/@albertazzir/blazing-fast-python-docker-builds-with-poetry-a78a66f5aed0

Build the docker container

``docker  build . -t datafy-llm-ws:latest ``

To generate Image with `DOCKER_BUILDKIT`, follow below command

```DOCKER_BUILDKIT=1 docker build --target=runtime . -t datafy-llm-ws:latest```

1. Run the docker container directly 

``docker run -d --name dlai-langchain -p 8888:8888 datafy-llm-ws:latest ``

2. Run the docker container using docker-compose (Recommended)

``docker-compose up``

> Make sure to include the `.env` SECRETS file when running with `docker-compose` with your own Keys.



## Report Feedbacks

Create issues if you are having any problems

## DISCLAIMER & CREDITS

We have collected the Notebooks from original course and edited for few lines/functions to make them run locally. 

We must give credit to Course Instructores [Harrison Chase](https://www.linkedin.com/in/harrison-chase-961287118/)