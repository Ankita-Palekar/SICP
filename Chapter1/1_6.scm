It evaluates to infinte because in applicative order evaluation it keeps on expanding untill it finds the returned value

In case of if statement (default one) it evaluates the predicate and if result is false it will not evaluate the next condition and if true it will stop at that point itself

But in the case of new-if it evaluates both the conditions and hence it goes into the infinite loop i.e even if the condition evaluates to be true it will go and execute the else part since the parameter is been provided
