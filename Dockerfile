FROM haskell:8

RUN apt update && apt install -y ruby ruby-dev build-essential
RUN gem install guard guard-shell
RUN cabal update

WORKDIR /download
RUN wget http://golfscript.com/nibbles/nibbles-latest.tgz
RUN tar xzvf nibbles-latest.tgz

WORKDIR /download/nibbles
RUN ghc -O -package ghc *.hs
RUN rm -r Data
RUN cabal update
RUN cabal install --lib dlist split murmur-hash memoize

RUN ln -s /download/nibbles/nibbles /usr/local/bin/nibbles

WORKDIR /tool
COPY Guardfile .

WORKDIR /src

CMD ["guard", "start", "-i", "-G", "/tool/Guardfile"]