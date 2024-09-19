# Step 1: Use the official Apache Superset image as the base
FROM apache/superset:latest

# Step 2: Set the working directory in the container
WORKDIR /app

# Step 3: Copy the local Superset config file into the container
# Assuming you have superset_config.py in the app/superset_home directory in your project
COPY app/superset_home/superset_config.py /app/superset_home/superset_config.py

# Step 4: Ensure that the directory exists and has appropriate permissions
RUN mkdir -p /app/superset_home && \
    chmod -R 755 /app/superset_home

# Step 5: Install any additional dependencies (if needed)
# RUN pip install some-required-library

# Step 6: Set environment variables (optional)
# For example, if your Superset secret key is stored in superset_config.py, you can reference it directly there
# ENV SUPERSET_CONFIG_PATH /app/superset_home/superset_config.py

# Step 7: Expose the port Superset runs on
EXPOSE 8088

# Step 8: Initialize Superset (if needed)
# Uncomment the following lines to initialize the database and set up an admin user
# RUN superset db upgrade
# RUN superset fab create-admin --username admin --firstname Superset --lastname Admin --email admin@superset.com --password admin

# Step 9: Start Superset with the proper configuration
CMD ["superset", "run", "-p", "8088", "--with-threads", "--reload", "--debugger"]
