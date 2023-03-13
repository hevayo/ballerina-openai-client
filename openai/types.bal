import ballerina/http;
import ballerina/constraint;

# Provides a set of configurations for controlling the behaviours when communicating with a remote HTTP endpoint.
@display {label: "Connection Config"}
public type ConnectionConfig record {|
    # The HTTP version understood by the client
    http:HttpVersion httpVersion = http:HTTP_2_0;
    # Configurations related to HTTP/1.x protocol
    ClientHttp1Settings http1Settings?;
    # Configurations related to HTTP/2 protocol
    http:ClientHttp2Settings http2Settings?;
    # The maximum time to wait (in seconds) for a response before closing the connection
    decimal timeout = 60;
    # The choice of setting `forwarded`/`x-forwarded` header
    string forwarded = "disable";
    # Configurations associated with request pooling
    http:PoolConfiguration poolConfig?;
    # HTTP caching related configurations
    http:CacheConfig cache?;
    # Specifies the way of handling compression (`accept-encoding`) header
    http:Compression compression = http:COMPRESSION_AUTO;
    # Configurations associated with the behaviour of the Circuit Breaker
    http:CircuitBreakerConfig circuitBreaker?;
    # Configurations associated with retrying
    http:RetryConfig retryConfig?;
    # Configurations associated with inbound response size limits
    http:ResponseLimitConfigs responseLimits?;
    # SSL/TLS-related options
    http:ClientSecureSocket secureSocket?;
    # Proxy server related options
    http:ProxyConfig proxy?;
    # Enables the inbound payload validation functionality which provided by the constraint package. Enabled by default
    boolean validation = true;
    # Pass in Authentication related configurations
    http:ClientAuthConfig? auth = ();
|};

# Provides settings related to HTTP/1.x protocol.
public type ClientHttp1Settings record {|
    # Specifies whether to reuse a connection for multiple requests
    http:KeepAlive keepAlive = http:KEEPALIVE_AUTO;
    # The chunking behaviour of the request
    http:Chunking chunking = http:CHUNKING_AUTO;
    # Proxy server related options
    ProxyConfig proxy?;
|};

# Proxy server configurations to be used with the HTTP client endpoint.
public type ProxyConfig record {|
    # Host name of the proxy server
    string host = "";
    # Proxy server port
    int port = 0;
    # Proxy server username
    string userName = "";
    # Proxy server password
    @display {label: "", kind: "password"}
    string password = "";
|};

@constraint:Array {minLength: 1}
public type InputItemsArray int[];

public type CreateTranscriptionResponse record {|
    string text;
|};

public type CreateCompletionResponse_choices record {|
    string text?;
    int index?;
    CreateCompletionResponse_logprobs? logprobs = ();
    string finish_reason?;
|};

public type CreateEditRequest record {|
    # ID of the model to use. You can use the `text-davinci-edit-001` or `code-davinci-edit-001` model with this endpoint.
    string model;
    # The input text to use as a starting point for the edit.
    string? input = "";
    # The instruction that tells the model how to edit the prompt.
    string instruction;
    # How many edits to generate for the input and instruction.
    int? n = 1;
    # What sampling temperature to use, between 0 and 2. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic.
    #
    # We generally recommend altering this or `top_p` but not both.
    decimal? temperature = 1;
    # An alternative to sampling with temperature, called nucleus sampling, where the model considers the results of the tokens with top_p probability mass. So 0.1 means only the tokens comprising the top 10% probability mass are considered.
    #
    # We generally recommend altering this or `temperature` but not both.
    decimal? top_p = 1;
|};

public type CreateImageRequest record {|
    # A text description of the desired image(s). The maximum length is 1000 characters.
    string prompt;
    # The number of images to generate. Must be between 1 and 10.
    int? n = 1;
    # The size of the generated images. Must be one of `256x256`, `512x512`, or `1024x1024`.
    string? size = "1024x1024";
    # The format in which the generated images are returned. Must be one of `url` or `b64_json`.
    string? response_format = "url";
    # A unique identifier representing your end-user, which can help OpenAI to monitor and detect abuse. [Learn more](/docs/guides/safety-best-practices/end-user-ids).
    string user?;
|};

public type ChatCompletionRequestMessage record {|
    # The role of the author of this message.
    string role;
    # The contents of the message
    string content;
    # The name of the user in a multi-user chat
    string name?;
|};

