import ballerina/io;
import ballerinax/openai.audio;

configurable string openAIKey = ?;

public function main() returns error? {
    audio:Client audioClient = check new ({
        auth: {
            token: openAIKey
        }
    });

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
