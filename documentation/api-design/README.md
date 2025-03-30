# API Documentation

## GET /api/hierarchy

This endpoint retrieves a list of hierarchy objects with optional search and pagination functionality.

### Request Parameters

| Parameter     | Type     | Description                                      | Required | Default Value |
|---------------|----------|--------------------------------------------------|----------|---------------|
| `search`      | string   | Search term to filter the hierarchies (optional) | No       | `null`        |
| `limit`       | integer  | The number of items per page (optional)          | No       | `10`          |
| `page`        | integer  | The page number to retrieve (optional)           | No       | `1`           |

### Example Request:

```plaintext
GET /api/hierarchy?search=Monster&limit=10&page=1
```

### Example Response:
Content-Type: text/json
```json
{
  "data": [
    {
      "id": 1,
      "name": "Monster Hierarchy",
      "numberOfNodes": 1,
      "numberOfEndUsers": 50,
      "numberOfAttributes": 50,
      "numberOfContacts": 15,
      "createdDate": "2025-03-22T14:30:00",
      "lastModified": "2025-03-22T14:30:00"
    },
    // More items...
  ],
  "meta": {
    "total": 100,        // Total number of items in the database
    "limit": 10,         // Number of items per page
    "page": 1,           // Current page number
    "total_pages": 10    // Total number of pages
  }
}
```

## GET /api/hierarchy/{id}/download

This endpoint allows you to download a specific hierarchy as a CSV file.

### URL Parameters

| Parameter     | Type     | Description                                      | Required | Default Value |
|---------------|----------|--------------------------------------------------|----------|---------------|
| `id`          | integer  | The unique identifier of the hierarchy to download | Yes      | N/A           |

### Example Request:

```plaintext
GET /api/hierarchy/1/download
```

### Example Response:
Content-Type: text/csv
```plaintext
node_id, node_label, parent, contact_id
1,Sweden,,user1
2,Stockholm,1,user2
3,Gothenburg,1,user3
4,Malmö,1,user4
5,Solna,2,user5
```