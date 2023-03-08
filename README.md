# Ballerina openai client

Usage 
- Build the client package and push to local repository
    ```
    $ cd openai
    $ bal pack
    $ bal push --repository local
    ```
- Set the OpenAI key in the Config.toml

    ```
    $ cd sample
    $ echo "openAIKey = \"sk-xxxxxxxxxxxxxxxxxxxxxxxxxxx\"" > Config.toml
    ```
- Run main with an argument 
    ```
    sample$ bal run -- "What is Ballerina"
    ```