public type CreateAnswerResponse_selected_documents record {|
    int document?;
    string text?;
|};

public type CreateSearchResponse record {|
    string 'object?;
    string model?;
    CreateSearchResponse_data[] data?;
|};

public type File record {|
    # The audio file to transcribe, in one of these formats: mp3, mp4, mpeg, mpga, m4a, wav, or webm.
    byte[] fileBinary;

    string fileName;

|};

public type CreateTranscriptionRequest record {|
    # The audio file to transcribe, in one of these formats: mp3, mp4, mpeg, mpga, m4a, wav, or webm.
    File file;
    # ID of the model to use. Only `whisper-1` is currently available.
    string model;
    # An optional text to guide the model's style or continue a previous audio segment. The [prompt](/docs/guides/speech-to-text/prompting) should match the audio language.
    string prompt?;
    # The format of the transcript output, in one of these options: json, text, srt, verbose_json, or vtt.
    string response_format = "json";
    # The sampling temperature, between 0 and 1. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic. If set to 0, the model will use [log probability](https://en.wikipedia.org/wiki/Log_probability) to automatically increase the temperature until certain thresholds are hit.
    decimal temperature = 0;
    # The language of the input audio. Supplying the input language in [ISO-639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) format will improve accuracy and latency.
    string language?;
|};

public type CreateModerationResponse_category_scores record {|
    decimal hate;
    decimal 'hate\/threatening;
    decimal 'self\-harm;
    decimal sexual;
    decimal 'sexual\/minors;
    decimal violence;
    decimal 'violence\/graphic;
|};

public type CreateTranslationRequest record {|
    # The audio file to translate, in one of these formats: mp3, mp4, mpeg, mpga, m4a, wav, or webm.
    File file;
    # ID of the model to use. Only `whisper-1` is currently available.
    string model;
    # An optional text to guide the model's style or continue a previous audio segment. The [prompt](/docs/guides/speech-to-text/prompting) should be in English.
    string prompt?;
    # The format of the transcript output, in one of these options: json, text, srt, verbose_json, or vtt.
    string response_format = "json";
    # The sampling temperature, between 0 and 1. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic. If set to 0, the model will use [log probability](https://en.wikipedia.org/wiki/Log_probability) to automatically increase the temperature until certain thresholds are hit.
    decimal temperature = 0;
|};

public type CreateModerationResponse_categories record {|
    boolean hate;
    boolean 'hate\/threatening;
    boolean 'self\-harm;
    boolean sexual;
    boolean 'sexual\/minors;
    boolean violence;
    boolean 'violence\/graphic;
|};

public type CreateModerationResponse record {|
    string id;
    string model;
    CreateModerationResponse_results[] results;
|};

public type ListFineTunesResponse record {|
    string 'object;
    FineTune[] data;
|};

public type CreateEmbeddingResponse record {|
    string 'object;
    string model;
    CreateEmbeddingResponse_data[] data;
    CreateEmbeddingResponse_usage usage;
|};

public type Engine record {|
    string id;
    string 'object;
    int? created;
    boolean ready;
|};

public type FineTune record {|
    string id;
    string 'object;
    int created_at;
    int updated_at;
    string model;
    string? fine_tuned_model;
    string organization_id;
    string status;
    record {} hyperparams;
    OpenAIFile[] training_files;
    OpenAIFile[] validation_files;
    OpenAIFile[] result_files;
    FineTuneEvent[] events?;
|};

public type CreateSearchRequest record {|
    # Query to search against the documents.
    @constraint:String {minLength: 1}
    string query;
    # Up to 200 documents to search over, provided as a list of strings.
    #
    # The maximum document length (in tokens) is 2034 minus the number of tokens in the query.
    #
    # You should specify either `documents` or a `file`, but not both.
    string[]? documents = ();
    # The ID of an uploaded file that contains documents to search over.
    #
    # You should specify either `documents` or a `file`, but not both.
    string? file = ();
    # The maximum number of documents to be re-ranked and returned by search.
    #
    # This flag only takes effect when `file` is set.
    int? max_rerank = 200;
    # A special boolean flag for showing metadata. If set to `true`, each document entry in the returned JSON will contain a "metadata" field.
    #
    # This flag only takes effect when `file` is set.
    boolean? return_metadata = false;
    # A unique identifier representing your end-user, which can help OpenAI to monitor and detect abuse. [Learn more](/docs/guides/safety-best-practices/end-user-ids).
    string user?;
|};

