# Database

## How to start the database

Go to parent folder and run:

    docker-compose up -d

## How to look at database using MySQL Workbench

![Database](workbench.png)

User is `root`
Password is `password`

# How to remove the database

Go to parent folder and run:

    docker-compose down

# Entity Relationship Diagram

```mermaid
erDiagram
    Hierarchies ||--o{ L1 : has
    L1 ||--o{ L1Contact : has
    L1 ||--o{ L2 : has
    L2 ||--o{ L2Contact : has
    L2 ||--o{ L3 : has
    L3 ||--o{ L3Contact : has
    L3 ||--o{ L4 : has
    L4 ||--o{ L4Contact : has
    L4 ||--o{ L5 : has
    L5 ||--o{ L5Contact : has

    Hierarchies {
        Id	int PK
        Name longtext
        NumberOfNodes int
        NumberOfEndUsers int
        NumberOfAttributes int
        NumberOfContacts int
        CreatedDate	datetime(6)
        LastModified datetime(6)
        Status longtext
    }

    NamePhonemes {
        Id	int PK
        Theme longtext
        Category longtext
        Position longtext
        Value longtext
    }

    NameAdjectives {
        Id	int PK
        Theme longtext
        Level longtext
        Category longtext
        Value longtext
    }

    NameTitles {
        Id	int PK
        Theme longtext
        Level longtext
        Category longtext
        Value longtext
    }

    L1 {
        Id	int PK
        NodeId int
        Name longtext
        HierarchyId int
    }

    L1Contact {
        Id int PK
        Name longtext
        L1Id int FK
    }

    L2 {
        Id	int PK
        NodeId	int
        Name	longtext
        L1Id	int
    }

    L2Contact {
        Id int PK
        Name longtext
        L2Id int FK
    }

    L3 {
        Id int PK
        NodeId int
        Name longtext
        L2Id int
    }

    L3Contact {
        Id int PK
        Name longtext
        L3Id int FK
    }

    L4 {
        Id int PK
        NodeId int
        Name longtext
        L3Id int
    }

    L4Contact {
        Id int PK
        Name longtext
        L4Id int FK
    }

    L5 {
        Id int PK
        NodeId int
        Name longtext
        L4Id int
    }

    L5Contact {
        Id int PK
        Name longtext
        L5Id int FK
    }

```