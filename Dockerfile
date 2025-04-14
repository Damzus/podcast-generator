# Use a smaller, Python-focused base image
FROM python:3.10-slim

# Install system dependencies (git, etc.)
RUN apt-get update && apt-get install -y \
    git \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Install required Python packages
RUN pip install --no-cache-dir PyYAML

# Copy Python script into container
COPY feed.py /usr/local/bin/feed.py

# Copy and make entrypoint executable
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Set default command
ENTRYPOINT ["/entrypoint.sh"]