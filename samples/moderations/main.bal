import ballerina/io;
import ballerinax/openai.moderations;

configurable string openAIKey = ?;

public function main(string[] arg) returns error? {
    if (arg.length() < 1) {
        io:println("Please provide an input to generate a moderation response, e.g., 'bal run -- \"You are dumb!\"'");
        return;
    }
    moderations:Client moderationClient = check new ({
        auth: {
            token: openAIKey
        }
    });

    moderations:CreateModerationRequest req = {input: arg[0]};
    moderations:CreateModerationResponse|error unionResult = check moderationClient->/moderations.post(req);
    if unionResult is moderations:CreateModerationResponse {
        io:println(unionResult.results);
    } else {
        io:println(unionResult);
    }
}
