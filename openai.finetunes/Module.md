This is a generated connector for [OpenAI Fine-tunes API](https://beta.openai.com/docs/api-reference/fine-tunes) OpenAPI Specification. OpenAI is an American artificial intelligence research laboratory consisting of a non-profit corporation and a for-profit subsidiary. OpenAI conducts AI research with the declared intention of promoting and developing friendly AI. The OpenAI Fine-tunes API provides a way to customize new AI models developed by OpenAI for your specific needs.

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