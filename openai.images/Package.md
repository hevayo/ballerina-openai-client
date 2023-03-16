Connects to the OpenAI Images API from Ballerina with `ballerinax/openai.images` package.

## Package Overview
The `ballerinax/openai.images` package is a [Ballerina](https://ballerina.io/) connector for OpenAI's Images API. The connector provides access to state-of-the-art models for Image generation. By using the `ballerinax/openai.images` package, you can easily integrate OpenAI's advanced AI capabilities into your own Ballerina applications.

|                             | Version         |
|-----------------------------|-----------------|
| OpenAI API                  | 1.2.0           |

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create an [OpenAI Account](https://beta.openai.com/signup/).
* Obtain an API key by following [these instructions](https://platform.openai.com/docs/api-reference/authentication).

## Quickstart

To use the OpenAI Images connector in your Ballerina application, update the `.bal` file as follows:

### Step 1: Import connector
First, import the `ballerinax/openai.images` module into the Ballerina project.

```ballerina
import ballerinax/openai.images;
```

### Step 2: Create a new connector instance
Create and initialize `images:Client` with the `apiKey` obtained.
```ballerina
    images:Client imagesClient = check new ({
        auth: {
            token: "sk-XXXXXXXXX"
        }
    });
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on generating image using the OpenAI DALL.E model:

    Generate image with DALL.E

    ```ballerina
    public function main() returns error? {
        images:CreateImageRequest createImageRequest = {
            prompt: "A cute baby sea otter",
            n: 1,
            size: "256x256",
            response_format: "url",
            user: "user-1234"
        };
        images:ImagesResponse|error unionResult = check imagesClient->/images/generations.post(createImageRequest);
        if unionResult is images:ImagesResponse {
            io:println(unionResult);
        } else {
            io:println(unionResult);
        }
    }
    ``` 
2. Use `bal run` command to compile and run the Ballerina program.

## Report Issues
To report bugs, request new features, start new discussions, view project boards, etc., visit the [Ballerina Extended Library repository](https://github.com/ballerina-platform/ballerina-extended-library).

## Useful Links
- Discuss code changes of the Ballerina project via [ballerina-dev@googlegroups.com](mailto:ballerina-dev@googlegroups.com).
- Join the Ballerina community on [Discord](https://discord.gg/ballerinalang) to chat with the developers.
- Post technical questions on Stack Overflow with the [#ballerina](https://stackoverflow.com/questions/tagged/ballerina) tag.
