function dataStruct = loadAndExtractSignals(recSortedList, signalsToExtract)
    % Initialize an empty struct
    dataStruct = struct();

    % Loop through each file name in the sorted list
    for i = 1:length(recSortedList)
        fileName = recSortedList{i};
        
        % Load the file as a table
        fullTable = readtable(fileName,'VariableNamingRule','preserve');
        
        % Determine which of the desired signals exist in this table
        existingSignals = ismember(signalsToExtract, fullTable.Properties.VariableNames);
        
        % Extract only the existing signals
        if any(existingSignals)
            extractedTable = fullTable(:, signalsToExtract(existingSignals));
            
            % Store the extracted table in the struct
            % Using the file name (without extension) as the key
            keyName = erase(fileName, '.csv');
            dataStruct.(keyName) = extractedTable;
        else
            % Handle the case where none of the signals exist in the table
            % For example, log a warning
            warning(['None of the specified signals were found in ', fileName]);
        end
    end
end