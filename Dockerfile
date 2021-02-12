# base de OS / leve
FROM python:3-alpine as base

#criar um diretório
RUN mkdir /install

#mudar de diretorio
WORKDIR /install

#copia o requirements.txt para o container
COPY ./requirements.txt /requirements.txt

# instalar as dependencias da app
RUN pip install --prefix=/install -r /requirements.txt

# build 2

FROM base
# copia as dependencias para o dir alvo
COPY --from=base /install /usr/local

# copiar aplicação
COPY . /app

# definir diretório de trabalho
WORKDIR /app

# expor a porta de acesso
EXPOSE 5000

# comando a ser executado pelo
CMD [ "python", "app.py" ]