public type CreateModerationResponse_results record {|
    boolean flagged;
    CreateModerationResponse_categories categories;
    CreateModerationResponse_category_scores category_scores;
|};

public type ListFineTuneEventsResponse record {|
    string 'object;
    FineTuneEvent[] data;
|};

public type CreateEmbeddingRequest record {|
    # ID of the model to use. You can use the [List models](/docs/api-reference/models/list) API to see all of your available models, or see our [Model overview](/docs/models/overview) for descriptions of them.
    string model;
    # Input text to get embeddings for, encoded as a string or array of tokens. To get embeddings for multiple inputs in a single request, pass an array of strings or array of token arrays. Each input must not exceed 8192 tokens in length.
    string|string[]|int[]|int[][] input;
    # A unique identifier representing your end-user, which can help OpenAI to monitor and detect abuse. [Learn more](/docs/guides/safety-best-practices/end-user-ids).
    string user?;
|};

public type CreateModerationRequest record {|
    # The input text to classify
    string|string[] input;
    # Two content moderations models are available: `text-moderation-stable` and `text-moderation-latest`.
    #
    # The default is `text-moderation-latest` which will be automatically upgraded over time. This ensures you are always using our most accurate model. If you use `text-moderation-stable`, we will provide advanced notice before updating the model. Accuracy of `text-moderation-stable` may be slightly lower than for `text-moderation-latest`.
    string model = "text-moderation-latest";
|};

public type CreateSearchResponse_data record {|
    string 'object?;
    int document?;
    decimal score?;
|};

public type DeleteFileResponse record {|
    string id;
    string 'object;
    boolean deleted;
|};

public type CreateEditResponse record {|
    string 'object;
    int created;
    CreateCompletionResponse_choices[] choices;
    CreateCompletionResponse_usage usage;
|};

public type CreateEmbeddingResponse_data record {|
    int index;
    string 'object;
    decimal[] embedding;
|};

@constraint:String {minLength: 1}
public type CreateAnswerRequestExamplesItemsArrayItemsString string;

@constraint:Array {maxLength: 2, minLength: 2}
public type CreateAnswerRequestExamplesItemsArray CreateAnswerRequestExamplesItemsArrayItemsString[];

public type CreateAnswerRequest record {|
    # ID of the model to use for completion. You can select one of `ada`, `babbage`, `curie`, or `davinci`.
    string model;
    # Question to get answered.
    @constraint:String {minLength: 1}
    string question;
    # List of (question, answer) pairs that will help steer the model towards the tone and answer format you'd like. We recommend adding 2 to 3 examples.
    @constraint:Array {maxLength: 200, minLength: 1}
    CreateAnswerRequestExamplesItemsArray[] examples;
    # A text snippet containing the contextual information used to generate the answers for the `examples` you provide.
    string examples_context;
    # List of documents from which the answer for the input `question` should be derived. If this is an empty list, the question will be answered based on the question-answer examples.
    #
    # You should specify either `documents` or a `file`, but not both.
    string[]? documents = ();
    # The ID of an uploaded file that contains documents to search over. See [upload file](/docs/api-reference/files/upload) for how to upload a file of the desired format and purpose.
    #
    # You should specify either `documents` or a `file`, but not both.
    string? file = ();
    # ID of the model to use for [Search](/docs/api-reference/searches/create). You can select one of `ada`, `babbage`, `curie`, or `davinci`.
    string? search_model = "ada";
    # The maximum number of documents to be ranked by [Search](/docs/api-reference/searches/create) when using `file`. Setting it to a higher value leads to improved accuracy but with increased latency and cost.
    int? max_rerank = 200;
    # What sampling temperature to use, between 0 and 2. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic.
    decimal? temperature = 0;
    # Include the log probabilities on the `logprobs` most likely tokens, as well the chosen tokens. For example, if `logprobs` is 5, the API will return a list of the 5 most likely tokens. The API will always return the `logprob` of the sampled token, so there may be up to `logprobs+1` elements in the response.
    #
    # The maximum value for `logprobs` is 5. If you need more than this, please contact us through our [Help center](https://help.openai.com) and describe your use case.
    #
    # When `logprobs` is set, `completion` will be automatically added into `expand` to get the logprobs.
    int? logprobs = ();
    # The maximum number of tokens allowed for the generated answer
    int? max_tokens = 16;
    # Up to 4 sequences where the API will stop generating further tokens. The returned text will not contain the stop sequence.
    string|string[]? stop = ();
    # How many answers to generate for each question.
    int? n = 1;
    # Modify the likelihood of specified tokens appearing in the completion.
    #
    # Accepts a json object that maps tokens (specified by their token ID in the GPT tokenizer) to an associated bias value from -100 to 100. You can use this [tokenizer tool](/tokenizer?view=bpe) (which works for both GPT-2 and GPT-3) to convert text to token IDs. Mathematically, the bias is added to the logits generated by the model prior to sampling. The exact effect will vary per model, but values between -1 and 1 should decrease or increase likelihood of selection; values like -100 or 100 should result in a ban or exclusive selection of the relevant token.
    #
    # As an example, you can pass `{"50256": -100}` to prevent the <|endoftext|> token from being generated.
    record {} logit_bias?;
    # A special boolean flag for showing metadata. If set to `true`, each document entry in the returned JSON will contain a "metadata" field.
    #
    # This flag only takes effect when `file` is set.
    boolean? return_metadata = false;
    # If set to `true`, the returned JSON will include a "prompt" field containing the final prompt that was used to request a completion. This is mainly useful for debugging purposes.
    boolean? return_prompt = false;
    # If an object name is in the list, we provide the full information of the object; otherwise, we only provide the object ID. Currently we support `completion` and `file` objects for expansion.
    anydata[]? expand = [];
    # A unique identifier representing your end-user, which can help OpenAI to monitor and detect abuse. [Learn more](/docs/guides/safety-best-practices/end-user-ids).
    string user?;
|};

