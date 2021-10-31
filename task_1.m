try
    clear
    clc
    A = genArray('A');
    B = genArray('B');
    C = [1 4 1 1; 2 11 0 7; 2 8 3 11; -2 -8 -2 -1];
    
    clc
    disp('Введені користувачем масиви, A, B, та ініціований в явній формі масив C');
    A
    B
    C
    fprintf('Визначник A: %g\n', det(A));
    fprintf('Визначник B: %g\n', det(B));
    fprintf('Визначник C: %g\n', det(C));
catch ex
    disp('Помилка:');
    disp(ex.message);
end


function array = genArray(s)
ok = 1;
    while ok
        try
            fprintf('\nЗадайте розмірність масива %s:\n', s);
            n = input('Кількість рядків, та стовпців = ');
            
            if isempty(n)
                error('Потрібно вказати розмірність масива');
            elseif ~isnumeric(n)
                error('Потрібно вказати число');
            elseif n < 1
                error('Розмірність має бути додатним числом');
            end

            fprintf('Задайте значення елементів масива %s:\n', s);
            array = zeros(n);
            for i = 1 : n
                for j = 1 : n
                    ok_input = 1;
                    while ok_input
                        try
                            array(i,j) = input(sprintf('%s[%d][%d] = ', s, i,j));
                            if isempty(array(i,j))
                                ok_input = 1;
                                disp('Потрібно ввести значення');
                            elseif ~isnumeric(array(i,j))
                                ok_input = 1;
                                disp('Потрібно вказати число');
                            else
                                ok_input = 0;
                            end
                        catch
                            ok_input = 1;
                        end
                    end
                end
            end
            clc
            disp('Перевірте правильність введення:');
            fprintf('%s = \n\n',s);
            disp(array);
            choice = menu('Зберегти?', 'Так','Ні');
            if choice == 1
                ok = 0;
            else
                ok = 1;
            end
        catch ex
            ok = 1;
            clc
            disp('Помилка:');
            disp(ex.message);
        end
    end
end