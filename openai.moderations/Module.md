This is a generated connector for [OpenAI Moderations API](https://beta.openai.com/docs/api-reference/moderations) OpenAPI Specification. OpenAI is an American artificial intelligence research laboratory consisting of a non-profit corporation and a for-profit subsidiary. OpenAI conducts AI research with the declared intention of promoting and developing friendly AI. The OpenAI Moderations API provides a way to access new moderations models developed by OpenAI for content moderation tasks.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create an [OpenAI Account](https://beta.openai.com/signup/).
* Obtain an API key by following [these instructions](https://platform.openai.com/docs/api-reference/authentication).

## Quickstart

To use the OpenAI Moderations connector in your Ballerina application, update the `.bal` file as follows:

### Step 1: Import connector
First, import the `ballerinax/openai.moderations` module into the Ballerina project.

```ballerina
import ballerinax/openai.moderations;
```

### Step 2: Create a new connector instance
Create and initialize `moderations:Client` with the `apiKey` obtained.```ballerina
    moderations:Client moderationsClient = check new ({
        auth: {
            token: "sk-XXXXXXXXX"
        }
    });
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on identifying harmful content using the OpenAI moderations model:

    Moderate with Text Moderation model

    ```ballerina
    public function main() returns error? {
        moderations:CreateModerationRequest createModerationRequest = {
            input: "I want to kill them.",
            model: "text-moderation-stable"
        };

        moderations:CreateModerationResponse|error unionResult = check moderationsClient->/moderations.post(createModerationRequest);

        if unionResult is moderations:CreateModerationResponse {
            io:println(unionResult);
        } else {
            io:println(unionResult);
        }
    }
    ``` 
2. Use `bal run` command to compile and run the Ballerina program.