public type OpenAIFile record {|
    string id;
    string 'object;
    int bytes;
    int created_at;
    string filename;
    string purpose;
    string status?;
    record {} status_details?;
|};

public type CreateCompletionResponse_logprobs record {|
    string[] tokens?;
    decimal[] token_logprobs?;
    record {}[] top_logprobs?;
    int[] text_offset?;
|};

public type CreateChatCompletionResponse_choices record {|
    int index?;
    ChatCompletionResponseMessage message?;
    string finish_reason?;
|};

public type ImagesResponse_data record {|
    string url?;
    string b64_json?;
|};

public type ListEnginesResponse record {|
    string 'object;
    Engine[] data;
|};

public type CreateChatCompletionRequest record {|
    # ID of the model to use. Currently, only `gpt-3.5-turbo` and `gpt-3.5-turbo-0301` are supported.
    string model;
    # The messages to generate chat completions for, in the [chat format](/docs/guides/chat/introduction).
    @constraint:Array {minLength: 1}
    ChatCompletionRequestMessage[] messages;
    # What sampling temperature to use, between 0 and 2. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic.
    #
    # We generally recommend altering this or `top_p` but not both.
    decimal? temperature = 1;
    # An alternative to sampling with temperature, called nucleus sampling, where the model considers the results of the tokens with top_p probability mass. So 0.1 means only the tokens comprising the top 10% probability mass are considered.
    #
    # We generally recommend altering this or `temperature` but not both.
    decimal? top_p = 1;
    # How many chat completion choices to generate for each input message.
    int? n = 1;
    # If set, partial message deltas will be sent, like in ChatGPT. Tokens will be sent as data-only [server-sent events](https://developer.mozilla.org/en-US/docs/Web/API/Server-sent_events/Using_server-sent_events#Event_stream_format) as they become available, with the stream terminated by a `data: [DONE]` message.
    boolean? 'stream = false;
    # Up to 4 sequences where the API will stop generating further tokens.
    string|string[]? stop = ();
    # The maximum number of tokens allowed for the generated answer. By default, the number of tokens the model can return will be (4096 - prompt tokens).
    int max_tokens?;
    # Number between -2.0 and 2.0. Positive values penalize new tokens based on whether they appear in the text so far, increasing the model's likelihood to talk about new topics.
    #
    # [See more information about frequency and presence penalties.](/docs/api-reference/parameter-details)
    decimal? presence_penalty = 0;
    # Number between -2.0 and 2.0. Positive values penalize new tokens based on their existing frequency in the text so far, decreasing the model's likelihood to repeat the same line verbatim.
    #
    # [See more information about frequency and presence penalties.](/docs/api-reference/parameter-details)
    decimal? frequency_penalty = 0;
    # Modify the likelihood of specified tokens appearing in the completion.
    #
    # Accepts a json object that maps tokens (specified by their token ID in the tokenizer) to an associated bias value from -100 to 100. Mathematically, the bias is added to the logits generated by the model prior to sampling. The exact effect will vary per model, but values between -1 and 1 should decrease or increase likelihood of selection; values like -100 or 100 should result in a ban or exclusive selection of the relevant token.
    record {} logit_bias?;
    # A unique identifier representing your end-user, which can help OpenAI to monitor and detect abuse. [Learn more](/docs/guides/safety-best-practices/end-user-ids).
    string user?;
|};

