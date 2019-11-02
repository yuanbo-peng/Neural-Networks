# Neural Networks

- Author: Yuanbo Peng <<bobpeng.bham.uk@gmail.com>>
- Create Date: 18.03.2019
- Project Name: Neural Networks
- Revision: 1.0

### The EBP Training Algorithm for an MLP Encoder

The project is to implement the Error Back-Propagation (EBP) training algorithm for a multi- layer perceptron (MLP) 4-2-4 encoder using MatLab. Intuitively the structure of the encoder is as shown below:

<div align=center>
    <img width="30%" src="http://gogo-static.yunxiangshijue.com/MLP.png"/>
</div>

- An input layer with 4 units.
- A single hidden layer with 2 units.
- An output layer with 4 units.

Each unit has a sigmoid activation function. The task of the encoder is to map the following inputs onto outputs:


<div align=center>

|Input Pattern|Output Pattern|
|:-:|:-:|
|1, 0, 0, 0|1, 0, 0, 0|
|0, 1, 0, 0|0, 1, 0, 0|
|0, 0, 1, 0|0, 0, 1, 0|
|0, 0, 0, 1|0, 0, 0, 1|

</div>


### Activation Functions

Activation functions are used for a neural network to learn and make sense of some data complicated and Non-linear complex functional mappings between the inputs and response variables. There are several commonly used activation functions to fit different data types better, such as ***Sigmoid***, ***Tanh***, and ***ReLu*** etc. In this case, the sigmoid function would be applied.

<div align=center>
    <img width="38%" src="http://gogo-static.yunxiangshijue.com/Sigmoid.png"/>
</div>

### Total Error Calculation

A training set consists of

- A set of input vectors 𝑖<sup>*1*</sup>, ..., 𝑖<sup>*N*</sup>, where the dimension of 𝑖<sup>*n*</sup> is equal to the number of MLP input units.
-  For each 𝑛, a target vector 𝑡<sup>*n*</sup>, where the dimension of 𝑡<sup>*n*</sup> is equal to the number of output units.

The error 𝐸 is defined by:

<div align=center>
    <img width="40%" src="http://gogo-static.yunxiangshijue.com/total_error.png"/>
</div>


### Weights Modification

Let the weights between input and hidden layer, hidden and output layer be two sets of matrices 𝑊1, 𝑊2. The size of these two matrices are 4 × 2, 2 × 4. The values in these two matrices are automatically generated. Each value in 𝑊2 and 𝑊1 needs to be updated after each iteration of forward propagation.


#### Update W2 (the weights between hidden and output layer)

The new weights between hidden and output layer are calculated by:

<div align=center>
    <img width="70%" src="http://gogo-static.yunxiangshijue.com/updateW2.png"/>
</div>

#### Update W1 (the weights between input and hidden layer)
The new weights between input and hidden layer are calculated by:

<div align=center>
    <img width="95%" src="http://gogo-static.yunxiangshijue.com/updateW1.png"/>
</div>


### An Improved EBP Training Algorithm

**Bias** is a constant which helps the model in a way that it can fit better for the given data. A bias unit is an ‘extra’ neuron which doesn’t have any incoming connections added to pre-output layer.

<div align=center>
    <img width="70%" src="http://gogo-static.yunxiangshijue.com/MLP_bias.png"/>
</div>

### Evaluation: Bias vs Non-bias

The MLP parameters are below:
 
- Learning rate: 6.0
- Number of iterations: 1000
- Initial weights in two systems are equal

<div align=center>
    <img width="40%" src="http://gogo-static.yunxiangshijue.com/non-bias-system.png"/>
    <img width="40%" src="http://gogo-static.yunxiangshijue.com/bias-system.png"/>
</div>

<div align=center>
    <img width="40%" src="http://gogo-static.yunxiangshijue.com/non-bias-result.png"/>
    <img width="40%" src="http://gogo-static.yunxiangshijue.com/biased-result.png"/>
</div>


