function [w, w0] = process_epoch(w, w0, lrate, examples_train, labels_train)
    % PROCESS_EPOCH
    % By: Nicholas Granlund
        
    % Randomize the order of data  
    indexes = randperm(length(examples_train));
    
    % Iterate through the training examples in the random order
    for i=1:length(indexes)

        % The index
        j = indexes(i);

        % Extract example and label
        example_train = examples_train{j};
        label_train = labels_train(j);

        % Compute partial gradient
        [wgrad, w0grad] = partial_gradient(w, w0, example_train, label_train);

        % Update w and bias w0
        w0 = w0 - (lrate * w0grad);
        w = w - (lrate * wgrad);
    end
end
