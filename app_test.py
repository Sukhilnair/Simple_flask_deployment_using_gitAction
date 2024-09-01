import pytest
from app import app

@pytest.fixture
def client():
    with app.test_client() as client:
        yield client

def test_hello_world(client):
    """Test the hello_world route returns the correct JSON data."""
    response = client.get('/')
    json_data = response.get_json()

    assert response.status_code == 200
    assert json_data['message'] == 'Hello, World!'
    assert json_data['status'] == 'success'
