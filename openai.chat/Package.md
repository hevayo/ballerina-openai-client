Connects to the OpenAI Chat API from Ballerina with the `ballerinax/openai.chat` package.

## Package overview
The `ballerinax/openai.chat` package is a [Ballerina](https://ballerina.io/) connector for OpenAI's Chat API. The connector provides access to state-of-the-art models for Chat. By using the `ballerinax/openai.chat` package, you can easily integrate OpenAI's advanced AI capabilities into your own Ballerina applications.

|                             | Version         |
|-----------------------------|-----------------|
| OpenAI API                  | 1.2.0           |

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create an [OpenAI account](https://beta.openai.com/signup/).
* Obtain an API key by following [these instructions](https://platform.openai.com/docs/api-reference/authentication).

## Quick start

To use the OpenAI Chat connector in your Ballerina application, update the `.bal` file as follows:

### Step 1: Import the connector
First, import the `ballerinax/openai.chat` module into the Ballerina project.

```ballerina
import ballerinax/openai.chat;
import ballerina/io;
```

### Step 2: Create a new connector instance
Create and initialize a `chat:Client` with the obtained `apiKey`.
```ballerina
    chat:Client chatClient = check new ({
        auth: {
            token: "sk-XXXXXXXXX"
        }
    });
```

### Step 3: Invoke the connector operation
1. Now, you can use the operations available within the connector. 

>**Note:** These operations are in the form of remote operations.

    Following is an example on creating a conversation with the GPT-3.5 model:

    Conversation with GPT-3.5-turbo

    ```ballerina
    public function main() returns error? {
        chat:CreateChatCompletionRequest req = {
            model: "gpt-3.5-turbo",
            messages: [{"role": "user", "content": "What is Ballerina?"}]
        };
        chat:CreateChatCompletionResponse|error unionResult = check chatClient->/chat/completions.post(req);
        if unionResult is chat:CreateChatCompletionResponse {
            io:println(unionResult);
        } else {
            io:println(unionResult);
        }
    }
    ``` 
2. Use the `bal run` command to compile and run the Ballerina program.

## Sample

```ballerina
import ballerinax/openai.chat;
import ballerina/io;

chat:Client chatClient = check new ({
    auth: {
        token: "sk-XXXXXXXXX"
    }
});

public function main(string[] arg) returns error? {
    chat:CreateChatCompletionRequest req = {
        model: "gpt-3.5-turbo",
        messages: [{"role": "user", "content": "What is Ballerina?"}]
    };
    chat:CreateChatCompletionResponse|error unionResult = check chatClient->/chat/completions.post(req);
    if unionResult is chat:CreateChatCompletionResponse {
        io:println(unionResult);
    } else {
        io:println(unionResult);
    }
}
```

## Report issues
To report bugs, request new features, start new discussions, view project boards, etc., visit the [Ballerina Extended Library repository](https://github.com/ballerina-platform/ballerina-extended-library).

## Useful links
- Discuss code changes of the Ballerina project via [ballerina-dev@googlegroups.com](mailto:ballerina-dev@googlegroups.com).
- Join the Ballerina community on [Discord](https://discord.gg/ballerinalang) to chat with the developers.
- Post technical questions on Stack Overflow with the [#ballerina](https://stackoverflow.com/questions/tagged/ballerina) tag.
