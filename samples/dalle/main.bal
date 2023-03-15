import ballerina/io;
import ballerinax/openai.dalle;

configurable string openAIKey = ?;

public function main(string[] arg) returns error? {
    if (arg.length() < 1) {
        io:println("Please provide a message to generate a response, e.g., 'bal run -- \"Generate a new logo for the Ballerina programming language\"'");
        return;
    }
    dalle:Client dalleClient = check new ({
        auth: {
            token: openAIKey
        }
    });

    dalle:CreateImageRequest req = {prompt: arg[0]};
    dalle:ImagesResponse|error unionResult = check dalleClient->/images/generations.post(req);
    if unionResult is dalle:ImagesResponse {
        io:println(unionResult.data);
    } else {
        io:println(unionResult);
    }
}
