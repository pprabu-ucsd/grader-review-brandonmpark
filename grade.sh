CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission *.class ListExamples.java testOutput.txt
echo 'Cloning...'
git clone $1 student-submission &> testOutput.txt
if ! [[ $? -eq 0 ]]
then
	echo 'Error cloning repository.'
	exit
fi
echo 'Finished cloning'
if ! [[ -f student-submission/ListExamples.java ]]
then
	echo 'Missing ListExamples.java file.'
	exit
fi
cp student-submission/ListExamples.java .
javac -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar *.java
if ! [[ $? -eq 0 ]]
then
	echo 'Compilation error.'
	exit
fi
java -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar org.junit.runner.JUnitCore TestListExamples
# output=`cat testOutput.txt | grep '\.\(\.\|E\)*' -x`
# echo $output
