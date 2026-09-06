# ==============================================================================
# Makefile para o Analisador da Linguagem Tipada (JavaCC)
# ==============================================================================

# Ferramentas
JAVACC = javacc
JAVAC = javac
JAVA = java

# Configurações do Projeto
PARSER_FILE = Gramatica.jj
MAIN_CLASS = Gramatica
INPUT_FILE = Entrada_2.txt

# Arquivos gerados automaticamente pelo JavaCC
GEN_FILES = Gramatica.java \
            GramaticaConstants.java \
            GramaticaTokenManager.java \
            ParseException.java \
            SimpleCharStream.java \
            Token.java \
            TokenMgrError.java

# Alvo padrão: gera o parser e compila tudo
all: compile

# Gera o código Java a partir do arquivo .jj do JavaCC
parser: $(PARSER_FILE)
	@echo "Gerando parser com JavaCC..."
	$(JAVACC) $(PARSER_FILE)

# Compila todos os arquivos .java do diretório (depende do parser)
compile: parser
	@echo "Compilando arquivos Java..."
	$(JAVAC) *.java

# Executa o programa passando o arquivo de entrada padrão
run: compile
	@echo "Executando o compilador com $(INPUT_FILE)..."
	@echo "--------------------------------------------------"
	$(JAVA) $(MAIN_CLASS) < $(INPUT_FILE)
	@echo "--------------------------------------------------"

# Limpa todos os arquivos compilados (.class) e os gerados pelo JavaCC
clean:
	@echo "Removendo arquivos gerados e compilados..."
	rm -f *.class $(GEN_FILES)

# Declara alvos que não correspondem a nomes de arquivos físicos
.PHONY: all parser compile run clean