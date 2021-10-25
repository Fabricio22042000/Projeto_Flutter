class Aluno{
  String nome;
  double nota1;
  double nota2;
  double media;

  Aluno(this.nome, this.nota1, this.nota2, this.media){
    media = (nota1+nota2)/2;
  }
}