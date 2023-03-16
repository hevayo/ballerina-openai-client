This is a generated connector for [OpenAI Embeddings API](https://beta.openai.com/docs/api-reference/embeddings) OpenAPI Specification. OpenAI is an American artificial intelligence research laboratory consisting of a non-profit corporation and a for-profit subsidiary. OpenAI conducts AI research with the declared intention of promoting and developing friendly AI. The OpenAI Embeddings API provides a way to access embeddings from new AI models developed by OpenAI for a variety of tasks.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create an [OpenAI Account](https://beta.openai.com/signup/).
* Obtain an API key by following [these instructions](https://platform.openai.com/docs/api-reference/authentication).

## Quickstart

To use the OpenAI Embeddings connector in your Ballerina application, update the `.bal` file as follows:

### Step 1: Import connector
First, import the `ballerinax/openai.embeddings` module into the Ballerina project.

```ballerina
import ballerinax/openai.embeddings;
```

### Step 2: Create a new connector instance
Create and initialize `embeddings:Client` with the `apiKey` obtained.```ballerina
    embeddings:Client embeddingsClient = check new ({
        auth: {
            token: "sk-XXXXXXXXX"
        }
    });
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on obtaining embeddings from GPT-3 ada model:

    Obtain embeddings from ada model

    ```ballerina
    public function main() returns error? {
        embeddings:CreateEmbeddingRequest createEmbeddingRequest = {
            model: "text-embedding-ada-002",
            input: "I have bought several of the Vitality canned"
        };
        embeddings:CreateEmbeddingResponse|error unionResult = check embeddingsClient->/embeddings.post(createEmbeddingRequest);
        if unionResult is embeddings:CreateEmbeddingResponse {
            io:println(unionResult);
        } else {
            io:println(unionResult);
        }
    }
    ``` 
2. Use `bal run` command to compile and run the Ballerina program.