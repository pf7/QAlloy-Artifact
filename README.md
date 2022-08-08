# QAlloy

This artifact complements the paper *Quantitative relational modelling with QAlloy*
submitted to the *ESEC/FSE 2022* conference.
It provides the necessary tools and instructions to run QAlloy and apply it
to the examples discussed throughout the paper.
Moreover, the benchmarking models and data are also provided, so that its results
can be reproduced.

## Source

QAlloy source code is available and maintained at https://github.com/pf7/QAlloy, 
where instructions to build the extension from the source are also provided.

The quantitative extension can be executed in any operation system, as long as
the machine supports Java on version 1.8 or higher.
QAlloy was executed in Linux, through the following version:
``` 
openjdk 11.0.16 2022-07-19
OpenJDK Runtime Environment (build 11.0.16+8-post-Ubuntu-0ubuntu120.04)
OpenJDK 64-Bit Server VM (build 11.0.16+8-post-Ubuntu-0ubuntu120.04, mixed mode, sharing)
```

To run the QAlloy build packaged with this artifact do the following:
```
git clone https://github.com/pf7/QAlloy-Artifact.git
cd QAlloy-Artifact/
java -jar QAlloy.jar
```

## Running Example

After performing the previous steps the QAlloy GUI should have appeared.

Consider the *Supermarket self-checkout* (SCO) example discussed in the paper.
To open it up in QAlloy simply click the ```Open``` icon and then, navigate to
the directory *benchmark/models/qalloy/* of this artifact, selecting the *supermarket.als*
file.

The properties specified in this example can now be verified.
Before that, consider selecting one of the SMT Solvers provided to handle the
solving process.
To do that, go to ```Options > SMT Solver``` and select one of ```CVC4```,
```Z3```, ```MathSAT```or ```Yices```.

Next, verify in the property *"If a bag weights more than 30 Ounces, then it must contain Milk."*
encoded in QAlloy language as the ```hasMilk``` assertion.
``` 
assert hasMilk {
	all b : Bag | b;contains;weight > 30 ** Oz 
	    implies b;contains >= 1 ** Milk
}
```
To do so, execute the ```check``` command over the assertion through
```Execute > Check hasMilk for 3 but 2 Bag```, which in turn will have
the previously selected SMT Solver attempt to prove the satisfiability
of this assertion according to the model at hand.

After the solver finds an answer, the panel on the right should present
the bold message **Counterexample found**, meaning that the property
is, in fact, inconsistent under these circumstances.

Moreover, it is possible to interact with the counterexample found
by the solver clicking over the bold message, which should open the
*Visualizer*, displaying an instance where a bag weights more than
30 Oz, but does not contain milk.
The user also has access to an *Evaluator* which can be used to
specify expressions in QAlloy language and further evaluate their
value according to the instance at hand.
Open the evaluator by clicking the ```Evaluator``` icon, write the
expression ```contains ; weight``` and press enter.
The evaluator should return a relation of type ```Bag -> Oz``` which
associates each bag in this instance to its respective total weight in
```Oz``` units.

Now, close the *Visualizer* and execute the following ```check``` command
```Execute > Check hasNoMilk for 3 but 2 Bag```, which is a variant of
the previous assertion, but considering
40 ounces instead of 30.
After solving, the message ```No counterexample found.``` should
appear in the right panel, meaning that the solver was unable to
determine a bag weighting more than 40 Oz filled with the products
in stock, but simultaneously not containing milk.
Thus, this assertion is considered valid in this setting.

To experiment with the counterpart to the quantitative models written for the
original Alloy, run the Alloy 5 provided with this artifact:
```
java -jar Alloy-5.0.0.1.jar
```
The examples are located in *benchmark/models/alloy/* instead, and they can be
executed analogously QAlloy, with the properties being solved using SAT Solvers
instead.

## Benchmark

Both the Alloy and QAlloy models used to benchmark QAlloy are available
in the *benchmark/models/* directory.
The *alloy/* subdirectory contains the models ran using Alloy 5 while the
*qalloy/* subdirectory is composed by the *.als* files containing the 
commands executed to evaluate the performance of QAlloy.
The results used to build the benchmark are compiled in the
*benchmark/times/* folder.
