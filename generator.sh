# keep as is to stick with the default Ballerina installation and, override only to provide custom distribution paths
BAL_HOME=""
CONTRACT_PATH="client_openapi.yaml"

BAL_CMD="bal"
if [ "$BAL_HOME" != "" ]; then
    BAL_CMD="$BAL_HOME"/bin/bal
fi

mkdir -p gpt3
$BAL_CMD openapi -i $CONTRACT_PATH -o gpt3 --mode client --tags gpt3
cd gpt3 # hack to get the ballerina.toml file in the right place, this is a bug in the bal init command
$BAL_CMD init 
cd ../

mkdir -p fine_tune
$BAL_CMD openapi -i $CONTRACT_PATH -o fine_tune --mode client --tags fine-tune
cd fine_tune 
$BAL_CMD init fine_tune
cd ../

mkdir -p chatgpt
$BAL_CMD openapi -i $CONTRACT_PATH -o chatgpt --mode client --tags chatgpt
cd chatgpt
$BAL_CMD init chatgpt
cd ../

mkdir -p dalle
$BAL_CMD openapi -i $CONTRACT_PATH -o dalle --mode client --tags dalle
cd dalle
$BAL_CMD init dalle
cd ../

mkdir -p whisper
$BAL_CMD openapi -i $CONTRACT_PATH -o whisper --mode client --tags whisper
cd whisper
$BAL_CMD init whisper
cd ../

mkdir -p moderations
$BAL_CMD openapi -i $CONTRACT_PATH -o moderations --mode client --tags moderations
cd moderations
$BAL_CMD init moderations
cd ../
