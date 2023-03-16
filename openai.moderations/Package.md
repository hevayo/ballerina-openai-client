Connects to the OpenAI Moderations API from Ballerina with `ballerinax/openai.moderations` package.

## Package Overview
The `ballerinax/openai.moderations` package is a [Ballerina](https://ballerina.io/) connector for OpenAI's Moderations API. The connector provides access to state-of-the-art models for Text moderation. By using the `ballerinax/openai.moderations` package, you can easily integrate OpenAI's advanced AI capabilities into your own Ballerina applications.

|                             | Version         |
|-----------------------------|-----------------|
| OpenAI API                  | 1.2.0           |

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
import ballerina/io;
```

### Step 2: Create a new connector instance
Create and initialize `moderations:Client` with the `apiKey` obtained.
```ballerina
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

## Sample
import ballerinax/openai.moderations;
import ballerina/io;

moderations:Client moderationsClient = check new ({
    auth: {
        token: "sk-XXXXXXXXX"
    }
});

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

## Report Issues
To report bugs, request new features, start new discussions, view project boards, etc., visit the [Ballerina Extended Library repository](https://github.com/ballerina-platform/ballerina-extended-library).

## Useful Links
- Discuss code changes of the Ballerina project via [ballerina-dev@googlegroups.com](mailto:ballerina-dev@googlegroups.com).
- Join the Ballerina community on [Discord](https://discord.gg/ballerinalang) to chat with the developers.
- Post technical questions on Stack Overflow with the [#ballerina](https://stackoverflow.com/questions/tagged/ballerina) tag.
