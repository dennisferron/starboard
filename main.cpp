#include <iostream>
#include <fstream>
#include <string>
#include "antlr4-runtime.h"
#include "LangLexer.h"
#include "LangParser.h"

using namespace antlr4;
using namespace std;

int main(int argc, char *argv[]) {
    string line;
    ifstream LangFile ("examples//example1.txt");
    if (LangFile.is_open()) {
        ANTLRInputStream input(LangFile);
        Lang::LangLexer lexer(&input);
        CommonTokenStream tokens(&lexer);

        tokens.fill();
        for (auto token : tokens.getTokens()) {
            std::cout << token->toString() << std::endl;
        }

        Lang::LangParser parser(&tokens);
        tree::ParseTree *tree = parser.stored_definition();

        std::cout << tree->toStringTree(&parser) << std::endl;
        LangFile.close();
    }
}
