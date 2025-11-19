# Development Basics - Exercises

## Exercise 1: Git Fundamentals

**Objective:** Master Git version control.

### Tasks:

1. **Initialize repository**
   ```bash
   # Create project directory
   mkdir my-project
   cd my-project
   
   # Initialize Git repository
   git init
   
   # Configure Git
   git config --global user.name "Your Name"
   git config --global user.email "your.email@example.com"
   ```

2. **Basic Git workflow**
   ```bash
   # Create a file
   echo "# My Project" > README.md
   
   # Check status
   git status
   
   # Add file to staging
   git add README.md
   
   # Commit
   git commit -m "Initial commit: Add README"
   
   # View commit history
   git log
   git log --oneline
   ```

3. **Branching and merging**
   ```bash
   # Create and switch to new branch
   git checkout -b feature/new-feature
   # or
   git switch -c feature/new-feature
   
   # Make changes
   echo "New feature" > feature.txt
   git add feature.txt
   git commit -m "Add new feature"
   
   # Switch back to main
   git checkout main
   # or
   git switch main
   
   # Merge branch
   git merge feature/new-feature
   
   # Delete branch
   git branch -d feature/new-feature
   ```

4. **Remote repositories**
   ```bash
   # Add remote
   git remote add origin https://github.com/user/repo.git
   
   # View remotes
   git remote -v
   
   # Push to remote
   git push -u origin main
   
   # Pull from remote
   git pull origin main
   
   # Clone repository
   git clone https://github.com/user/repo.git
   ```

### Questions to Answer:

- What's the difference between `git add` and `git commit`?
- When would you use `git merge` vs `git rebase`?

---

## Exercise 2: Programming Basics (Python)

**Objective:** Write basic Python scripts.

### Tasks:

1. **Hello World script**
   ```python
   # hello.py
   #!/usr/bin/env python3
   
   def main():
       print("Hello, World!")
       print(f"Python version: {__import__('sys').version}")
   
   if __name__ == "__main__":
       main()
   ```
   
   ```bash
   chmod +x hello.py
   ./hello.py
   ```

2. **Variables and data types**
   ```python
   # variables.py
   name = "John"
   age = 30
   height = 5.9
   is_student = True
   
   print(f"Name: {name}, Type: {type(name)}")
   print(f"Age: {age}, Type: {type(age)}")
   print(f"Height: {height}, Type: {type(height)}")
   print(f"Is Student: {is_student}, Type: {type(is_student)}")
   ```

3. **Functions and error handling**
   ```python
   # functions.py
   def divide(a, b):
       try:
           result = a / b
           return result
       except ZeroDivisionError:
           print("Error: Cannot divide by zero")
           return None
       except TypeError:
           print("Error: Invalid input types")
           return None
   
   print(divide(10, 2))
   print(divide(10, 0))
   ```

4. **File operations**
   ```python
   # file_ops.py
   # Write to file
   with open('data.txt', 'w') as f:
       f.write("Line 1\n")
       f.write("Line 2\n")
   
   # Read from file
   with open('data.txt', 'r') as f:
       lines = f.readlines()
       for line in lines:
           print(line.strip())
   ```

### Questions to Answer:

- What's the difference between `read()` and `readlines()`?
- Why use `with` statement for file operations?

---

## Exercise 3: REST API Development

**Objective:** Create a simple REST API.

### Tasks:

1. **Simple HTTP server** (Python)
   ```python
   # api_server.py
   from http.server import HTTPServer, BaseHTTPRequestHandler
   import json
   
   class APIHandler(BaseHTTPRequestHandler):
       def do_GET(self):
           if self.path == '/api/status':
               self.send_response(200)
               self.send_header('Content-Type', 'application/json')
               self.end_headers()
               response = {'status': 'ok', 'message': 'API is running'}
               self.wfile.write(json.dumps(response).encode())
           else:
               self.send_response(404)
               self.end_headers()
       
       def do_POST(self):
           if self.path == '/api/data':
               content_length = int(self.headers['Content-Length'])
               post_data = self.rfile.read(content_length)
               data = json.loads(post_data.decode())
               
               self.send_response(201)
               self.send_header('Content-Type', 'application/json')
               self.end_headers()
               response = {'received': data}
               self.wfile.write(json.dumps(response).encode())
   
   if __name__ == '__main__':
       server = HTTPServer(('localhost', 8000), APIHandler)
       print("Server running on http://localhost:8000")
       server.serve_forever()
   ```
   
   ```bash
   python3 api_server.py
   ```