public type CreateEmbeddingResponse_usage record {|
    int prompt_tokens;
    int total_tokens;
|};

public type CreateAnswerResponse record {|
    string 'object?;
    string model?;
    string search_model?;
    string completion?;
    string[] answers?;
    CreateAnswerResponse_selected_documents[] selected_documents?;
|};

public type DeleteModelResponse record {|
    string id;
    string 'object;
    boolean deleted;
|};

public type ImagesResponse record {|
    int created;
    ImagesResponse_data[] data;
|};

public type CreateClassificationResponse_selected_examples record {|
    int document?;
    string text?;
    string label?;
|};

public type CreateClassificationResponse record {|
    string 'object?;
    string model?;
    string search_model?;
    string completion?;
    string label?;
    CreateClassificationResponse_selected_examples[] selected_examples?;
|};

public type CreateTranslationResponse record {|
    string text;
|};

public type FineTuneEvent record {|
    string 'object;
    int created_at;
    string level;
    string message;
|};

public type CreateCompletionRequest record {|
    # ID of the model to use. You can use the [List models](/docs/api-reference/models/list) API to see all of your available models, or see our [Model overview](/docs/models/overview) for descriptions of them.
    string model;
    # The prompt(s) to generate completions for, encoded as a string, array of strings, array of tokens, or array of token arrays.
    #
    # Note that <|endoftext|> is the document separator that the model sees during training, so if a prompt is not specified the model will generate as if from the beginning of a new document.
    string? prompt = "<|endoftext|>";
    # The suffix that comes after a completion of inserted text.
    string? suffix = ();
    # The maximum number of [tokens](/tokenizer) to generate in the completion.
    #
    # The token count of your prompt plus `max_tokens` cannot exceed the model's context length. Most models have a context length of 2048 tokens (except for the newest models, which support 4096).
    int? max_tokens = 16;
    # What sampling temperature to use, between 0 and 2. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic.
    #
    # We generally recommend altering this or `top_p` but not both.
    decimal? temperature = 1;
    # An alternative to sampling with temperature, called nucleus sampling, where the model considers the results of the tokens with top_p probability mass. So 0.1 means only the tokens comprising the top 10% probability mass are considered.
    #
    # We generally recommend altering this or `temperature` but not both.
    decimal? top_p = 1;
    # How many completions to generate for each prompt.
    #
    # **Note:** Because this parameter generates many completions, it can quickly consume your token quota. Use carefully and ensure that you have reasonable settings for `max_tokens` and `stop`.
    int? n = 1;
    # Whether to stream back partial progress. If set, tokens will be sent as data-only [server-sent events](https://developer.mozilla.org/en-US/docs/Web/API/Server-sent_events/Using_server-sent_events#Event_stream_format) as they become available, with the stream terminated by a `data: [DONE]` message.
    boolean? 'stream = false;
    # Include the log probabilities on the `logprobs` most likely tokens, as well the chosen tokens. For example, if `logprobs` is 5, the API will return a list of the 5 most likely tokens. The API will always return the `logprob` of the sampled token, so there may be up to `logprobs+1` elements in the response.
    #
    # The maximum value for `logprobs` is 5. If you need more than this, please contact us through our [Help center](https://help.openai.com) and describe your use case.
    int? logprobs = ();
    # Echo back the prompt in addition to the completion
    boolean? echo = false;
    # Up to 4 sequences where the API will stop generating further tokens. The returned text will not contain the stop sequence.
    string|string[]?? stop = ();
    # Number between -2.0 and 2.0. Positive values penalize new tokens based on whether they appear in the text so far, increasing the model's likelihood to talk about new topics.
    #
    # [See more information about frequency and presence penalties.](/docs/api-reference/parameter-details)
    decimal? presence_penalty = 0;
    # Number between -2.0 and 2.0. Positive values penalize new tokens based on their existing frequency in the text so far, decreasing the model's likelihood to repeat the same line verbatim.
    #
    # [See more information about frequency and presence penalties.](/docs/api-reference/parameter-details)
    decimal? frequency_penalty = 0;
    # Generates `best_of` completions server-side and returns the "best" (the one with the highest log probability per token). Results cannot be streamed.
    #
    # When used with `n`, `best_of` controls the number of candidate completions and `n` specifies how many to return – `best_of` must be greater than `n`.
    #
    # **Note:** Because this parameter generates many completions, it can quickly consume your token quota. Use carefully and ensure that you have reasonable settings for `max_tokens` and `stop`.
    int? best_of = 1;
    # Modify the likelihood of specified tokens appearing in the completion.
    #
    # Accepts a json object that maps tokens (specified by their token ID in the GPT tokenizer) to an associated bias value from -100 to 100. You can use this [tokenizer tool](/tokenizer?view=bpe) (which works for both GPT-2 and GPT-3) to convert text to token IDs. Mathematically, the bias is added to the logits generated by the model prior to sampling. The exact effect will vary per model, but values between -1 and 1 should decrease or increase likelihood of selection; values like -100 or 100 should result in a ban or exclusive selection of the relevant token.
    #
    # As an example, you can pass `{"50256": -100}` to prevent the <|endoftext|> token from being generated.
    record {} logit_bias?;
    # A unique identifier representing your end-user, which can help OpenAI to monitor and detect abuse. [Learn more](/docs/guides/safety-best-practices/end-user-ids).
    string user?;
|};

