CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission

git clone $1 student-submission
echo 'Finished cloning'

cd student-submission

# Checking if the correct file has been submitted
if [[ -e ListExamples.java ]]
then 
    echo "File with the correct name was submitted (ListExamples.java)"
else 
    echo "File with incorrect name was submitted. Rename to ListExamples.java"
    exit
fi

cd ../

# Somehow get the student code and your test .java file into the same directory
cp ./student-submission/ListExamples.java ./

# Compiling the files
javac -cp $CPATH *.java


# Checking for compilation errors
if [[ $? -ne 0 ]]
then 
    echo "There was an error compiling the file submitted"
    cat error-trace.txt
    exit
else 
    echo "The java code was compiled successfully"
fi


# Running the JUnit tests
java -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar org.junit.runner.JUnitCore TestListExamples > test-output.txt

echo "================================"
last_line=$(tail -n 2 test-output.txt)
echo $last_line
echo "================================"

echo "Execution ended"
