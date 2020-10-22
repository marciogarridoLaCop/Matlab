function randomBits = geradorbits( numberOfBits )

lowerBound = 0; upperBound = 1;
randomBits = lowerBound + (upperBound-lowerBound).*rand(numberOfBits,1);
randomBits = round(randomBits)';
stairs(randomBits);
% ensure that they are close to 50%
numberOfOnes = sum(randomBits);
lengthRandomBits = length(randomBits);
numberOfZeros = lengthRandomBits - numberOfOnes;
onesPercent = (numberOfOnes/lengthRandomBits)*100;
zerosPercent = (numberOfZeros/lengthRandomBits)*100;

fprintf('Total percentual de bit 1''s and 0''s gerado. Total de Bits: %d \n', numberOfBits);
fprintf('[1] = %3.3f %% \t [0] = %3.3f %%\n', onesPercent, zerosPercent);

end
