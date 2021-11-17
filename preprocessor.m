function [matrix_normalized, target] = preprocessor(alldata)

% All files in the directory manually defined
output_pdf = {'PDF_sample.csv'};
delete(output_pdf{1});

% define all protocols to be normalized
protocol_type = {'tcp';'udp';'icmp';'arp'}; % you can define more
Nprotocol = size(protocol_type,1); % how many protocols
M = zeros(Nprotocol,1); % save the amount of each protocol
pdf_p = zeros(Nprotocol,1); % probability of each protocol

% The Flag in KDD has the following values:
flag = {'OTH';'REJ';'RSTO';'RSTOS0';'RSTR';'RSTRH';'S0';'S1';'S2';'S3';'SF';'SH';'SHR'};
Nflag = size(flag,1); % find number of flag
F = zeros(Nflag,1); % create a zeros arry with one column only
pdf_f = zeros(Nflag,1); % probability of each flag

service = {'aol'; 'http_443'; 'http_8001'; 'http_2784';...
    'domain_u'; 'ftp_data'; 'auth'; 'bgp'; 'courier';...
    'tftp_u'; 'uucp_path'; 'csnet_ns'; 'ctf';...
    'daytime';'time'; 'discard'; 'domain'; 'echo';...
    'eco_i'; 'ecr_i'; 'efs'; 'exec'; 'finger'; 'gopher';...
    'harvest'; 'hostnames'; 'http'; 'imap4'; 'IRC';...
    'iso_tsap'; 'klogin'; 'kshell'; 'ldap'; 'link';...
    'login'; 'smtp'; 'mtp'; 'name';...
    'netbios_dgm'; 'netbios_ns'; 'netbios_ssn'; 'netstat';...
    'nnsp'; 'nntp'; 'ntp_u'; 'other'; 'pm_dump'; 'pop_2';...
    'pop_3'; 'printer'; 'private'; 'red_i'; 'remote_job'; ...
    'rje'; 'shell'; 'sql_net'; 'ssh'; 'sunrpc';...
    'supdup'; 'systat'; 'telnet'; 'tim_i';...
    'urh_i'; 'urp_i'; 'uucp';'ftp'; 'vmnet';...
    'whois'; 'X11'; 'Z39_50'};
Nservice = size(service,1); % return number of services
N = zeros(Nservice,1); % create a zeros arry with one column only
pdf_s = zeros(Nservice,1); % probability of each service 


% find numbers
containsNumbers = cellfun(@isnumeric,alldata);

% convert to string
alldata(containsNumbers) = cellfun(@num2str,alldata(containsNumbers),'UniformOutput',false);
row_count = size(alldata,1); % number of rows

% unfortunately you have to determin each nominal column manually
proto_col = alldata(:,2); % determine protocol type column
flag_col = alldata(:,4); % determine flag column
service_col = alldata(:,3); %Service column
tar_col = alldata(:,end); % target

% calculate the probabilities of the protocol type
for i = 1 : Nprotocol
    M(i) = sum(strcmp(protocol_type(i),proto_col));
    pdf_p(i) = M(i)/row_count;
end

% replace all probability values for protocol type nominal to numeric
for p = 1 : length(protocol_type)
    proto_col = strrep(proto_col,protocol_type{p},num2str(pdf_p(p)));
end

% claculate probabilities of flag
for i = 1 : Nflag
    F(i) = sum(strcmp(flag(i),flag_col));
    pdf_f(i) = F(i)/row_count;
end

% replace probabilities of flag nominal to numeric
for fg = 1 : length(flag)
    flag_col = strrep(flag_col,flag{fg},num2str(pdf_f(fg)));
end

% Service column calculation and replacement
for i = 1 : Nservice
    N(i) = sum(strcmp(service(i),service_col));
    pdf_s(i) = N(i)/row_count;
end

% replace all probability values for protocol type nominal to numeric
for s = 1 : length(service)
    service_col = strrep(service_col,service{s},num2str(pdf_s(s)));
end

% replace all target
for t = 1 : length(tar_col)
    if strcmp('normal',tar_col(t))
        tar_col{t} = '1';
    else
        tar_col{t} = '2';
    end
end
% Set all values back to the main cell matrix file
alldata(:,2) = proto_col;
alldata(:,4) = flag_col;
alldata(:,3) = service_col;
alldata(:,end) = tar_col;

% read the PDF file to start normalization
fid = fopen(output_pdf{1},'wt');
for i = 1 : row_count
    fprintf(fid,'%s,',alldata{i,1:end-1});
    fprintf(fid,'%s\n',alldata{i,end});
end
fclose(fid);

% Normalization
% Load the Dataset from xls File
data = load (output_pdf{1});
col_count = size(data,2); % number of columns
raw_matrix = data;
target = data(:,end);

% loops to select each feature and normalize it individually
for i = 1 : col_count-1
    
    selected_column = raw_matrix(:,i);
    maximum = max(selected_column);
    minimum = min(selected_column);
    if maximum > 1
        for j = 1 : size(selected_column,1)
            if selected_column(j) == 0
                matrix_normalized(j,i) = 0;
            else
                matrix_normalized(j,i) = (selected_column(j)-minimum) / (maximum - minimum);
            end
        end
    else
        for j = 1 : size(selected_column,1)
            matrix_normalized(j,i) = selected_column(j); % do not normalize and save the values directly
        end
    end
end