2. **Test API with curl**
   ```bash
   # GET request
   curl http://localhost:8000/api/status
   
   # POST request
   curl -X POST http://localhost:8000/api/data \
        -H "Content-Type: application/json" \
        -d '{"name": "John", "age": 30}'
   ```

3. **Using Flask** (if installed)
   ```python
   # flask_api.py
   from flask import Flask, jsonify, request
   
   app = Flask(__name__)
   
   @app.route('/api/status', methods=['GET'])
   def get_status():
       return jsonify({'status': 'ok'})
   
   @app.route('/api/users', methods=['POST'])
   def create_user():
       data = request.json
       return jsonify({'created': data}), 201
   
   if __name__ == '__main__':
       app.run(host='0.0.0.0', port=8000)
   ```

### Questions to Answer:

- What are the main HTTP methods?
- What's the difference between GET and POST?

---

## Exercise 4: Testing

**Objective:** Write and run tests.

### Tasks:

1. **Unit tests** (Python)
   ```python
   # test_calculator.py
   import unittest
   
   def add(a, b):
       return a + b
   
   def multiply(a, b):
       return a * b
   
   class TestCalculator(unittest.TestCase):
       def test_add(self):
           self.assertEqual(add(2, 3), 5)
           self.assertEqual(add(-1, 1), 0)
       
       def test_multiply(self):
           self.assertEqual(multiply(2, 3), 6)
           self.assertEqual(multiply(-1, 5), -5)
   
   if __name__ == '__main__':
       unittest.main()
   ```
   
   ```bash
   python3 -m pytest test_calculator.py
   # or
   python3 test_calculator.py
   ```

2. **Integration test example**
   ```python
   # test_api.py
   import unittest
   import requests
   
   class TestAPI(unittest.TestCase):
       def setUp(self):
           self.base_url = "http://localhost:8000"
       
       def test_status_endpoint(self):
           response = requests.get(f"{self.base_url}/api/status")
           self.assertEqual(response.status_code, 200)
           self.assertEqual(response.json()['status'], 'ok')
   ```

### Questions to Answer:

- What's the difference between unit and integration tests?
- Why write tests before code (TDD)?

---

## Exercise 5: Complete Project

**Objective:** Build a complete project using all concepts.

### Project: Task Manager API

Create a simple task manager with:

1. **Git Repository**
   - Initialize Git repo
   - Create proper .gitignore
   - Make initial commit
   - Create feature branches

2. **Python Application**
   - Task class with properties
   - Task manager with CRUD operations
   - File persistence
   - Error handling

3. **REST API**
   - GET /tasks - List all tasks
   - POST /tasks - Create task
   - GET /tasks/{id} - Get task
   - PUT /tasks/{id} - Update task
   - DELETE /tasks/{id} - Delete task

4. **Tests**
   - Unit tests for Task class
   - Unit tests for TaskManager
   - Integration tests for API

5. **Documentation**
   - README with setup instructions
   - API documentation
   - Usage examples

### Deliverables:

- Complete working application
- Tests with good coverage
- Git repository with proper commits
- Documentation

---

## Additional Challenges

1. **CLI Tool**: Create a command-line task manager
2. **Database Integration**: Add SQLite database
3. **Authentication**: Add user authentication
4. **Docker**: Containerize the application

---

**Congratulations!** You've completed the Foundations phase exercises.

**Next Phase:** [Phase 2: Infrastructure](../../../docs/02-infrastructure.md)

