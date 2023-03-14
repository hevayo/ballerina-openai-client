# keep as is to stick with the default Ballerina installation and, override only to provide custom distribution paths
BAL_HOME=""
CONTRACT_PATH="client_openapi.yaml"

BAL_CMD="bal"
if [ "$BAL_HOME" != "" ]; then
    BAL_CMD="$BAL_HOME"/bin/bal
fi

mkdir -p modules/gpt3
$BAL_CMD openapi -i $CONTRACT_PATH -o modules/gpt3 --mode client --tags gpt3

mkdir -p modules/fine_tune
$BAL_CMD openapi -i $CONTRACT_PATH -o modules/fine_tune --mode client --tags fine-tune

mkdir -p modules/chatgpt
$BAL_CMD openapi -i $CONTRACT_PATH -o modules/chatgpt --mode client --tags chatgpt

mkdir -p modules/dalle
$BAL_CMD openapi -i $CONTRACT_PATH -o modules/dalle --mode client --tags dalle

mkdir -p modules/whisper
$BAL_CMD openapi -i $CONTRACT_PATH -o modules/whisper --mode client --tags whisper

mkdir -p modules/moderations
$BAL_CMD openapi -i $CONTRACT_PATH -o modules/moderations --mode client --tags moderations
