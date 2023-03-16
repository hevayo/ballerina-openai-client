Connects to the OpenAI Completions API from Ballerina with `ballerinax/openai.text` package.

## Package Overview
The `ballerinax/openai.text` package is a [Ballerina](https://ballerina.io/) connector for OpenAI's Completions API. The connector provides access to state-of-the-art models for Text generation. By using the `ballerinax/openai.text` package, you can easily integrate OpenAI's advanced AI capabilities into your own Ballerina applications.

|                             | Version         |
|-----------------------------|-----------------|
| OpenAI API                  | 1.2.0           |

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

## Report Issues
To report bugs, request new features, start new discussions, view project boards, etc., visit the [Ballerina Extended Library repository](https://github.com/ballerina-platform/ballerina-extended-library).

## Useful Links
- Discuss code changes of the Ballerina project via [ballerina-dev@googlegroups.com](mailto:ballerina-dev@googlegroups.com).
- Join the Ballerina community on [Discord](https://discord.gg/ballerinalang) to chat with the developers.
- Post technical questions on Stack Overflow with the [#ballerina](https://stackoverflow.com/questions/tagged/ballerina) tag.
