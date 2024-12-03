// ** PLEASE ONLY CHANGE THIS FILE WHERE INDICATED **
// In particular, do not change the names of the variables.

int                    D = ...;
int              n[1..D] = ...;
int                    N = ...;
int              d[1..N] = ...;
float      m[1..N][1..N] = ...;

range nProf = 1..N;
range nDep = 1..D;
float avrg = 1.0;

// Define here your decision variables and
// any other auxiliary program variables you need.
// You can run an execute block if needed.

dvar boolean x_i[i in nProf];
dvar boolean y_ij[i in nProf, j in nProf];

//>>>>>>>>>>>>>>>>
execute {
    var numCom = 0;
    for (var i in nDep) numCom += n[i]
    avrg = 2.0 / (numCom * (numCom - 1));
}
//<<<<<<<<<<<<<<<<



// Write here the objective function.
maximize avrg * sum(i in nProf) sum(j in nProf : j > i) m[i][j] * y_ij[i][j];

subject to {
    //No two professors with 0 compatibility
    forall(i in nProf)
        forall(j in nProf: j > i)
            ceil(m[i][j]) >= x_i[i] + x_i[j] - 1;

    //Correlation between y_ij and x_i, x_j
    forall(i in nProf)
        forall(j in nProf: j > i) {
            x_i[i] >= y_ij[i][j];
            x_i[j] >= y_ij[i][j];
        }

    //Number of participants per department
    forall(p in nDep)
        sum(i in nProf : d[i] == p) x_i[i] == n[p];

    //If not get along well then extra professor
    forall(i in nProf)
        forall(j in nProf: j > i && m[i][j] < 0.15) {
            sum(k in nProf: m[i][k] > 0.85 && m[j][k] > 0.85) x_i[k] >= x_i[i] + x_i[j] - 1;
        }

}

execute {
    write("Commission: ");
    for (var i in nProf) if (x_i[i] == 1) write(i + " ");
}
