import ballerina/io;
import ballerinax/openai.text;

configurable string openAIKey = ?;

public function main(string[] arg) returns error? {
    if (arg.length() < 1) {
        io:println("Please provide a message to generate a response, e.g., 'bal run -- \"Ballerina is great!\"'");
        return;
    }
    text:Client textClient = check new ({
        auth: {
            token: openAIKey
        }
    });

    text:CreateCompletionRequest req = {
        model: "text-davinci-003",
        prompt: arg[0]
    };
    text:CreateCompletionResponse|error unionResult = check textClient->/completions.post(req);
    if unionResult is text:CreateCompletionResponse {
        io:println(unionResult);
    } else {
        io:println(unionResult);
    }
}
