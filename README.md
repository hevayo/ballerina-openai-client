# Ballerina openai client

Usage

1. Build the connectors and push to local repository
    1. To build the compound openAI connector package and push to local repository
        ```
        $ cd openai
        $ bal pack
        $ bal push --repository local
        ```
    2. To build all the openAI sub-connector packages and push to local repository at once
        ```
        $ sh build.sh
        ```
2. Checkout to any of the sample programs listed under `samples` directory.
   ```
   $ cd samples/chatgpt
   ```
3. Set the OpenAI key in the Config.toml
   ```
   $ echo "openAIKey = \"sk-xxxxxxxxxxxxxxxxxxxxxxxxxxx\"" > Config.toml
   ```

4. Run the package (you might need to provide program args for some samples)
    ```
    $ bal run -- "What is Ballerina"
    ```
