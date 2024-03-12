let h1 = document.getElementById('titulo');
let a = document.querySelector('a');
let ul = document.querySelector('ul');
let ol = document.getElementById('lista-ordenada');

h1.innerText = 'H1';
a.innerText = 'PROZ';

li1 = document.createElement('li');
li2 = document.createElement('li');
li3 = document.createElement('li');

liA = document.createElement('li');
liB = document.createElement('li');
liC = document.createElement('li');

li1.innerText = '1';
li2.innerText = '2';
li3.innerText = '3';

liA.innerText = 'A';
liB.innerText = 'B';
liC.innerText = 'C';

ul.appendChild(li1);
ul.appendChild(li2);
ul.appendChild(li3);
ol.appendChild(liA);
ol.appendChild(liB);
ol.appendChild(liC);