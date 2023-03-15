import ballerina/io;
import ballerinax/openai.images;

configurable string openAIKey = ?;

public function main(string[] arg) returns error? {
    if (arg.length() < 1) {
        io:println("Please provide a message to generate a response, e.g., 'bal run -- \"Generate a new logo for the Ballerina programming language\"'");
        return;
    }
    images:Client imagesClient = check new ({
        auth: {
            token: openAIKey
        }
    });

    images:CreateImageRequest req = {prompt: arg[0]};
    images:ImagesResponse|error unionResult = check imagesClient->/images/generations.post(req);
    if unionResult is images:ImagesResponse {
        io:println(unionResult.data);
    } else {
        io:println(unionResult);
    }
}
