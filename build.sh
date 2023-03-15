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

mkdir -p openai.text
cd openai.text # hack to get the ballerina.toml file in the right place, this is a bug in the bal init command
if $REGENERATE; then
    $BAL_CMD init
    sed -i '' -e "s/$USER/ballerinax/g" Ballerina.toml # hack to replace the orgname as "ballerinax"
    if [ ! -f Package.md ]; then
        echo "# Client to connect to OpenAI" >Package.md
    fi
    $BAL_CMD openapi -i ../$CONTRACT_PATH --mode client --tags text
fi
if $PUBLISH_LOCAL; then
    $BAL_CMD pack
    $BAL_CMD push --repository local
fi
cd ../

mkdir -p openai.embeddings
cd openai.embeddings # hack to get the ballerina.toml file in the right place, this is a bug in the bal init command
if $REGENERATE; then
    $BAL_CMD init
    sed -i '' -e "s/$USER/ballerinax/g" Ballerina.toml # hack to replace the orgname as "ballerinax"
    if [ ! -f Package.md ]; then
        echo "# Client to connect to OpenAI" >Package.md
    fi
    $BAL_CMD openapi -i ../$CONTRACT_PATH --mode client --tags embeddings
fi
if $PUBLISH_LOCAL; then
    $BAL_CMD pack
    $BAL_CMD push --repository local
fi
cd ../

mkdir -p openai.finetunes
cd openai.finetunes
if $REGENERATE; then
    $BAL_CMD init
    sed -i '' -e "s/$USER/ballerinax/g" Ballerina.toml
    if [ ! -f Package.md ]; then
        echo "# Client to connect to OpenAI" >Package.md
    fi
    $BAL_CMD openapi -i ../$CONTRACT_PATH --mode client --tags finetunes
fi
if $PUBLISH_LOCAL; then
    $BAL_CMD pack
    $BAL_CMD push --repository local
fi
cd ../

mkdir -p openai.chat
cd openai.chat
if $REGENERATE; then
    $BAL_CMD init
    sed -i '' -e "s/$USER/ballerinax/g" Ballerina.toml
    if [ ! -f Package.md ]; then
        echo "# Client to connect to OpenAI" >Package.md
    fi
    $BAL_CMD openapi -i ../$CONTRACT_PATH --mode client --tags chat
fi
if $PUBLISH_LOCAL; then
    $BAL_CMD pack
    $BAL_CMD push --repository local
fi
cd ../

mkdir -p openai.images
cd openai.images
if $REGENERATE; then
    $BAL_CMD init
    sed -i '' -e "s/$USER/ballerinax/g" Ballerina.toml
    if [ ! -f Package.md ]; then
        echo "# Client to connect to OpenAI" >Package.md
    fi
    $BAL_CMD openapi -i ../$CONTRACT_PATH --mode client --tags images
fi
if $PUBLISH_LOCAL; then
    $BAL_CMD pack
    $BAL_CMD push --repository local
fi
cd ../

mkdir -p openai.audio
cd openai.audio
if $REGENERATE; then
    $BAL_CMD init
    sed -i '' -e "s/$USER/ballerinax/g" Ballerina.toml
    if [ ! -f Package.md ]; then
        echo "# Client to connect to OpenAI" >Package.md
    fi
    $BAL_CMD openapi -i ../$CONTRACT_PATH --mode client --tags audio
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
    $BAL_CMD openapi -i ../$CONTRACT_PATH --mode client --tags moderations
fi
if $PUBLISH_LOCAL; then
    $BAL_CMD pack
    $BAL_CMD push --repository local
fi
cd ../
