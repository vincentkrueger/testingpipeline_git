classdef myTable < table
    properties
        identifier
    end
    methods
        function obj = myTable(t, id)
            obj = obj@table(t.Variables, 'VariableNames', t.Properties.VariableNames);
            obj.identifier = id;
        end
    end
end