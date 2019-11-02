% Author: Yuanbo Peng <bobpeng.bham.uk@gmail.com>
% Create Date: 18.03.2019
% 
% oi: output values of input layer
% ih: input values of hidden layer
% oh: output values of hidden layer
% io: input values of output layer
% oo: output values of output layer

% Initialise the weights matrices W1 & W2
for a = 1:4

    for b = 1:2
        W2(a, b) = rand();
    end

end

for v = 1:2

    for s = 1:4
        W1(v, s) = rand();
    end

end

% Training patterns
training_sets = [
        1, 0, 0, 0;
        0, 1, 0, 0;
        0, 0, 1, 0;
        0, 0, 0, 1];

% Initialise bias values
b1 = [rand(), rand()];
b2 = [rand(), rand(), rand(), rand()];

% Training iterations
for q = 1:1000

    % Total error
    Err = 0.0;

    % Training each pattern
    for z = 1:4

        % Calculate the output values of input layer
        for k = 1:4
            oi(k, 1) = 1 / (1 + exp(-training_sets(k, z)));
        end

        % Calculate the input values of hidden layer
        ih = W1 * oi + b1';

        % Calculate the output values of hidden layer
        for a = 1:2
            oh(a, 1) = 1 / (1 + exp(-ih(a)));
        end

        % Calculate the input values of output layer
        io = W2 * oh + b2';

        % Calculate the output values of output layer
        for b = 1:4
            oo(b, 1) = 1 / (1 + exp(-io(b)));
        end

        % ---- Total error of each pattern through the MLP ----
        Eot = 0.0;

        for b = 1:4
            Eo(b) = 1/2 * (training_sets(b, z) - oo(b, 1))^2;
            Eot = Eot + Eo(b);
        end

        % ---- Error  Back-Propagation (EBP)  ----
        for d = 1:4
            delta(d) = (oo(d) - training_sets(d, z)) * oo(d) * (1 - oo(d));
        end

        % Calculate the delta weights of W2
        for c = 1:2
            delta_w2(:, c) = delta * oh(c);
        end

        % Calculate the delta weights of W1
        for f = 1:2

            for g = 1:4
                delta_w1(f, g) = delta * W2(:, f) * oh(f) * (1 - oh(f)) * oi(g);
            end

        end

        % Calculate the delta weights of bias 1
        for bias_1_w_num = 1:2
            delta_b1(bias_1_w_num) = delta * W2(:, bias_1_w_num) * oh(bias_1_w_num) * (1 - oh(bias_1_w_num));
        end

        % Learning rate
        learning_rate = 3;

        % Update W2, W1, bias 1, and bias 2
        W2 = W2 - learning_rate * delta_w2;
        W1 = W1 - learning_rate * delta_w1;
        b2 = b2 - learning_rate * delta;
        b1 = b1 - learning_rate * delta_b1;
    end

    % Collect each total error when each time of training
    Err = Err + Eot;
    Err_list(q) = Err;
end

% Draw the figure to show the changes of error
plot(Err_list)
xlabel('Times of Iterations')
ylabel('Total Error')

% Test part
for z = 1:4

    for k = 1:4
        oi(k, 1) = 1 / (1 + exp(-training_sets(k, z)));
    end

    ih = W1 * oi + b1';

    for a = 1:2
        oh(a, 1) = 1 / (1 + exp(-ih(a)));
    end

    io = W2 * oh + b2';

    for b = 1:4
        oo(b, 1) = 1 / (1 + exp(-io(b)));
    end

    oo;

    biased_result(:, z) = oo;
end

% Output the test result
biased_result
