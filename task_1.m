try
    clear
    clc
    A = genArray('A');
    B = genArray('B');
    C = [1 4 1 1; 2 11 0 7; 2 8 3 11; -2 -8 -2 -1];
    
    clc
    disp('������ ������������ ������, A, B, �� ���������� � ���� ���� ����� C');
    A
    B
    C
    fprintf('��������� A: %g\n', det(A));
    fprintf('��������� B: %g\n', det(B));
    fprintf('��������� C: %g\n', det(C));
catch ex
    disp('�������:');
    disp(ex.message);
end


function array = genArray(s)
ok = 1;
    while ok
        try
            fprintf('\n������� ��������� ������ %s:\n', s);
            n = input('ʳ������ �����, �� �������� = ');
            
            if isempty(n)
                error('������� ������� ��������� ������');
            elseif ~isnumeric(n)
                error('������� ������� �����');
            elseif n < 1
                error('��������� �� ���� �������� ������');
            end

            fprintf('������� �������� �������� ������ %s:\n', s);
            array = zeros(n);
            for i = 1 : n
                for j = 1 : n
                    ok_input = 1;
                    while ok_input
                        try
                            array(i,j) = input(sprintf('%s[%d][%d] = ', s, i,j));
                            if isempty(array(i,j))
                                ok_input = 1;
                                disp('������� ������ ��������');
                            elseif ~isnumeric(array(i,j))
                                ok_input = 1;
                                disp('������� ������� �����');
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
            disp('�������� ����������� ��������:');
            fprintf('%s = \n\n',s);
            disp(array);
            choice = menu('��������?', '���','ͳ');
            if choice == 1
                ok = 0;
            else
                ok = 1;
            end
        catch ex
            ok = 1;
            clc
            disp('�������:');
            disp(ex.message);
        end
    end
end