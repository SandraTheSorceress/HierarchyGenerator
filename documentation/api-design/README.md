# API Documentation

## GET /api/hierarchy

This endpoint retrieves a list of hierarchy objects with optional search and pagination functionality.

### Request Parameters

| Parameter     | Type     | Description                                      | Required | Default Value |
|---------------|----------|--------------------------------------------------|----------|---------------|
| `search`      | string   | Search term to filter the hierarchies (optional) | No       | `null`        |
| `limit`       | integer  | The number of items per page (optional)          | No       | `10`          |
| `page`        | integer  | The page number to retrieve (optional)           | No       | `1`           |

### Response

| Field              | Type     | Description                                      |
|--------------------|----------|--------------------------------------------------|
| `id`               | integer  | Unique identifier of the hierarchy               |
| `name`             | string   | Name of the hierarchy                            |
| `numberOfNodes`    | integer  | Number of nodes in the hierarchy                 |
| `numberOfEndUsers` | integer  | Number of end users linked to the hierarchy      |
| `numberOfAttributes`| integer | Number of attributes in the hierarchy            |
| `numberOfContacts` | integer  | Number of contacts in the hierarchy              |
| `createdDate`      | string   | Date and time the hierarchy was created          |
| `lastModified`     | string   | Date and time the hierarchy was last modified    |
| `status`           | string   | Current status of the hierarchy (TODO, PROCESSING, CREATED) |


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
      "lastModified": "2025-03-22T14:30:00",
      "status": "CREATED"
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

## POST /api/hierarchy

This endpoint creates a new hierarchy.

### Request Body

| Field   | Type | Description                                                                                      | Required |
|---------|------|--------------------------------------------------------------------------------------------------|----------|
| `name`  | string | The name of the new hierarchy.                                                                  | Yes      |
| `theme` | string | The theme associated with the hierarchy.                                                        | Yes      |
| `l1`    | enum   | Number of Level 1 nodes. One of: `A_FEW`, `SOME`, `SURPRISE_ME`.                                | Yes      |
| `l2`    | enum   | Number of Level 2 nodes. One of: `NONE`, `A_FEW`, `SOME`, `SURPRISE_ME`.                        | Yes      |
| `l3`    | enum   | Number of Level 3 nodes. One of: `NONE`, `A_FEW`, `SOME`, `SURPRISE_ME`.                        | Yes      |
| `l4`    | enum   | Number of Level 4 nodes. One of: `NONE`, `A_FEW`, `SOME`, `SURPRISE_ME`.                        | Yes      |
| `l5`    | enum   | Number of Level 5 nodes. One of: `NONE`, `A_FEW`, `SOME`, `A_LOT`, `TONS`, `SURPRISE_ME`.       | Yes      |

### Example Request:

```json
{
  "name": "My Fantasy Hierarchy",
  "theme": "FANTASY_KINGDOM",
  "l1": "SOME",
  "l2": "A_FEW",
  "l3": "SOME",
  "l4": "NONE",
  "l5": "NONE"
}
```

## DELETE /api/hierarchy/{id}

This endpoint allows you to delete a specific hierarchy.

### URL Parameters

| Parameter     | Type     | Description                                      | Required | Default Value |
|---------------|----------|--------------------------------------------------|----------|---------------|
| `id`          | integer  | The unique identifier of the hierarchy to delete | Yes      | N/A           |

### Example Request:

```plaintext
DELETE /api/hierarchy/1
```