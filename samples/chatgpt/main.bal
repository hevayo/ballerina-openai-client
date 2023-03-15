import ballerina/io;
import ballerinax/openai.chatgpt;

configurable string openAIKey = ?;

public function main(string[] arg) returns error? {
    if (arg.length() < 1) {
        io:println("Please provide a message to generate a response, e.g., 'bal run -- \"Ballerina is great!\"'");
        return;
    }
    chatgpt:Client chatgptClient = check new ({
        auth: {
            token: openAIKey
        }
    });

    chatgpt:CreateChatCompletionRequest req = {
        model: "gpt-3.5-turbo",
        messages: [{"role": "user", "content": arg[0]}]
    };
    chatgpt:CreateChatCompletionResponse|error unionResult = check chatgptClient->/chat/completions.post(req);
    if unionResult is chatgpt:CreateChatCompletionResponse {
        io:println(unionResult);
    } else {
        io:println(unionResult);
    }
}
