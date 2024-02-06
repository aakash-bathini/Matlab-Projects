function [] = A10Prob3_wordle_abathin()
%% ____________________
%% INITIALIZATION

%Set game output up and space for each guess
gameOutput = '-----';
userGuess = ' ';

%Set initial guess count and number of guesses permitted and while loop count
guessCount = 0;
max_guess = 6;
countIteration = 0;

% Call UDF to get 5 letter solution word from pre-defined dictionary
solution = wordle_dictionary(4004);


%% ____________________
%% CALCULATIONS

% Display instructions to user
disp('Enter a 5 Letter Word Guess! Try to guess the word in 6 guesses or less!');

% Loop until the max guesses is reached
while countIteration ~= max_guess && ~strcmp(solution, userGuess)
    
    %Make sure user guess is 5 letters long
    userGuess = input(sprintf('Guess %d:  ', guessCount + 1), 's');
    while length(userGuess) ~= 5
        disp('Not a Valid Entry. Please Try Again!');
        userGuess = input(sprintf('Guess %d: ', guessCount + 1), 's');
    end
    
    % Check if correct letters are in the right position
    if strcmp(userGuess(1), solution(1))
        gameOutput(1) = solution(1);
    elseif strcmp(userGuess(1), solution(2)) || strcmp(userGuess(1), solution(3)) || strcmp(userGuess(1), solution(4)) || strcmp(userGuess(1), solution(5))
        gameOutput(1) = '*';
    end
   
    if strcmp(userGuess(2), solution(2))
        gameOutput(2) = solution(2);
    elseif strcmp(userGuess(2), solution(1)) || strcmp(userGuess(2), solution(3)) || strcmp(userGuess(2), solution(4)) || strcmp(userGuess(2), solution(5))
        gameOutput(2) = '*';
    end
   
    if strcmp(userGuess(3), solution(3))
        gameOutput(3) = solution(3);
    elseif strcmp(userGuess(3), solution(1)) || strcmp(userGuess(3), solution(2)) || strcmp(userGuess(3), solution(4)) || strcmp(userGuess(3), solution(5))
        gameOutput(3) = '*';
    end
   
    if strcmp(userGuess(4), solution(4))
        gameOutput(4) = solution(4);
    elseif strcmp(userGuess(4), solution(1)) || strcmp(userGuess(4), solution(2)) || strcmp(userGuess(4), solution(3)) || strcmp(userGuess(4), solution(5))
        gameOutput(4) = '*';
    end
   
    if strcmp(userGuess(5), solution(5))
        gameOutput(5) = solution(5);
    elseif strcmp(userGuess(5), solution(1)) || strcmp(userGuess(5), solution(2)) || strcmp(userGuess(5), solution(3)) || strcmp(userGuess(5), solution(4))
        gameOutput(5) = '*';
    end
    
    % Display the guess' result and increment the guess and while loop count
    disp(['Result ', num2str(guessCount+1), ': ', gameOutput]);
    guessCount = guessCount + 1;
    countIteration = countIteration + 1;
end


%% ____________________
%% FORMATTED TEXT/FIGURE DISPLAYS

%If wordle solved under max number of guesses, then display congrats
if strcmp(solution, userGuess)
    disp(['Congrats! You solved this wordle in ', num2str(guessCount), ' attempts']);
else
    fprintf('You could not solve this wordle in %d guesses. The word was %s.\n', max_guess, solution); %Otherwise, display correct word.
end


