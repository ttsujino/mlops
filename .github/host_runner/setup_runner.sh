mkdir actions-runner && cd actions-runner
curl -o actions-runner-linux-x64-2.280.1.tar.gz -L https://github.com/actions/runner/releases/download/v2.280.1/actions-runner-linux-x64-2.280.1.tar.gz
tar xzf ./actions-runner-linux-x64-2.280.1.tar.gz
./config.sh --url https://github.com/ttsujino/mlops --token AMFZCZLZ2RBGYJ75665VBD3CO6KKA
nohup ./run.sh &