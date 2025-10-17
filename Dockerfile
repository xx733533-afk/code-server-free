FROM codercom/code-server:latest
EXPOSE 8080
ENV PASSWORD=freevscode
CMD ["code-server", "--bind-addr", "0.0.0.0:8080", "--auth", "password"]
