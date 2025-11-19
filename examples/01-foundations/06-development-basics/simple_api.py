#!/usr/bin/env python3
"""
Simple REST API Example
Purpose: Demonstrate basic REST API concepts
Author: Cloud Training
"""

from http.server import HTTPServer, BaseHTTPRequestHandler
import json
import urllib.parse

# In-memory data store
tasks = [
    {"id": 1, "title": "Learn Python", "completed": False},
    {"id": 2, "title": "Build API", "completed": False},
]


class APIHandler(BaseHTTPRequestHandler):
    def _send_response(self, status_code, data=None):
        """Send JSON response"""
        self.send_response(status_code)
        self.send_header('Content-Type', 'application/json')
        self.send_header('Access-Control-Allow-Origin', '*')
        self.end_headers()
        if data:
            self.wfile.write(json.dumps(data).encode())

    def do_GET(self):
        """Handle GET requests"""
        if self.path == '/api/tasks':
            self._send_response(200, tasks)
        elif self.path.startswith('/api/tasks/'):
            task_id = int(self.path.split('/')[-1])
            task = next((t for t in tasks if t['id'] == task_id), None)
            if task:
                self._send_response(200, task)
            else:
                self._send_response(404, {'error': 'Task not found'})
        elif self.path == '/api/status':
            self._send_response(200, {'status': 'ok', 'message': 'API is running'})
        else:
            self._send_response(404, {'error': 'Not found'})

    def do_POST(self):
        """Handle POST requests"""
        if self.path == '/api/tasks':
            content_length = int(self.headers['Content-Length'])
            post_data = self.rfile.read(content_length)
            data = json.loads(post_data.decode())
            
            # Create new task
            new_id = max([t['id'] for t in tasks], default=0) + 1
            new_task = {
                'id': new_id,
                'title': data.get('title', ''),
                'completed': data.get('completed', False)
            }
            tasks.append(new_task)
            self._send_response(201, new_task)
        else:
            self._send_response(404, {'error': 'Not found'})

    def do_PUT(self):
        """Handle PUT requests"""
        if self.path.startswith('/api/tasks/'):
            task_id = int(self.path.split('/')[-1])
            task = next((t for t in tasks if t['id'] == task_id), None)
            
            if task:
                content_length = int(self.headers['Content-Length'])
                put_data = self.rfile.read(content_length)
                data = json.loads(put_data.decode())
                
                # Update task
                task.update(data)
                self._send_response(200, task)
            else:
                self._send_response(404, {'error': 'Task not found'})
        else:
            self._send_response(404, {'error': 'Not found'})

    def do_DELETE(self):
        """Handle DELETE requests"""
        if self.path.startswith('/api/tasks/'):
            task_id = int(self.path.split('/')[-1])
            global tasks
            tasks = [t for t in tasks if t['id'] != task_id]
            self._send_response(204)
        else:
            self._send_response(404, {'error': 'Not found'})

    def log_message(self, format, *args):
        """Override to customize logging"""
        print(f"{self.address_string()} - {args[0]}")


def run_server(port=8000):
    """Start the API server"""
    server_address = ('', port)
    httpd = HTTPServer(server_address, APIHandler)
    print(f"Server running on http://localhost:{port}")
    print("Endpoints:")
    print("  GET    /api/tasks      - List all tasks")
    print("  GET    /api/tasks/{id} - Get task by ID")
    print("  POST   /api/tasks      - Create new task")
    print("  PUT    /api/tasks/{id} - Update task")
    print("  DELETE /api/tasks/{id} - Delete task")
    print("  GET    /api/status     - API status")
    try:
        httpd.serve_forever()
    except KeyboardInterrupt:
        print("\nShutting down server...")
        httpd.server_close()


if __name__ == '__main__':
    run_server()

