import ballerina/io;
import ballerinax/openai;

configurable string openAIKey = ?;

public function main(string[] arg) returns error? {
    if (arg.length() < 1) {
        io:println("Please provide a message to generate a response, e.g., 'bal run \"Ballerina is great!\"'");
        return;
    }
    openai:OpenAIClient openaiClient = check new ({
        auth: {
            token: openAIKey
        }
    });
    openai:CreateChatCompletionRequest createChatCompletionRequest = {
        model: "gpt-3.5-turbo",
        messages: [{"role": "user", "content": arg[0]}]
    };
    openai:CreateChatCompletionResponse|error unionResult = check openaiClient->/chat/completions.post(createChatCompletionRequest);
    if unionResult is openai:CreateChatCompletionResponse {
        io:println(unionResult);
    } else {
        io:println(unionResult);
    }

}
