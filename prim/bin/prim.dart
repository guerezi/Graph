// Entrada: 
// A entrada contém vários casos de teste. Cada caso de teste inicia com dois números m (1 ≤ m ≤ 200000) e n (m-1 ≤ n ≤ 200000), 
// que são o número de junções de Byteland e o número de estradas em Byteland, respectivamente. Seguem n conjuntos de três valores 
// inteiros, x, y e z, especificando qual será a estrada bidirecional entre x e y com z metros (0 ≤ x, y < m e x ≠ y).
// A entrada termina com m=n=0. O grafo especificado em cada caso de teste é conectado. O tamanho total de todas as estradas em 
// cada caso de teste é menor do que 2147483648.

// Saída: 
// Para cada caso de teste imprima uma linha contendo a máxima quantidade diária de dólares de Byteland que o governo pode economizar.

import 'dart:core';
import 'dart:io';

class Node {
  Node({this.visited = false});

  bool visited;

  // String get toLog => 'visited: $visited';
}

class Cost {
  Cost({
    this.price,
    this.head,
    this.tail
  });

  int price;
  Node head;
  Node tail;

  // String get toLog => 'price: $price head: ${head.toLog} tail: ${tail.toLog}';
}

//m nodo, n, aresta , x,y,z como no anterior
var nodes = <Node>[];
var costs = <Cost>[];
var readed = <int>[];

void main(List<String> args) {

  readed = readIntLine();
  final _m = readed[0]; //nodo
  final _n = readed[1]; //aresta

  nodes.length = _m; 
  // costs.length = _n;

  loadConnection(_n);

}

List<int> readIntLine() {
  return stdin.readLineSync().trim().split(' ').map<int>(int.parse).toList();
}

void loadConnection(int max){
  readed = readIntLine();

  while (!(readed[0] == readed[1] && readed[0] == 0) || costs.length < max) {
    nodes[readed[0]] ??= Node(visited: false);
    nodes[readed[1]] ??= Node(visited: false);
    
    costs.add(
      Cost(
        price: readed[2],
        head: nodes[readed[0]],
        tail: nodes[readed[1]]
      )
    );
    
    loadConnection(max);
  }
}