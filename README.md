<h1 align="center">
📖 DLAI FINETUNING
</h1>

A collection of notebooks for the course DLAI Finetuning LLMs with local environment setup

<!-- [Course Link](https://www.deeplearning.ai/short-courses/finetuning-large-language-models/) -->

## Learning Objectives

- Learn the fundamentals of finetuning a large language model (LLM).
- Understand how finetuning differs from prompt engineering, and when to use both.
- Get practical experience with real data sets, and how to use techniques for your own projects.

## 🔧 Features

- Collection of Notebooks
- Local venev setup using Poetry
- Docker Support with Optimisation Cache etc
- Run the Notebook Server with Docker

This repo contains an `notebooks` flocation contains the ntebooks

## 💻 Generate API Key for LAMINI

1. Sign up on https://www.lamini.ai/
2. Go to Account and get the API key Under `Active API Tokens`
3. Under `.powerml/configure_llama.yaml`, add the key
4. `dotenv` can also be used to setup the key. Use the `env.example` to create `env` file

for more on Authentcation read `https://lamini-ai.github.io/auth/`

## 💻 Running Locally

1. Clone the repository📂

```bash
git clone https://github.com/amjadraza/dlai-finetuning.git
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

``docker  build . -t dlai-finetuning:latest ``

To generate Image with `DOCKER_BUILDKIT`, follow below command

```DOCKER_BUILDKIT=1 docker build --target=runtime . -t dlai-finetuning:latest```

1. Run the docker container directly 

``docker run -d --name dlai-finetuning -p 8888:8888 dlai-finetuning:latest ``

2. Run the docker container using docker-compose (Recommended)

``docker-compose up``

> Make sure to include the `.env` SECRETS file when running with `docker-compose` with your own Keys.



## Report Feedbacks

As `dlai-hf-course:latest` is a template project with minimal example. Report issues if you face any. 

## DISCLAIMER & CREDITS

We have collected the Notebooks from original course and edited for few lines/functions to make them run locally. 

We must give credit to Course Instructores [Sharon Zhou](https://www.linkedin.com/in/zhousharon)