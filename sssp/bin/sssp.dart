import 'dart:core';
import 'dart:io';

const num inf = 1/0;
List<List< Map<String,int> >> adj = [];
List<double> custos;

void main(List<String> args) {
  var readed = readIntLine();
  final n = readed[0];
  final m = readed[1];

  adj.length = n;
  custos = List(n)..fillRange(0, n, inf);

  loadAdj(m);
  sssp(0, readIntLine()[0]);

  custos.sort();
  print((custos[custos.length -1] - custos[1]).toInt()); // 1 porque o primeiro vai ser sempre o S
}

List<int> readIntLine() {
  return stdin.readLineSync().trim().split(' ').map<int>(int.parse).toList();
}

void loadAdj(int times){
  for (var i = 0; i < times; ++i) {
    var readed = readIntLine();
    adj[readed[0] -1] ??= [];
    adj[readed[1] -1] ??= [];

    adj[readed[0] -1].insert(adj[readed[0] -1].length, {'island': readed[1], 'ping': readed[2]}); //a = b, c
    adj[readed[1] -1].insert(adj[readed[1] -1].length, {'island': readed[0], 'ping': readed[2]}); //b = a, c
  }
}

void sssp(int inicial, int s){
  Set vert = {};
  custos[s - 1] = 0;
  vert.add(s - 1);

  while (vert.isNotEmpty) {
    int node = vert.toList()[0];
    vert.remove(node);

    for (Map<String, int> island in adj[node]) {
      if (custos[node] + island['ping'] < custos[island['island'] - 1]) {
        vert.remove(island['island']);
        custos[island['island'] - 1] = custos[node] + island['ping'];
        vert.add(island['island'] - 1);
      }
    }

  }
}