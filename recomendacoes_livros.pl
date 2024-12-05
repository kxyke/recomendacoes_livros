% recomendacoes_livros.pl
% Sistema Especialista para Recomendações de Livros
% Desenvolvido por: [Seu Nome Aqui]

% Base de Conhecimento
genero('1984', ficcao).
interesse('1984', politica).

genero('Sapiens', historia).
interesse('Sapiens', ciencia).

genero('O Poder do Hábito', autoajuda).
interesse('O Poder do Hábito', psicologia).

% Regras de recomendação
recomendar(Livro) :- 
    genero(Livro, Genero),
    interesse(Livro, Interesse),
    format('Livro Recomendado: ~w (Gênero: ~w, Interesse: ~w)~n', [Livro, Genero, Interesse]).

% Função principal para recomendações
recomendacao :-
    write('Bem-vindo ao Sistema de Recomendações de Livros!'), nl,
    write('Informe seus interesses (digite "parar" para encerrar):'), nl,
    loop_interesses.

loop_interesses :-
    read(Interesse),
    (Interesse == parar ->
        write('Fim das recomendações.')
    ;
        recomendar(Livro),
        genero(Livro, _), interesse(Livro, Interesse),
        loop_interesses).
