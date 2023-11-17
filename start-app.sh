#!/bin/bash

docker stop dabba-tech-frontend dabba-tech-backend
docker rm dabba-tech-frontend dabba-tech-backend

cd backend
docker build -t dabba-tech-backend -f Dockerfile .
docker run -d --name dabba-tech-backend -p 3000:3000 dabba-tech-backend
cd ..

cd frontend
docker build -t dabba-tech-frontend -f Dockerfile .
docker run -d --name dabba-tech-frontend -p 8080:8080 dabba-tech-frontend
cd ..

sleep 5

docker run -p 8080:8080 -d dabba-tech

xdg-open http://localhost:8080
