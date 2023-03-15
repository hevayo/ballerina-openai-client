import ballerina/io;
import ballerinax/openai.gpt3;

configurable string openAIKey = ?;

public function main(string[] arg) returns error? {
    if (arg.length() < 1) {
        io:println("Please provide a message to generate a response, e.g., 'bal run -- \"Ballerina is great!\"'");
        return;
    }
    gpt3:Client gpt3Client = check new ({
        auth: {
            token: openAIKey
        }
    });

    gpt3:CreateCompletionRequest req = {
        model: "text-davinci-003",
        prompt: arg[0]
    };
    gpt3:CreateCompletionResponse|error unionResult = check gpt3Client->/completions.post(req);
    if unionResult is gpt3:CreateCompletionResponse {
        io:println(unionResult);
    } else {
        io:println(unionResult);
    }
}
