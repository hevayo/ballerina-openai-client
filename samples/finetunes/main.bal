import ballerina/io;
import ballerinax/openai.finetunes;

configurable string openAIKey = ?;

public function main() returns error? {

    finetunes:Client fineTuneClient = check new ({
        auth: {
            token: openAIKey
        }
    });

    finetunes:CreateFileRequest req = {
        file: {fileContent: check io:fileReadBytes("sample.jsonl"), fileName: "sample.jsonl"},
        purpose: "fine-tune"
    };
    finetunes:OpenAIFile|error unionResult = check fineTuneClient->/files.post(req);
    if unionResult is finetunes:OpenAIFile {
        io:println(unionResult);
    } else {
        io:println(unionResult);
    }
}
