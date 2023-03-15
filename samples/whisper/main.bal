import ballerina/io;
import ballerinax/openai.whisper;

configurable string openAIKey = ?;

public function main() returns error? {
    whisper:Client whisperClient = check new ({
        auth: {
            token: openAIKey
        }
    });

    whisper:CreateTranscriptionRequest req = {
        file: {fileContent: check io:fileReadBytes("sample.mp3"), fileName: "sample.mp3"},
        model: "whisper-1"
    };
    whisper:CreateTranscriptionResponse|error unionResult = check whisperClient->/audio/transcriptions.post(req);
    if unionResult is whisper:CreateTranscriptionResponse {
        io:println(unionResult.text);
    } else {
        io:println(unionResult);
    }
}
