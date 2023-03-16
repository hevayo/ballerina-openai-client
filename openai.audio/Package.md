Connects to the OpenAI Audio API from Ballerina with `ballerinax/openai.audio` package.

## Package Overview
The `ballerinax/openai.audio` package is a [Ballerina](https://ballerina.io/) connector for OpenAI's Audio API. The connector provides access to state-of-the-art models for speech-to-text transcription and translation. By using the `ballerinax/openai.audio` package, you can easily integrate OpenAI's advanced AI capabilities into your own Ballerina applications.

|                             | Version         |
|-----------------------------|-----------------|
| OpenAI API                  | 1.2.0           |

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create an [OpenAI Account](https://beta.openai.com/signup/).
* Obtain an API key by following [these instructions](https://platform.openai.com/docs/api-reference/authentication).

## Quickstart

To use the OpenAI Audio connector in your Ballerina application, update the `.bal` file as follows:

### Step 1: Import connector
First, import the `ballerinax/openai.audio` module into the Ballerina project.

```ballerina
import ballerinax/openai.audio;
```

### Step 2: Create a new connector instance
Create and initialize `audio:Client` with the `apiKey` obtained.
```ballerina
    audio:Client audioClient = check new ({
        auth: {
            token: "sk-XXXXXXXXX"
        }
    });
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on transcribing audio using the OpenAI Whisper-1 model:

    Transcribe with Whisper-1

    ```ballerina
    public function main() returns error? {
        audio:CreateTranscriptionRequest req = {
            file: {fileContent: check io:fileReadBytes("sample.mp3"), fileName: "sample.mp3"},
            model: "whisper-1"
        };
        audio:CreateTranscriptionResponse|error unionResult = check audioClient->/audio/transcriptions.post(req);
        if unionResult is audio:CreateTranscriptionResponse {
            io:println(unionResult.text);
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
