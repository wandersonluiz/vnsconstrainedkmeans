function[MetaData Data textScanParam] = ExtractData(fileName)
% [numAttributes nameAttributes typeAttributes] = ReadData(fileName)
%       Extrai do arquivo ARFF informações de quantidade, nome e tipo
%       dos atributos. A partir desses metadados obter os dados

%->adequar a leitura do arquivo as extensões. 
% Coloca ARFF se não tiver.
if (length(fileName) <= 4) || ~strcmpi(fileName(end-4:end),'.ARFF')
    fileName = strcat(fileName,'.ARFF');
end

METAFILE = fileread(fileName);

regExp1 = '# Instances: \d*?\s';
[idxStart idxEnd] = regexpi(METAFILE,regExp1);
MetaData.numInstances = str2double(METAFILE(idxStart+14:idxEnd));

regExp1 = '# Attributes: \d*?\s';
[idxStart idxEnd] = regexpi(METAFILE,regExp1);
MetaData.numAttributes = str2double(METAFILE(idxStart+14:idxEnd));

regExp1 = '# class: \d*?\s';
[idxStart idxEnd] = regexpi(METAFILE,regExp1);
MetaData.numClass = str2double(METAFILE(idxStart+14:idxEnd));

regExp2 = '@ATTRIBUTE\s.*?\r';
[idxStart idxEnd] = regexpi(METAFILE,regExp2);
for i=1:MetaData.numAttributes
    rangeAux = idxStart(i)+11:idxEnd(i);
    auxLine = METAFILE(rangeAux);
    splitPoint = regexpi(auxLine,'\s');
    MetaData.nameAttributes{i} = strtrim(auxLine(1:splitPoint-1));
    MetaData.typeAttributes{i} = strtrim(auxLine(splitPoint+1:end));
end
%->Modificar os not Numeric/Real para String, ou seja, trocar f por s
% nas posições cujo o tipo é diferente de Numeric/Real

%Cria a string que será usada na entrada do TEXTSCAN
textScanParam(1:3*NumAttributes) = '%';
textScanParam(2:3:3*NumAttributes) = 'f';
textScanParam(2:3:3*NumAttributes) = ' ';
textScanParam = strcat(textScanParam, '%s %*[\r]');

for i=1:MetaData.numAttributes
    if (strcmpi(MetaData.typeAttributes{i},'NUMERIC') || ...
            strcmpi(MetaData.typeAttributes{i},'REAL'))
        textScanParam(3*i-1) = 's';
    end
end

%Extrai em Data, os dados do arquivo csv, em acordo com o 
%tipo específicado em textScanParam
fileName = strcat(fileName(1:end-4),'.CSV');
fid = fopen(fileName);
Data = textscan(fid,textScanParam,'delimiter',',');
fclose(fid);

%problemas de erros
for i=1:MetaData.numInstances
    if length(Data{i} ~= MetaData.numInstances;
        
    end
end
end