public type CreateChatCompletionResponse record {|
    string id;
    string 'object;
    int created;
    string model;
    CreateChatCompletionResponse_choices[] choices;
    CreateCompletionResponse_usage usage?;
|};

public type CreateFileRequest record {|
    # Name of the [JSON Lines](https://jsonlines.readthedocs.io/en/latest/) file to be uploaded.
    #
    # If the `purpose` is set to "fine-tune", each line is a JSON record with "prompt" and "completion" fields representing your [training examples](/docs/guides/fine-tuning/prepare-training-data).
    File file;
    # The intended purpose of the uploaded documents.
    #
    # Use "fine-tune" for [Fine-tuning](/docs/api-reference/fine-tunes). This allows us to validate the format of the uploaded file.
    string purpose;
|};

public type CreateCompletionResponse record {|
    string id;
    string 'object;
    int created;
    string model;
    CreateCompletionResponse_choices[] choices;
    CreateCompletionResponse_usage usage?;
|};

public type CreateImageVariationRequest record {|
    # The image to use as the basis for the variation(s). Must be a valid PNG file, less than 4MB, and square.
    File image;
    # The number of images to generate. Must be between 1 and 10.
    int? n = 1;
    # The size of the generated images. Must be one of `256x256`, `512x512`, or `1024x1024`.
    string? size = "1024x1024";
    # The format in which the generated images are returned. Must be one of `url` or `b64_json`.
    string? response_format = "url";
    # A unique identifier representing your end-user, which can help OpenAI to monitor and detect abuse. [Learn more](/docs/guides/safety-best-practices/end-user-ids).
    string user?;
|};

public type ChatCompletionResponseMessage record {|
    # The role of the author of this message.
    string role;
    # The contents of the message
    string content;
|};

public type CreateImageEditRequest record {|
    # The image to edit. Must be a valid PNG file, less than 4MB, and square. If mask is not provided, image must have transparency, which will be used as the mask.
    File image;
    # An additional image whose fully transparent areas (e.g. where alpha is zero) indicate where `image` should be edited. Must be a valid PNG file, less than 4MB, and have the same dimensions as `image`.
    File mask?;
    # A text description of the desired image(s). The maximum length is 1000 characters.
    string prompt;
    # The number of images to generate. Must be between 1 and 10.
    int? n = 1;
    # The size of the generated images. Must be one of `256x256`, `512x512`, or `1024x1024`.
    string? size = "1024x1024";
    # The format in which the generated images are returned. Must be one of `url` or `b64_json`.
    string? response_format = "url";
    # A unique identifier representing your end-user, which can help OpenAI to monitor and detect abuse. [Learn more](/docs/guides/safety-best-practices/end-user-ids).
    string user?;
|};

