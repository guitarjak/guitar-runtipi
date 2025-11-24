# Blinko: AI-Powered Card Note-Taking

Blinko is an open-source, self-hosted personal AI note tool that prioritizes privacy and data ownership. It is designed for individuals who want to quickly capture and organize their fleeting thoughts.

## Features

*   **AI-Enhanced Note Retrieval (RAG):** Quickly search and access your notes using natural language queries.
*   **Data Ownership:** All your notes and data are stored securely in your self-hosted environment.
*   **Efficient and Fast:** Capture ideas instantly with full Markdown support.
*   **Self-Hosted:** Deploy easily using Docker.

## Configuration

This app requires two environment variables to be set during installation:

1.  **NextAuth Secret:** A strong, random string for security.
2.  **Postgres Password:** The password for the internal database.

**Note:** The application is exposed on port 1111 internally. Runtipi will handle the external port mapping.
