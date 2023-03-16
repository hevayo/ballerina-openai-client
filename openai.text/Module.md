This is a generated connector for [OpenAI Completions API](https://beta.openai.com/docs/api-reference/completions) OpenAPI Specification. OpenAI is an American artificial intelligence research laboratory consisting of a non-profit corporation and a for-profit subsidiary. OpenAI conducts AI research with the declared intention of promoting and developing friendly AI. The OpenAI Completions API provides a way to access new Text AI models developed by OpenAI for a variety of tasks.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create an [OpenAI Account](https://beta.openai.com/signup/).
* Obtain an API key by following [these instructions](https://platform.openai.com/docs/api-reference/authentication).

## Quickstart

To use the OpenAI Text connector in your Ballerina application, update the `.bal` file as follows:

### Step 1: Import connector
First, import the `ballerinax/openai.text` module into the Ballerina project.

```ballerina
import ballerinax/openai.text;
import ballerina/io;
```

### Step 2: Create a new connector instance
Create and initialize `text:Client` with the `apiKey` obtained.
```ballerina
    text:Client textClient = check new ({
        auth: {
            token: "sk-XXXXXXXXX"
        }
    });
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on text completion using the OpenAI Davinci model:

    Geenrate text with Davinci

    ```ballerina
    public function main() returns error? {
        text:CreateCompletionRequest createCompletionRequest = {
            model: "text-davinci-002",
            prompt: "What is Ballerina?"
        };
        text:CreateCompletionResponse|error unionResult = check textClient->/completions.post(createCompletionRequest);
        if unionResult is text:CreateCompletionResponse {
            io:println(unionResult);
        } else {
            io:println(unionResult);
        }
    }
    ``` 
2. Use `bal run` command to compile and run the Ballerina program.

## Sample
import ballerinax/openai.text;
import ballerina/io;

text:Client textClient = check new ({
    auth: {
        token: "sk-XXXXXXXXX"
    }
});

public function main() returns error? {
    text:CreateCompletionRequest createCompletionRequest = {
        model: "text-davinci-002",
        prompt: "What is Ballerina?"
    };
    text:CreateCompletionResponse|error unionResult = check textClient->/completions.post(createCompletionRequest);
    if unionResult is text:CreateCompletionResponse {
        io:println(unionResult);
    } else {
        io:println(unionResult);
    }
}
```