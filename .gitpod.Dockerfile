FROM gitpod/workspace-full:latest
SHELL ["bash", "-ci"]

RUN sudo install-packages graphviz

# Move where Pyenv is stored
#RUN sudo mv /home/gitpod/.pyenv /workspace/pyenv
#RUN sudo ln -s /workspace/pyenv /home/gitpod/.pyenv

RUN wget -O $HOME/requirements.txt \
        https://raw.githubusercontent.com/gsingers/search_with_machine_learning_course/main/requirements.txt \
    && pyenv install 3.9.7 \
    && pyenv global 3.9.7 \
    && pip install kaggle \
    && pip install -r $HOME/requirements.txt

RUN wget https://github.com/facebookresearch/fastText/archive/v0.9.2.zip \
    && unzip v0.9.2.zip \
    && cd fastText-0.9.2 \
    && make fasttext \
    && ./classification-example.sh \
    && rm ../v0.9.2.zip