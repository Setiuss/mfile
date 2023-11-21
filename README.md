# mfile
check Makefile with Dockerfile

Makefile та Dockerfile для тестування коду продукту на різних платформах та архітектурах, включаючи Linux, arm, macOS та Windows.

Ось що мені потрібно:

1. Мені потрібен Makefile, який дозволить зібрати код на різних платформах та архітектурах. Наприклад, якщо я хочу зібрати код для Linux, я повинен змогти запустити команду "make linux", яка збере код для Linux. Те саме повинно бути зроблено для arm, macOS та Windows.

2. Також для автоматизації тестів, мені потрібен Dockerfile, який дозволить запустити тестовий набір на різних платформах та архітектурах. Наприклад, якщо я хочу запустити тестовий набір на MacOs arm, я хочу Docker-контейнер із бінарним файлом саме в arm, без Qemu та Rosetta. Те саме повинно бути зроблено для Windows.
  
3. Використай будь ласка альтернативний container registry, щоб уникнути проблем з dockerhub ліцензуванням та лімітами.
