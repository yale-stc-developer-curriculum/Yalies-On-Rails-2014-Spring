#!/bin/bash
# Thanks to https://bbs.archlinux.org/viewtopic.php?id=111189
# Self-test version - run in own folder, don't clone anything.

echo "Script made by Jason Liu, March 2014"
echo ""

# Check for lines > 80 characters
function over80 ()     
{
ls -1p > filelist  # make a file list with each on one line
while read -r line ; do # Read lines from stdin
   grep -n '^.\{80\}' "$line" > over.txt 2>/dev/null
   GREP_STATUS=$?  # echo "$line: $GREP_STATUS"
   if [ $GREP_STATUS -gt 1 ]; then
      cd $line
      over80
      cd ../
   elif [ -s over.txt ]; then # if over.txt exists && size>0
      echo "Warning: Lines over 80 characters in file '$line'"
   fi
done < filelist
rm over.txt filelist
}

# Check if git, capybara, rspec, and sinatra are installed
git --version 2>&1 >/dev/null 
GIT_IS_AVAILABLE=$?           # should be 0 if git is installed
gem list capybara -i 2>&1 >/dev/null
CAPY_IS_AVAILABLE=$?
gem list rspec -i 2>&1 >/dev/null
RSPEC_IS_AVAILABLE=$?
gem list sinatra -i 2>&1 >/dev/null
FRANK_IS_AVAILABLE=$?
if [ $GIT_IS_AVAILABLE -ne 0 ]; then 
   echo "Git is not available on your system. Please install it."
   exit
elif [ $CAPY_IS_AVAILABLE -ne 0 ]; then 
   echo "Capybara is not available on your system. Please install it."
   exit
elif [ $RSPEC_IS_AVAILABLE -ne 0 ]; then 
   echo "Rspec is not available on your system. Please install it."
   exit
elif [ $FRANK_IS_AVAILABLE -ne 0 ]; then 
   echo "Sinatra is not available on your system. Please install it."
   exit
fi

orig="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" # find pwd
#echo "Running in: $orig"

# Check for duplicate spec/ and .rspec folders, backup if necesary
if [ ! -d "spec/" ]; then
   mkdir -v spec/
else
   echo "Renaming 'spec/' directory to 'spec_BAK/'"
   mv spec/ spec_BAK/
   mkdir -v spec/
fi

if [ -e ".rspec" ]; then
   echo "Renaming '.rspec' to '.rspec.BAK'"
   mv .rspec .rspec.BAK
fi 

# Change this URL for where the tests are running each time.
TEST_URL=https://github.com/orenyk/sinatra_test
folder=`echo "${TEST_URL##*/}/"`     # Find directory of cloning
line=`echo -e $TEST_URL | sed -e "s/https/git/" | sed -e "s/$/.git/"`
#echo "folder: $folder, line: $line"

if [ -d "$folder" ]; then
   echo "Renaming '$folder' directory to 'sinatra_test_BAK/'"
   mv $folder sinatra_test_BAK/
fi

git clone $line >/dev/null 2>&1
echo "------------------------------------------------"; echo ""

cd $folder                             # Change to folder directory
cp .rspec ../.rspec                    # Copy rspec file in
cp -r spec/* ../spec/                  # Copy spec/ directory in
cd ../
rm -rf $folder
rspec                            # Run rspec tests in folder
over80                           # Check if over 80 lines in file
echo "------------------------------------------------"; echo ""
exit

