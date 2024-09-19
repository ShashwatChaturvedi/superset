# Step 1: Use the official Apache Superset image as the base
FROM apache/superset:latest

# Step 2: Set the working directory in the container
WORKDIR /app

# Step 3: Expose the port Superset runs on
EXPOSE 8088

# Step 4: Start Superset
CMD ["superset", "run", "-p", "8088", "--with-threads", "--reload", "--debugger"]
