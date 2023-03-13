import ballerina/http;
import ballerina/mime;

# APIs for sampling from and fine-tuning language models
public isolated client class OpenAIClient {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    #
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ConnectionConfig config = {}, string serviceUrl = "https://api.openai.com/v1") returns error? {
        http:ClientConfiguration httpClientConfig = {httpVersion: config.httpVersion, timeout: config.timeout, forwarded: config.forwarded, poolConfig: config.poolConfig, compression: config.compression, circuitBreaker: config.circuitBreaker, retryConfig: config.retryConfig, validation: config.validation};
        do {
            if config.http1Settings is ClientHttp1Settings {
                ClientHttp1Settings settings = check config.http1Settings.ensureType(ClientHttp1Settings);
                httpClientConfig.http1Settings = {...settings};
            }
            if config.http2Settings is http:ClientHttp2Settings {
                httpClientConfig.http2Settings = check config.http2Settings.ensureType(http:ClientHttp2Settings);
            }
            if config.cache is http:CacheConfig {
                httpClientConfig.cache = check config.cache.ensureType(http:CacheConfig);
            }
            if config.responseLimits is http:ResponseLimitConfigs {
                httpClientConfig.responseLimits = check config.responseLimits.ensureType(http:ResponseLimitConfigs);
            }
            if config.secureSocket is http:ClientSecureSocket {
                httpClientConfig.secureSocket = check config.secureSocket.ensureType(http:ClientSecureSocket);
            }
            if config.proxy is http:ProxyConfig {
                httpClientConfig.proxy = check config.proxy.ensureType(http:ProxyConfig);
            }
            if config.auth is http:ClientAuthConfig {
                httpClientConfig.auth = check config.auth.ensureType(http:ClientAuthConfig);
            }
        }
        http:Client httpEp = check new (serviceUrl, httpClientConfig);
        self.clientEp = httpEp;
        return;
    }
    # Lists the currently available (non-finetuned) models, and provides basic information about each one such as the owner and availability.
    #
    # + return - OK 
    #
    # # Deprecated
    @deprecated
    resource isolated function get engines() returns ListEnginesResponse|error {
        string resourcePath = string `/engines`;
        ListEnginesResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves a model instance, providing basic information about it such as the owner and availability.
    #
    # + engine_id - The ID of the engine to use for this request 
    # + return - OK 
    #
    # # Deprecated
    @deprecated
    resource isolated function get engines/[string engine_id]() returns Engine|error {
        string resourcePath = string `/engines/${getEncodedUri(engine_id)}`;
        Engine response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates a completion for the provided prompt and parameters
    #
    # + return - OK 
    resource isolated function post completions(CreateCompletionRequest payload) returns CreateCompletionResponse|error {
        string resourcePath = string `/completions`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CreateCompletionResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Creates a completion for the chat message
    #
    # + return - OK 
    resource isolated function post chat/completions(CreateChatCompletionRequest payload) returns CreateChatCompletionResponse|error {
        string resourcePath = string `/chat/completions`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CreateChatCompletionResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Creates a new edit for the provided input, instruction, and parameters.
    #
    # + return - OK 
    resource isolated function post edits(CreateEditRequest payload) returns CreateEditResponse|error {
        string resourcePath = string `/edits`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CreateEditResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Creates an image given a prompt.
    #
    # + return - OK 
    resource isolated function post images/generations(CreateImageRequest payload) returns ImagesResponse|error {
        string resourcePath = string `/images/generations`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ImagesResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Creates an edited or extended image given an original image and a prompt.
    #
    # + return - OK 
    resource isolated function post images/edits(CreateImageEditRequest payload) returns ImagesResponse|error {
        string resourcePath = string `/images/edits`;
        http:Request request = new;
        // mime:Entity[] bodyParts = check createBodyParts(payload);
        mime:Entity[] bodyParts = check createBodyPartsMultipart(payload);

        request.setBodyParts(bodyParts);
        ImagesResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Creates a variation of a given image.
    #
    # + return - OK 
    resource isolated function post images/variations(CreateImageVariationRequest payload) returns ImagesResponse|error {
        string resourcePath = string `/images/variations`;
        http:Request request = new;
        mime:Entity[] bodyParts = check createBodyPartsMultipart(payload);
        request.setBodyParts(bodyParts);
        ImagesResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Creates an embedding vector representing the input text.
    #
    # + return - OK 
    resource isolated function post embeddings(CreateEmbeddingRequest payload) returns CreateEmbeddingResponse|error {
        string resourcePath = string `/embeddings`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CreateEmbeddingResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Transcribes audio into the input language.
    #
    # + return - OK 
    resource isolated function post audio/transcriptions(CreateTranscriptionRequest payload) returns CreateTranscriptionResponse|error {
        string resourcePath = string `/audio/transcriptions`;
        http:Request request = new;
        mime:Entity[] bodyParts = check createBodyPartsMultipart(payload);
        request.setBodyParts(bodyParts);
        CreateTranscriptionResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Translates audio into into English.
    #
    # + return - OK 
    resource isolated function post audio/translations(CreateTranslationRequest payload) returns CreateTranslationResponse|error {
        string resourcePath = string `/audio/translations`;
        http:Request request = new;
        mime:Entity[] bodyParts = check createBodyPartsMultipart(payload);
        request.setBodyParts(bodyParts);
        CreateTranslationResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # The search endpoint computes similarity scores between provided query and documents. Documents can be passed directly to the API if there are no more than 200 of them.
    #
    # To go beyond the 200 document limit, documents can be processed offline and then used for efficient retrieval at query time. When `file` is set, the search endpoint searches over all the documents in the given file and returns up to the `max_rerank` number of documents. These documents will be returned along with their search scores.
    #
    # The similarity score is a positive score that usually ranges from 0 to 300 (but can sometimes go higher), where a score above 200 usually means the document is semantically similar to the query.
    #
    # + engine_id - The ID of the engine to use for this request.  You can select one of `ada`, `babbage`, `curie`, or `davinci`. 
    # + return - OK 
    #
    # # Deprecated
    @deprecated
    resource isolated function post engines/[string engine_id]/search(CreateSearchRequest payload) returns CreateSearchResponse|error {
        string resourcePath = string `/engines/${getEncodedUri(engine_id)}/search`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CreateSearchResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Returns a list of files that belong to the user's organization.
    #
    # + return - OK 
    resource isolated function get files() returns ListFilesResponse|error {
        string resourcePath = string `/files`;
        ListFilesResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Upload a file that contains document(s) to be used across various endpoints/features. Currently, the size of all the files uploaded by one organization can be up to 1 GB. Please contact us if you need to increase the storage limit.
    #
    # + return - OK 
    resource isolated function post files(CreateFileRequest payload) returns json|error {
        string resourcePath = string `/files`;
        http:Request request = new;
        mime:Entity[] bodyParts = check createBodyPartsMultipart(payload);
        request.setBodyParts(bodyParts);
        json response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Returns information about a specific file.
    #
    # + file_id - The ID of the file to use for this request 
    # + return - OK 
    resource isolated function get files/[string file_id]() returns OpenAIFile|error {
        string resourcePath = string `/files/${getEncodedUri(file_id)}`;
        OpenAIFile response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete a file.
    #
    # + file_id - The ID of the file to use for this request 
    # + return - OK 
    resource isolated function delete files/[string file_id]() returns DeleteFileResponse|error {
        string resourcePath = string `/files/${getEncodedUri(file_id)}`;
        DeleteFileResponse response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Returns the contents of the specified file
    #
    # + file_id - The ID of the file to use for this request 
    # + return - OK 
    resource isolated function get files/[string file_id]/content() returns string|error {
        string resourcePath = string `/files/${getEncodedUri(file_id)}/content`;
        string response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Answers the specified question using the provided documents and examples.
    #
    # The endpoint first [searches](/docs/api-reference/searches) over provided documents or files to find relevant context. The relevant context is combined with the provided examples and question to create the prompt for [completion](/docs/api-reference/completions).
    #
    # + return - OK 
    #
    # # Deprecated
    @deprecated
    resource isolated function post answers(CreateAnswerRequest payload) returns CreateAnswerResponse|error {
        string resourcePath = string `/answers`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CreateAnswerResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Classifies the specified `query` using provided examples.
    #
    # The endpoint first [searches](/docs/api-reference/searches) over the labeled examples
    # to select the ones most relevant for the particular query. Then, the relevant examples
    # are combined with the query to construct a prompt to produce the final label via the
    # [completions](/docs/api-reference/completions) endpoint.
    #
    # Labeled examples can be provided via an uploaded `file`, or explicitly listed in the
    # request using the `examples` parameter for quick tests and small scale use cases.
    #
    # + return - OK 
    #
    # # Deprecated
    @deprecated
    resource isolated function post classifications(CreateClassificationRequest payload) returns CreateClassificationResponse|error {
        string resourcePath = string `/classifications`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CreateClassificationResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # List your organization's fine-tuning jobs
    #
    # + return - OK 
    resource isolated function get 'fine\-tunes() returns ListFineTunesResponse|error {
        string resourcePath = string `/fine-tunes`;
        ListFineTunesResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates a job that fine-tunes a specified model from a given dataset.
    #
    # Response includes details of the enqueued job including job status and the name of the fine-tuned models once complete.
    #
    # [Learn more about Fine-tuning](/docs/guides/fine-tuning)
    #
    # + return - OK 
    resource isolated function post 'fine\-tunes(CreateFineTuneRequest payload) returns FineTune|error {
        string resourcePath = string `/fine-tunes`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        FineTune response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Gets info about the fine-tune job.
    #
    # [Learn more about Fine-tuning](/docs/guides/fine-tuning)
    #
    # + fine_tune_id - The ID of the fine-tune job 
    # + return - OK 
    resource isolated function get 'fine\-tunes/[string fine_tune_id]() returns FineTune|error {
        string resourcePath = string `/fine-tunes/${getEncodedUri(fine_tune_id)}`;
        FineTune response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Immediately cancel a fine-tune job.
    #
    # + fine_tune_id - The ID of the fine-tune job to cancel 
    # + return - OK 
    resource isolated function post 'fine\-tunes/[string fine_tune_id]/cancel() returns FineTune|error {
        string resourcePath = string `/fine-tunes/${getEncodedUri(fine_tune_id)}/cancel`;
        http:Request request = new;
        //TODO: Update the request as needed;
        FineTune response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get fine-grained status updates for a fine-tune job.
    #
    # + fine_tune_id - The ID of the fine-tune job to get events for. 
    # + 'stream - Whether to stream events for the fine-tune job. If set to true, events will be sent as data-only [server-sent events](https://developer.mozilla.org/en-US/docs/Web/API/Server-sent_events/Using_server-sent_events#Event_stream_format) as they become available. The stream will terminate with a `data: [DONE]` message when the job is finished (succeeded, cancelled, or failed). If set to false, only events generated so far will be returned. 
    # + return - OK 
    resource isolated function get 'fine\-tunes/[string fine_tune_id]/events(boolean 'stream = false) returns ListFineTuneEventsResponse|error {
        string resourcePath = string `/fine-tunes/${getEncodedUri(fine_tune_id)}/events`;
        map<anydata> queryParam = {"stream": 'stream};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ListFineTuneEventsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Lists the currently available models, and provides basic information about each one such as the owner and availability.
    #
    # + return - OK 
    resource isolated function get models() returns ListModelsResponse|error {
        string resourcePath = string `/models`;
        ListModelsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves a model instance, providing basic information about the model such as the owner and permissioning.
    #
    # + model - The ID of the model to use for this request 
    # + return - OK 
    resource isolated function get models/[string model]() returns Model|error {
        string resourcePath = string `/models/${getEncodedUri(model)}`;
        Model response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete a fine-tuned model. You must have the Owner role in your organization.
    #
    # + model - The model to delete 
    # + return - OK 
    resource isolated function delete models/[string model]() returns DeleteModelResponse|error {
        string resourcePath = string `/models/${getEncodedUri(model)}`;
        DeleteModelResponse response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Classifies if text violates OpenAI's Content Policy
    #
    # + return - OK 
    resource isolated function post moderations(CreateModerationRequest payload) returns CreateModerationResponse|error {
        string resourcePath = string `/moderations`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CreateModerationResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
}
