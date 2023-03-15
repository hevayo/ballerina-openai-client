import ballerina/io;
import ballerinax/openai.fine_tune;

configurable string openAIKey = ?;

public function main() returns error? {

    fine_tune:Client fineTuneClient = check new ({
        auth: {
            token: openAIKey
        }
    });

    fine_tune:CreateFileRequest req = {
        file: {fileContent: check io:fileReadBytes("sample.jsonl"), fileName: "sample.jsonl"},
        purpose: "fine-tune"
    };
    fine_tune:OpenAIFile|error unionResult = check fineTuneClient->/files.post(req);
    if unionResult is fine_tune:OpenAIFile {
        io:println(unionResult);
    } else {
        io:println(unionResult);
    }
}
