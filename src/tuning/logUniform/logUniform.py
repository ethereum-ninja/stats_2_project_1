######################
# File containing log Uniform class and function
# Original Author: Marcos Lopez de Prado (from "Advances in Financial Machine Learning")
# Last Updated August 18, 2019
######################


import numpy as np
from scipy.stats import rv_continuous
import pandas as pd

class logUniform_gen(rv_continuous):
  def _cdf(self, x):
    return np.log(x/self.a)/np.log(self.b/self.a)

def logUniform(a=1, b=np.exp(1)):
  return logUniform_gen(a=a, b=b, name='logUniform')


vals = logUniform(a = 1, b = 100).rvs(size = 1000)
print(pd.Series(vals).to_string())
pd.Series(vals).to_csv("~/Development/Retention/analysis/tuning/logUniform/lambdaparams.csv")