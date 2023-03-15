# keep as is to stick with the default Ballerina installation and, override only to provide custom distribution paths
BAL_HOME="";
# set to false to skip publishing to local repository
PUBLISH_LOCAL=false;
# path to the openapi contract
CONTRACT_PATH="client_openapi.yaml";

BAL_CMD="bal"
if [ "$BAL_HOME" != "" ]; then
    BAL_CMD="$BAL_HOME"/bin/bal
fi

mkdir -p openai.gpt3
$BAL_CMD openapi -i $CONTRACT_PATH -o openai.gpt3 --mode client --tags gpt3
cd  openai.gpt3 # hack to get the ballerina.toml file in the right place, this is a bug in the bal init command
$BAL_CMD init
if [ ! -f Package.md ]; then
    echo "# Client to connect to OpenAI" > Package.md
fi
if $PUBLISH_LOCAL; then
    $BAL_CMD pack 
    $BAL_CMD push --repository local 
fi
cd ../

mkdir -p openai.fine_tune
$BAL_CMD openapi -i $CONTRACT_PATH -o openai.fine_tune --mode client --tags fine-tune
cd openai.fine_tune 
$BAL_CMD init
if [ ! -f Package.md ]; then
    echo "# Client to connect to OpenAI" > Package.md
fi
if $PUBLISH_LOCAL; then
    $BAL_CMD pack
    $BAL_CMD push --repository local
fi
cd ../

mkdir -p openai.chatgpt
$BAL_CMD openapi -i $CONTRACT_PATH -o openai.chatgpt --mode client --tags chatgpt
cd openai.chatgpt
$BAL_CMD init
if [ ! -f Package.md ]; then
    echo "# Client to connect to OpenAI" > Package.md
fi
if $PUBLISH_LOCAL; then
    $BAL_CMD pack
    $BAL_CMD push --repository local
fi
cd ../

mkdir -p openai.dalle
$BAL_CMD openapi -i $CONTRACT_PATH -o openai.dalle --mode client --tags dalle
cd openai.dalle
$BAL_CMD init
if [ ! -f Package.md ]; then
    echo "# Client to connect to OpenAI" > Package.md
fi
if $PUBLISH_LOCAL; then
    $BAL_CMD pack
    $BAL_CMD push --repository local
fi
cd ../

mkdir -p openai.whisper
$BAL_CMD openapi -i $CONTRACT_PATH -o openai.whisper --mode client --tags whisper
cd openai.whisper
$BAL_CMD init
if [ ! -f Package.md ]; then
    echo "# Client to connect to OpenAI" > Package.md
fi
if $PUBLISH_LOCAL; then
    $BAL_CMD pack
    $BAL_CMD push --repository local
fi
cd ../

mkdir -p openai.moderations
$BAL_CMD openapi -i $CONTRACT_PATH -o openai.moderations --mode client --tags moderations
cd openai.moderations
$BAL_CMD init
if [ ! -f Package.md ]; then
    echo "# Client to connect to OpenAI" > Package.md
fi
if $PUBLISH_LOCAL; then
    $BAL_CMD pack
    $BAL_CMD push --repository local
fi
cd ../
