function sections = splitStringAtCapitalLetter(str)
    % Initialize an empty cell array to hold the sections
    sections = {};
    % Initialize a variable to keep track of the start of the current section
    startIdx = 1;
    
    % Loop through each character in the string
    for i = 2:length(str)
        % Check if the current character is a capital letter
        if isstrprop(str(i), 'upper')
            % If it is, add the substring from the start index to the character before the current one to the sections array
            sections{end+1} = str(startIdx:i-1);
            % Update the start index to the current character's index
            startIdx = i;
        end
    end
    
    % Add the last section to the sections array
    sections{end+1} = str(startIdx:end);
end