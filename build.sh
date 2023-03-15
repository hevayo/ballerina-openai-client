# keep as is to stick with the default Ballerina installation and, override only to provide custom distribution paths
BAL_HOME=""
# set true to regenerate all the connectors from the openapi contract
REGENERATE=false
# set true to publish all the connectors to local central repository
PUBLISH_LOCAL=true
# path to the openapi contract
CONTRACT_PATH="client_openapi.yaml"

BAL_CMD="bal"
if [ "$BAL_HOME" != "" ]; then
    BAL_CMD="$BAL_HOME"/bin/bal
fi

mkdir -p openai.gpt3
cd openai.gpt3 # hack to get the ballerina.toml file in the right place, this is a bug in the bal init command
if $REGENERATE; then
    $BAL_CMD init
    sed -i '' -e "s/$USER/ballerinax/g" Ballerina.toml # hack to replace the orgname as "ballerinax"
    if [ ! -f Package.md ]; then
        echo "# Client to connect to OpenAI" >Package.md
    fi
    $BAL_CMD openapi -i $CONTRACT_PATH --mode client --tags gpt3
fi
if $PUBLISH_LOCAL; then
    $BAL_CMD pack
    $BAL_CMD push --repository local
fi
cd ../

mkdir -p openai.fine_tune
cd openai.fine_tune
if $REGENERATE; then
    $BAL_CMD init
    sed -i '' -e "s/$USER/ballerinax/g" Ballerina.toml
    if [ ! -f Package.md ]; then
        echo "# Client to connect to OpenAI" >Package.md
    fi
    $BAL_CMD openapi -i $CONTRACT_PATH --mode client --tags fine-tune
fi
if $PUBLISH_LOCAL; then
    $BAL_CMD pack
    $BAL_CMD push --repository local
fi
cd ../

mkdir -p openai.chatgpt
cd openai.chatgpt
if $REGENERATE; then
    $BAL_CMD init
    sed -i '' -e "s/$USER/ballerinax/g" Ballerina.toml
    if [ ! -f Package.md ]; then
        echo "# Client to connect to OpenAI" >Package.md
    fi
    $BAL_CMD openapi -i $CONTRACT_PATH --mode client --tags chatgpt
fi
if $PUBLISH_LOCAL; then
    $BAL_CMD pack
    $BAL_CMD push --repository local
fi
cd ../

mkdir -p openai.dalle
cd openai.dalle
if $REGENERATE; then
    $BAL_CMD init
    sed -i '' -e "s/$USER/ballerinax/g" Ballerina.toml
    if [ ! -f Package.md ]; then
        echo "# Client to connect to OpenAI" >Package.md
    fi
    $BAL_CMD openapi -i $CONTRACT_PATH --mode client --tags dalle
fi
if $PUBLISH_LOCAL; then
    $BAL_CMD pack
    $BAL_CMD push --repository local
fi
cd ../

mkdir -p openai.whisper
cd openai.whisper
if $REGENERATE; then
    $BAL_CMD init
    sed -i '' -e "s/$USER/ballerinax/g" Ballerina.toml
    if [ ! -f Package.md ]; then
        echo "# Client to connect to OpenAI" >Package.md
    fi
    $BAL_CMD openapi -i $CONTRACT_PATH --mode client --tags whisper
fi
if $PUBLISH_LOCAL; then
    $BAL_CMD pack
    $BAL_CMD push --repository local
fi
cd ../

mkdir -p openai.moderations
cd openai.moderations
if $REGENERATE; then
    $BAL_CMD init
    sed -i '' -e "s/$USER/ballerinax/g" Ballerina.toml
    if [ ! -f Package.md ]; then
        echo "# Client to connect to OpenAI" >Package.md
    fi
    $BAL_CMD openapi -i $CONTRACT_PATH --mode client --tags moderations
fi
if $PUBLISH_LOCAL; then
    $BAL_CMD pack
    $BAL_CMD push --repository local
fi
cd ../
