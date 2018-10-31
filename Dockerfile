FROM ubuntu:14.04
MAINTAINER Christopher version: 1.0

RUN mkdir /grader

COPY /executeGrader.sh /grader/
COPY /keyFile.txt /grader/
COPY /eval.sh /grader/
COPY /newFile.txt /grader/

RUN chmod a+rwx -R /grader/

ENTRYPOINT ["./grader/executeGrader.sh"]



