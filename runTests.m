function runTests()
    if nargin == 0
        a = numC(4);
        b = numC(4);
        checkEqual(a, b)
        checkEqual(strC("hello"), strC ("hello"))
        checkEqual(boolC(true), boolC(true))
        
        %test interp (numC, strC, IdC, boolC, lamC, appC (primopC and
        %CloV))
        checkEqual(interp(numC(3), makeTopEnv()), numV(3))
        checkEqual(interp(strC("Hello"), makeTopEnv()), strV("Hello"))
        checkEqual(interp(boolC(true), makeTopEnv()), boolV(true))
        checkEqual(interp(lamC({numC(4)}, numC(4)), makeTopeEnv()), cloV({numC(4)}, numC(4), makeTopEnv()))
        checkEqual(interp(appC(idC("+"), [numC(4), numC(2)]), makeTopEnv()), 6)
        
        %test evaluatePrimop
        checkEqual(evaluatePrimop("+", [numV(4), numV(5)]), 9)
    end
end