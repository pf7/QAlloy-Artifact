# Installation

## Executable

If the requirements are met, QAlloy should be immediately usable by executing
the JAR provided in this artifact, as follows:
``` 
java -jar QAlloy.jar
```

Otherwise, it can be built according to the instructions provided at https://github.com/pf7/QAlloy .

If on Linux, follow the instructions on a working directory:
``` 
git clone https://github.com/pf7/QAlloy
cd QAlloy
export JAVA_HOME="/path/to/jvm/java-1.8.0-openjdk" # Ensure that Java 1.8 is used during the building process
./gradlew build -x test
```
Then, once the building process is finished, run the JAR.
```
cd org.alloytools.alloy.dist/target
java -jar org.alloytools.alloy.dist.jar
```

## Verification with QAlloy

After performing the previous steps the QAlloy GUI should have appeared.

One should be able to select one of the SMT Solvers provided to handle the
solving process, by proceeding to ```Options > SMT Solver``` and choosing one of ```CVC4```,
```Z3```, ```MathSAT```or ```Yices```.

Finally, to check that QAlloy is able to run properly, considering opening one of the
models provided, for instance, click the ```Open``` icon and then navigate to 
the directory *benchmark/models/**qalloy**/* of this artifact, selecting the *supermarket.als*
file.
Then, either by pressing the ```Execute``` icon, which will run one of the commands
or by running ```Execute > Execute all```, which will solve every command within this model.
If, after executing all commands, on the right panel the results shown are:
1. **Instance found.**
2. **Counterexample found.**
3. No counterexample found.

For each command, in that order, then QAlloy is working as expected.

## Alloy

For commodity, a JAR of the Alloy 5 is also provided, which can be run analogously,
to execute the quantitative models' counterparts, located in *benchmark/models/**alloy**/*,
suited to  be run in regular Alloy.
```
java -jar Alloy-5.0.0.1.jar
```

After opening Alloy, select ```Options > Solver > MiniSat``` if possible, as it was the
SAT Solver used to benchmark Alloy over these examples.

Similarly to before, click the ```Open``` icon and then select *supermarket.als* now
located in the *benchmark/models/**alloy**/* directory.

By executing all commands through ```Execute > Execute all```, the following results
should be obtained:
1. **Instance found.**
2. **Instance found.**
3. **Counterexample found.**
4. **Counterexample found.**
5. No counterexample found.
6. No counterexample found.
