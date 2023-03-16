Connects to the OpenAI Fine-tunes API from Ballerina with `ballerinax/openai.finetunes` package.

## Package Overview
The `ballerinax/openai.finetunes` package is a [Ballerina](https://ballerina.io/) connector for OpenAI's Fine-tunes API. The connector provides access to fine tuning state-of-the-art models. By using the `ballerinax/openai.finetunes` package, you can easily integrate OpenAI's advanced AI capabilities into your own Ballerina applications.

|                             | Version         |
|-----------------------------|-----------------|
| OpenAI API                  | 1.2.0           |

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create an [OpenAI Account](https://beta.openai.com/signup/).
* Obtain an API key by following [these instructions](https://platform.openai.com/docs/api-reference/authentication).

## Quickstart

To use the OpenAI Fine-tunes connector in your Ballerina application, update the `.bal` file as follows:

### Step 1: Import connector
First, import the `ballerinax/openai.finetunes` module into the Ballerina project.

```ballerina
import ballerinax/openai.finetunes;
import ballerina/io;
```

### Step 2: Create a new connector instance
Create and initialize `finetunes:Client` with the `apiKey` obtained.
```ballerina
    finetunes:Client finetunesClient = check new ({
        auth: {
            token: "sk-XXXXXXXXX"
        }
    });
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on fine tuning the GPT-3 ada model:

    Fine tune ada model

    ```ballerina
    public function main() returns error? {
        finetunes:CreateFileRequest req = {
            file: {fileContent: check io:fileReadBytes("sample.jsonl"), fileName: "sample.jsonl"},
            purpose: "fine-tune"
        };
        finetunes:OpenAIFile|error fineTuneResult = check finetunesClient->/files.post(req);
        if fineTuneResult is finetunes:OpenAIFile {
            string fileID = fineTuneResult.id;

            finetunes:CreateFineTuneRequest createFineTuneRequest = {
                model: "ada",
                training_file: fileId
            };

            finetunes:FineTune|error unionResult = check finetunesClient->/fine\-tunes.post(createFineTuneRequest);

            if unionResult is finetunes:FineTune {
                io:println(unionResult.id);
            } else {
                io:println(unionResult);
            }
        } else {
            io:println(fineTuneResult);
        }
    }
    ``` 
2. Use `bal run` command to compile and run the Ballerina program.

## Sample
import ballerinax/openai.finetunes;
import ballerina/io;

finetunes:Client finetunesClient = check new ({
    auth: {
        token: "sk-XXXXXXXXX"
    }
});

public function main() returns error? {
    finetunes:CreateFileRequest req = {
        file: {fileContent: check io:fileReadBytes("sample.jsonl"), fileName: "sample.jsonl"},
        purpose: "fine-tune"
    };
    finetunes:OpenAIFile|error fineTuneResult = check finetunesClient->/files.post(req);
    if fineTuneResult is finetunes:OpenAIFile {
        string fileID = fineTuneResult.id;

        finetunes:CreateFineTuneRequest createFineTuneRequest = {
            model: "ada",
            training_file: fileId
        };

        finetunes:FineTune|error unionResult = check finetunesClient->/fine\-tunes.post(createFineTuneRequest);

        if unionResult is finetunes:FineTune {
            io:println(unionResult.id);
        } else {
            io:println(unionResult);
        }
    } else {
        io:println(fineTuneResult);
    }
}
```

## Report Issues
To report bugs, request new features, start new discussions, view project boards, etc., visit the [Ballerina Extended Library repository](https://github.com/ballerina-platform/ballerina-extended-library).

## Useful Links
- Discuss code changes of the Ballerina project via [ballerina-dev@googlegroups.com](mailto:ballerina-dev@googlegroups.com).
- Join the Ballerina community on [Discord](https://discord.gg/ballerinalang) to chat with the developers.
- Post technical questions on Stack Overflow with the [#ballerina](https://stackoverflow.com/questions/tagged/ballerina) tag.
