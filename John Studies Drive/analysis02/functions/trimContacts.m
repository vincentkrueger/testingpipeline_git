function resultContact = trimContacts(contacts, signal)
    % Find indices of NaNs in the signal
    nanIndices = isnan(signal);
    
    % Check if there are no NaNs in the signal
    if ~any(nanIndices)
        warning('No NaNs found in the signal.');
    end
    
    % Initialize resultContact with the same size as signal
    resultContact = contacts;
    
    % Insert NaNs into resultContact at the positions where signal has NaNs
    resultContact(nanIndices) = NaN;
end