@constraint:String {minLength: 1}
public type CreateClassificationRequestExamplesItemsArrayItemsString string;

@constraint:Array {minLength: 2, maxLength: 2}
public type CreateClassificationRequestExamplesItemsArray CreateClassificationRequestExamplesItemsArrayItemsString[];

public type CreateClassificationRequest record {|
    # ID of the model to use. You can use the [List models](/docs/api-reference/models/list) API to see all of your available models, or see our [Model overview](/docs/models/overview) for descriptions of them.
    string model;
    # Query to be classified.
    @constraint:String {minLength: 1}
    string query;
    # A list of examples with labels, in the following format:
    #
    # `[["The movie is so interesting.", "Positive"], ["It is quite boring.", "Negative"], ...]`
    #
    # All the label strings will be normalized to be capitalized.
    #
    # You should specify either `examples` or `file`, but not both.
    CreateClassificationRequestExamplesItemsArray? examples = ();
    # The ID of the uploaded file that contains training examples. See [upload file](/docs/api-reference/files/upload) for how to upload a file of the desired format and purpose.
    #
    # You should specify either `examples` or `file`, but not both.
    string? file = ();
    # The set of categories being classified. If not specified, candidate labels will be automatically collected from the examples you provide. All the label strings will be normalized to be capitalized.
    string[]? labels = ();
    # ID of the model to use for [Search](/docs/api-reference/searches/create). You can select one of `ada`, `babbage`, `curie`, or `davinci`.
    string? search_model = "ada";
    # What sampling temperature to use, between 0 and 2. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic.
    decimal? temperature = 0;
    # Include the log probabilities on the `logprobs` most likely tokens, as well the chosen tokens. For example, if `logprobs` is 5, the API will return a list of the 5 most likely tokens. The API will always return the `logprob` of the sampled token, so there may be up to `logprobs+1` elements in the response.
    #
    # The maximum value for `logprobs` is 5. If you need more than this, please contact us through our [Help center](https://help.openai.com) and describe your use case.
    #
    # When `logprobs` is set, `completion` will be automatically added into `expand` to get the logprobs.
    int? logprobs = ();
    # The maximum number of examples to be ranked by [Search](/docs/api-reference/searches/create) when using `file`. Setting it to a higher value leads to improved accuracy but with increased latency and cost.
    int? max_examples = 200;
    # Modify the likelihood of specified tokens appearing in the completion.
    #
    # Accepts a json object that maps tokens (specified by their token ID in the GPT tokenizer) to an associated bias value from -100 to 100. You can use this [tokenizer tool](/tokenizer?view=bpe) (which works for both GPT-2 and GPT-3) to convert text to token IDs. Mathematically, the bias is added to the logits generated by the model prior to sampling. The exact effect will vary per model, but values between -1 and 1 should decrease or increase likelihood of selection; values like -100 or 100 should result in a ban or exclusive selection of the relevant token.
    #
    # As an example, you can pass `{"50256": -100}` to prevent the <|endoftext|> token from being generated.
    record {} logit_bias?;
    # If set to `true`, the returned JSON will include a "prompt" field containing the final prompt that was used to request a completion. This is mainly useful for debugging purposes.
    boolean? return_prompt = false;
    # A special boolean flag for showing metadata. If set to `true`, each document entry in the returned JSON will contain a "metadata" field.
    #
    # This flag only takes effect when `file` is set.
    boolean? return_metadata = false;
    # If an object name is in the list, we provide the full information of the object; otherwise, we only provide the object ID. Currently we support `completion` and `file` objects for expansion.
    anydata[]? expand = [];
    # A unique identifier representing your end-user, which can help OpenAI to monitor and detect abuse. [Learn more](/docs/guides/safety-best-practices/end-user-ids).
    string user?;
|};

public type ListModelsResponse record {|
    string 'object;
    Model[] data;
|};

