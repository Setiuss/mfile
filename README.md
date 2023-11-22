# mfile
check Makefile with Dockerfile

man for https://shell.cloud.google.com/
set auth:
git config --global user.email "you@example.com"
git config --global user.name "Your Name"
gcloud auth login

clon repository:
https://github.com/setiuss/mfile.git

build image:
docker build .

set tag version:
git tag -a v1.0.0 -m "app version"

commands:
make linux   - linux/amd64
make arm     - linux/arm64
make macos   - darwin/amd64
make windows - windows/amd64
make image   - build image for push
make push    - push to repository set in REGISTRY
make clean   - deleting the compiled file 

---

TASK:

Makefile та Dockerfile для тестування коду продукту на різних платформах та архітектурах, включаючи Linux, arm, macOS та Windows.

Ось що мені потрібно:

1. Мені потрібен Makefile, який дозволить зібрати код на різних платформах та архітектурах. Наприклад, якщо я хочу зібрати код для Linux, я повинен змогти запустити команду "make linux", яка збере код для Linux. Те саме повинно бути зроблено для arm, macOS та Windows.

2. Також для автоматизації тестів, мені потрібен Dockerfile, який дозволить запустити тестовий набір на різних платформах та архітектурах. Наприклад, якщо я хочу запустити тестовий набір на MacOs arm, я хочу Docker-контейнер із бінарним файлом саме в arm, без Qemu та Rosetta. Те саме повинно бути зроблено для Windows.
  
3. Використай будь ласка альтернативний container registry, щоб уникнути проблем з dockerhub ліцензуванням та лімітами.


Dockerfile: базовий образ quay.io/projectquay/golang:1.20

Makefile: clean повинен містити видалення новоствореного образу docker rmi <IMAGE_TAG>