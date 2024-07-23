function validInterval = getSignalInterval(signal, compareSignal)
    % Ensure the inputs are column vectors
    signal = signal(:);
    compareSignal = compareSignal(:);
    
    % Find indices where compareSignal is not NaN or where compareSignal is greater than 0
    validIndices = find(~isnan(compareSignal) | compareSignal > 0);
    if isempty(validIndices)
        disp("no contact signal found");
        validInterval =[NaN NaN];
        return;
    end
    
    % If no NaNs found but values greater than 0 exist, create an interval from the first to the last value > 0
    if all(~isnan(compareSignal)) && any(compareSignal > 0)
        validInterval = [find(compareSignal > 0, 1, 'first'), find(compareSignal > 0, 1, 'last')];
        return;
    end
    
    % Find the continuous ranges of valid indices
    diffValidIndices = [diff(validIndices); Inf]; % Append Inf to handle the last interval
    intervalBreaks = find(diffValidIndices > 1);
    
    % Initialize intervals array
    validInterval = [];
    
    % Start index of the first interval
    startIndex = validIndices(1);
    for i = 1:length(intervalBreaks)
        endIndex = validIndices(intervalBreaks(i));
        validInterval = [validInterval; startIndex, endIndex]; % Append the interval
        
        if i < length(intervalBreaks)
            startIndex = validIndices(intervalBreaks(i) + 1);
        end
    end
end