public type CreateFineTuneRequest record {|
    # The ID of an uploaded file that contains training data.
    #
    # See [upload file](/docs/api-reference/files/upload) for how to upload a file.
    #
    # Your dataset must be formatted as a JSONL file, where each training
    # example is a JSON object with the keys "prompt" and "completion".
    # Additionally, you must upload your file with the purpose `fine-tune`.
    #
    # See the [fine-tuning guide](/docs/guides/fine-tuning/creating-training-data) for more details.
    string training_file;
    # The ID of an uploaded file that contains validation data.
    #
    # If you provide this file, the data is used to generate validation
    # metrics periodically during fine-tuning. These metrics can be viewed in
    # the [fine-tuning results file](/docs/guides/fine-tuning/analyzing-your-fine-tuned-model).
    # Your train and validation data should be mutually exclusive.
    #
    # Your dataset must be formatted as a JSONL file, where each validation
    # example is a JSON object with the keys "prompt" and "completion".
    # Additionally, you must upload your file with the purpose `fine-tune`.
    #
    # See the [fine-tuning guide](/docs/guides/fine-tuning/creating-training-data) for more details.
    string validation_file?;
    # The name of the base model to fine-tune. You can select one of "ada",
    # "babbage", "curie", "davinci", or a fine-tuned model created after 2022-04-21.
    # To learn more about these models, see the
    # [Models](https://platform.openai.com/docs/models) documentation.
    string? model = "curie";
    # The number of epochs to train the model for. An epoch refers to one
    # full cycle through the training dataset.
    int? n_epochs = 4;
    # The batch size to use for training. The batch size is the number of
    # training examples used to train a single forward and backward pass.
    #
    # By default, the batch size will be dynamically configured to be
    # ~0.2% of the number of examples in the training set, capped at 256 -
    # in general, we've found that larger batch sizes tend to work better
    # for larger datasets.
    int batch_size?;
    # The learning rate multiplier to use for training.
    # The fine-tuning learning rate is the original learning rate used for
    # pretraining multiplied by this value.
    #
    # By default, the learning rate multiplier is the 0.05, 0.1, or 0.2
    # depending on final `batch_size` (larger learning rates tend to
    # perform better with larger batch sizes). We recommend experimenting
    # with values in the range 0.02 to 0.2 to see what produces the best
    # results.
    decimal learning_rate_multiplier?;
    # The weight to use for loss on the prompt tokens. This controls how
    # much the model tries to learn to generate the prompt (as compared
    # to the completion which always has a weight of 1.0), and can add
    # a stabilizing effect to training when completions are short.
    #
    # If prompts are extremely long (relative to completions), it may make
    # sense to reduce this weight so as to avoid over-prioritizing
    # learning the prompt.
    decimal? prompt_loss_weight = 0.01;
    # If set, we calculate classification-specific metrics such as accuracy
    # and F-1 score using the validation set at the end of every epoch.
    # These metrics can be viewed in the [results file](/docs/guides/fine-tuning/analyzing-your-fine-tuned-model).
    #
    # In order to compute classification metrics, you must provide a
    # `validation_file`. Additionally, you must
    # specify `classification_n_classes` for multiclass classification or
    # `classification_positive_class` for binary classification.
    boolean? compute_classification_metrics = false;
    # The number of classes in a classification task.
    #
    # This parameter is required for multiclass classification.
    int classification_n_classes?;
    # The positive class in binary classification.
    #
    # This parameter is needed to generate precision, recall, and F1
    # metrics when doing binary classification.
    string classification_positive_class?;
    # If this is provided, we calculate F-beta scores at the specified
    # beta values. The F-beta score is a generalization of F-1 score.
    # This is only used for binary classification.
    #
    # With a beta of 1 (i.e. the F-1 score), precision and recall are
    # given the same weight. A larger beta score puts more weight on
    # recall and less on precision. A smaller beta score puts more weight
    # on precision and less on recall.
    decimal[] classification_betas?;
    # A string of up to 40 characters that will be added to your fine-tuned model name.
    #
    # For example, a `suffix` of "custom-model-name" would produce a model name like `ada:ft-your-org:custom-model-name-2022-02-15-04-21-04`.
    string suffix?;
|};

public type Model record {|
    string id;
    string 'object;
    int created;
    string owned_by;
|};

public type ListFilesResponse record {|
    string 'object;
    OpenAIFile[] data;
|};

public type CreateCompletionResponse_usage record {|
    int prompt_tokens;
    int completion_tokens;
    int total_tokens;
|};
