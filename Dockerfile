# Use an official Python image as the base
FROM python:3.11-slim


# Set work directory inside the container
WORKDIR /app

# Copy the project files into the container
COPY . .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port Flask will run on
EXPOSE 5000

# Run the application
CMD ["python", "app.py"]
