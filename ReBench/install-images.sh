#Base image
wget --quiet -O - get.pharo.org/130+vm | bash

#HoneyGinger
./pharo --headless Pharo.image save illi-hg
./pharo --headless illi-hg.image metacello install gitlocal://. BaselineOfACExHoneyGinger

#DataFrame
./pharo --headless Pharo.image save illi-df
./pharo --headless illi-df.image metacello install gitlocal://. BaselineOfACExDataFrame

#Bloc
./pharo --headless Pharo.image save illimani-bloc
./pharo --headless illimani-bloc.image metacello install gitlocal://. BaselineOfACExBloc

#MobiDyc
./pharo --headless Pharo.image save illi-mobi
./pharo --headless illi-mobi.image metacello install gitlocal://. BaselineOfACExReMobidyc

#Moose 12 stable on Pharo 13 (tag v12.0.0)
wget https://github.com/moosetechnology/Moose/releases/download/v12.0.0/Moose12-stable-Pharo64-13.zip
unzip Moose12-stable-Pharo64-13.zip
mv Moose12-stable-Pharo64-13/* .
./pharo --headless Moose12-stable-Pharo64-13.image save moose
