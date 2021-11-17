function BaggedEnsemble = random_forests(X,Y,iNumBags,str_method)


BaggedEnsemble = TreeBagger(iNumBags,X,Y,'OOBPred','On','Method',str_method);

