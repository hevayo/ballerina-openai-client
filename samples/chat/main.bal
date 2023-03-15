import ballerina/io;
import ballerinax/openai.chat;

configurable string openAIKey = ?;

public function main(string[] arg) returns error? {
    if (arg.length() < 1) {
        io:println("Please provide a message to generate a response, e.g., 'bal run -- \"Ballerina is great!\"'");
        return;
    }
    chat:Client chatClient = check new ({
        auth: {
            token: openAIKey
        }
    });

    chat:CreateChatCompletionRequest req = {
        model: "gpt-3.5-turbo",
        messages: [{"role": "user", "content": arg[0]}]
    };
    chat:CreateChatCompletionResponse|error unionResult = check chatClient->/chat/completions.post(req);
    if unionResult is chat:CreateChatCompletionResponse {
        io:println(unionResult);
    } else {
        io:println(unionResult);
    }
}
