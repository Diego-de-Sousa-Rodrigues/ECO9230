%
% Status : main Dynare file
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

clearvars -global
clear_persistent_variables(fileparts(which('dynare')), false)
tic0 = tic;
% Define global variables.
global M_ options_ oo_ estim_params_ bayestopt_ dataset_ dataset_info estimation_info
options_ = [];
M_.fname = 'rbc';
M_.dynare_version = '6.4';
oo_.dynare_version = '6.4';
options_.dynare_version = '6.4';
%
% Some global variables initialization
%
global_initialization;
M_.exo_names = cell(1,1);
M_.exo_names_tex = cell(1,1);
M_.exo_names_long = cell(1,1);
M_.exo_names(1) = {'e'};
M_.exo_names_tex(1) = {'e'};
M_.exo_names_long(1) = {'e'};
M_.endo_names = cell(7,1);
M_.endo_names_tex = cell(7,1);
M_.endo_names_long = cell(7,1);
M_.endo_names(1) = {'y'};
M_.endo_names_tex(1) = {'y'};
M_.endo_names_long(1) = {'y'};
M_.endo_names(2) = {'c'};
M_.endo_names_tex(2) = {'c'};
M_.endo_names_long(2) = {'c'};
M_.endo_names(3) = {'k'};
M_.endo_names_tex(3) = {'k'};
M_.endo_names_long(3) = {'k'};
M_.endo_names(4) = {'i'};
M_.endo_names_tex(4) = {'i'};
M_.endo_names_long(4) = {'i'};
M_.endo_names(5) = {'h'};
M_.endo_names_tex(5) = {'h'};
M_.endo_names_long(5) = {'h'};
M_.endo_names(6) = {'r'};
M_.endo_names_tex(6) = {'r'};
M_.endo_names_long(6) = {'r'};
M_.endo_names(7) = {'z'};
M_.endo_names_tex(7) = {'z'};
M_.endo_names_long(7) = {'z'};
M_.endo_partitions = struct();
M_.param_names = cell(5,1);
M_.param_names_tex = cell(5,1);
M_.param_names_long = cell(5,1);
M_.param_names(1) = {'beta'};
M_.param_names_tex(1) = {'beta'};
M_.param_names_long(1) = {'beta'};
M_.param_names(2) = {'psi'};
M_.param_names_tex(2) = {'psi'};
M_.param_names_long(2) = {'psi'};
M_.param_names(3) = {'delta'};
M_.param_names_tex(3) = {'delta'};
M_.param_names_long(3) = {'delta'};
M_.param_names(4) = {'theta'};
M_.param_names_tex(4) = {'theta'};
M_.param_names_long(4) = {'theta'};
M_.param_names(5) = {'rho'};
M_.param_names_tex(5) = {'rho'};
M_.param_names_long(5) = {'rho'};
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 1;
M_.endo_nbr = 7;
M_.param_nbr = 5;
M_.orig_endo_nbr = 7;
M_.aux_vars = [];
M_.Sigma_e = zeros(1, 1);
M_.Correlation_matrix = eye(1, 1);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = true;
M_.det_shocks = [];
M_.surprise_shocks = [];
M_.learnt_shocks = [];
M_.learnt_endval = [];
M_.heteroskedastic_shocks.Qvalue_orig = [];
M_.heteroskedastic_shocks.Qscale_orig = [];
M_.matched_irfs = {};
M_.matched_irfs_weights = {};
options_.linear = false;
options_.block = false;
options_.bytecode = false;
options_.use_dll = false;
options_.ramsey_policy = false;
options_.discretionary_policy = false;
M_.eq_nbr = 7;
M_.ramsey_orig_eq_nbr = 0;
M_.ramsey_orig_endo_nbr = 0;
M_.set_auxiliary_variables = exist(['./+' M_.fname '/set_auxiliary_variables.m'], 'file') == 2;
M_.epilogue_names = {};
M_.epilogue_var_list_ = {};
M_.orig_maximum_endo_lag = 1;
M_.orig_maximum_endo_lead = 1;
M_.orig_maximum_exo_lag = 0;
M_.orig_maximum_exo_lead = 0;
M_.orig_maximum_exo_det_lag = 0;
M_.orig_maximum_exo_det_lead = 0;
M_.orig_maximum_lag = 1;
M_.orig_maximum_lead = 1;
M_.orig_maximum_lag_with_diffs_expanded = 1;
M_.lead_lag_incidence = [
 0 3 0;
 0 4 10;
 1 5 0;
 0 6 0;
 0 7 11;
 0 8 0;
 2 9 12;]';
M_.nstatic = 3;
M_.nfwrd   = 2;
M_.npred   = 1;
M_.nboth   = 1;
M_.nsfwrd   = 3;
M_.nspred   = 2;
M_.ndynamic   = 4;
M_.dynamic_tmp_nbr = [8; 3; 0; 0; ];
M_.equations_tags = {
  1 , 'name' , '1' ;
  2 , 'name' , '2' ;
  3 , 'name' , '3' ;
  4 , 'name' , 'y' ;
  5 , 'name' , 'i' ;
  6 , 'name' , 'r' ;
  7 , 'name' , 'z' ;
};
M_.mapping.y.eqidx = [3 4 6 ];
M_.mapping.c.eqidx = [1 2 3 ];
M_.mapping.k.eqidx = [1 2 4 5 6 ];
M_.mapping.i.eqidx = [3 5 ];
M_.mapping.h.eqidx = [1 2 4 ];
M_.mapping.r.eqidx = [6 ];
M_.mapping.z.eqidx = [1 2 4 7 ];
M_.mapping.e.eqidx = [7 ];
M_.static_and_dynamic_models_differ = false;
M_.has_external_function = false;
M_.block_structure.time_recursive = false;
M_.block_structure.block(1).Simulation_Type = 1;
M_.block_structure.block(1).endo_nbr = 1;
M_.block_structure.block(1).mfs = 1;
M_.block_structure.block(1).equation = [ 7];
M_.block_structure.block(1).variable = [ 7];
M_.block_structure.block(1).is_linear = true;
M_.block_structure.block(1).NNZDerivatives = 2;
M_.block_structure.block(1).bytecode_jacob_cols_to_sparse = [1 2 ];
M_.block_structure.block(2).Simulation_Type = 8;
M_.block_structure.block(2).endo_nbr = 5;
M_.block_structure.block(2).mfs = 5;
M_.block_structure.block(2).equation = [ 3 4 5 2 1];
M_.block_structure.block(2).variable = [ 4 1 3 5 2];
M_.block_structure.block(2).is_linear = false;
M_.block_structure.block(2).NNZDerivatives = 16;
M_.block_structure.block(2).bytecode_jacob_cols_to_sparse = [3 6 7 8 9 10 14 15 ];
M_.block_structure.block(3).Simulation_Type = 1;
M_.block_structure.block(3).endo_nbr = 1;
M_.block_structure.block(3).mfs = 1;
M_.block_structure.block(3).equation = [ 6];
M_.block_structure.block(3).variable = [ 6];
M_.block_structure.block(3).is_linear = true;
M_.block_structure.block(3).NNZDerivatives = 1;
M_.block_structure.block(3).bytecode_jacob_cols_to_sparse = [2 ];
M_.block_structure.block(1).g1_sparse_rowval = int32([]);
M_.block_structure.block(1).g1_sparse_colval = int32([]);
M_.block_structure.block(1).g1_sparse_colptr = int32([]);
M_.block_structure.block(2).g1_sparse_rowval = int32([2 3 4 1 3 1 2 3 5 2 4 1 4 5 5 5 ]);
M_.block_structure.block(2).g1_sparse_colval = int32([3 3 3 6 6 7 7 8 8 9 9 10 10 10 14 15 ]);
M_.block_structure.block(2).g1_sparse_colptr = int32([1 1 1 4 4 4 6 8 10 12 15 15 15 15 16 17 ]);
M_.block_structure.block(3).g1_sparse_rowval = int32([]);
M_.block_structure.block(3).g1_sparse_colval = int32([]);
M_.block_structure.block(3).g1_sparse_colptr = int32([]);
M_.block_structure.variable_reordered = [ 7 4 1 3 5 2 6];
M_.block_structure.equation_reordered = [ 7 3 4 5 2 1 6];
M_.block_structure.incidence(1).lead_lag = -1;
M_.block_structure.incidence(1).sparse_IM = [
 2 3;
 4 3;
 5 3;
 7 7;
];
M_.block_structure.incidence(2).lead_lag = 0;
M_.block_structure.incidence(2).sparse_IM = [
 1 2;
 1 3;
 2 2;
 2 5;
 2 7;
 3 1;
 3 2;
 3 4;
 4 1;
 4 5;
 4 7;
 5 3;
 5 4;
 6 1;
 6 3;
 6 6;
 7 7;
];
M_.block_structure.incidence(3).lead_lag = 1;
M_.block_structure.incidence(3).sparse_IM = [
 1 2;
 1 5;
 1 7;
];
M_.block_structure.dyn_tmp_nbr = 9;
M_.state_var = [7 3 ];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(7, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(1, 1);
M_.params = NaN(5, 1);
M_.endo_trends = struct('deflator', cell(7, 1), 'log_deflator', cell(7, 1), 'growth_factor', cell(7, 1), 'log_growth_factor', cell(7, 1));
M_.NNZDerivatives = [25; -1; -1; ];
M_.dynamic_g1_sparse_rowval = int32([2 4 5 7 3 4 6 1 2 3 1 5 6 3 5 2 4 6 2 4 7 1 1 1 7 ]);
M_.dynamic_g1_sparse_colval = int32([3 3 3 7 8 8 8 9 9 9 10 10 10 11 11 12 12 13 14 14 14 16 19 21 22 ]);
M_.dynamic_g1_sparse_colptr = int32([1 1 1 4 4 4 4 5 8 11 14 16 18 19 22 22 23 23 23 24 24 25 26 ]);
M_.lhs = {
'1/c'; 
'c*psi/(1-h)'; 
'c+i'; 
'y'; 
'i'; 
'r'; 
'z'; 
};
M_.static_tmp_nbr = [7; 2; 0; 0; ];
M_.block_structure_stat.block(1).Simulation_Type = 3;
M_.block_structure_stat.block(1).endo_nbr = 1;
M_.block_structure_stat.block(1).mfs = 1;
M_.block_structure_stat.block(1).equation = [ 7];
M_.block_structure_stat.block(1).variable = [ 7];
M_.block_structure_stat.block(2).Simulation_Type = 6;
M_.block_structure_stat.block(2).endo_nbr = 5;
M_.block_structure_stat.block(2).mfs = 5;
M_.block_structure_stat.block(2).equation = [ 2 3 4 5 1];
M_.block_structure_stat.block(2).variable = [ 5 2 1 4 3];
M_.block_structure_stat.block(3).Simulation_Type = 1;
M_.block_structure_stat.block(3).endo_nbr = 1;
M_.block_structure_stat.block(3).mfs = 1;
M_.block_structure_stat.block(3).equation = [ 6];
M_.block_structure_stat.block(3).variable = [ 6];
M_.block_structure_stat.variable_reordered = [ 7 5 2 1 4 3 6];
M_.block_structure_stat.equation_reordered = [ 7 2 3 4 5 1 6];
M_.block_structure_stat.incidence.sparse_IM = [
 1 2;
 1 3;
 1 5;
 1 7;
 2 2;
 2 3;
 2 5;
 2 7;
 3 1;
 3 2;
 3 4;
 4 1;
 4 3;
 4 5;
 4 7;
 5 3;
 5 4;
 6 1;
 6 3;
 6 6;
 7 7;
];
M_.block_structure_stat.tmp_nbr = 9;
M_.block_structure_stat.block(1).g1_sparse_rowval = int32([1 ]);
M_.block_structure_stat.block(1).g1_sparse_colval = int32([1 ]);
M_.block_structure_stat.block(1).g1_sparse_colptr = int32([1 2 ]);
M_.block_structure_stat.block(2).g1_sparse_rowval = int32([1 3 5 1 2 5 2 3 2 4 1 3 4 5 ]);
M_.block_structure_stat.block(2).g1_sparse_colval = int32([1 1 1 2 2 2 3 3 4 4 5 5 5 5 ]);
M_.block_structure_stat.block(2).g1_sparse_colptr = int32([1 4 7 9 11 15 ]);
M_.block_structure_stat.block(3).g1_sparse_rowval = int32([]);
M_.block_structure_stat.block(3).g1_sparse_colval = int32([]);
M_.block_structure_stat.block(3).g1_sparse_colptr = int32([]);
M_.static_g1_sparse_rowval = int32([3 4 6 1 2 3 1 2 4 5 6 3 5 1 2 4 6 1 2 4 7 ]);
M_.static_g1_sparse_colval = int32([1 1 1 2 2 2 3 3 3 3 3 4 4 5 5 5 6 7 7 7 7 ]);
M_.static_g1_sparse_colptr = int32([1 4 7 12 14 17 18 22 ]);
close all;
M_.params(4) = 0.33;
theta = M_.params(4);
M_.params(1) = 0.99;
beta = M_.params(1);
M_.params(3) = 0.025;
delta = M_.params(3);
M_.params(2) = 1.72;
psi = M_.params(2);
M_.params(5) = 0.95;
rho = M_.params(5);
sigma   = (0.000010299)^(1/2);                                                           
%
% INITVAL instructions
%
options_.initval_file = false;
oo_.steady_state(1) = 1.2353;
oo_.steady_state(3) = 12.6695;
oo_.steady_state(2) = 0.9186;
oo_.steady_state(5) = 0.33;
oo_.steady_state(4) = 0.316738;
oo_.steady_state(7) = 0;
oo_.exo_steady_state(1) = 0;
oo_.steady_state(6) = 0.0351;
if M_.exo_nbr > 0
	oo_.exo_simul = ones(M_.maximum_lag,1)*oo_.exo_steady_state';
end
if M_.exo_det_nbr > 0
	oo_.exo_det_simul = ones(M_.maximum_lag,1)*oo_.exo_det_steady_state';
end
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = sigma^2;
steady;
options_.hp_filter = 1600;
options_.order = 1;
var_list_ = {};
[info, oo_, options_, M_] = stoch_simul(M_, options_, oo_, var_list_);
statistic1 = 100*sqrt(diag(oo_.var(1:6,1:6)))./oo_.mean(1:6);
dyntable('Relative standard deviations in %',strvcat('VARIABLE','REL. S.D.'),M_.endo_names(1:6,:),statistic1,10,8,4);


oo_.time = toc(tic0);
disp(['Total computing time : ' dynsec2hms(oo_.time) ]);
if ~exist([M_.dname filesep 'Output'],'dir')
    mkdir(M_.dname,'Output');
end
save([M_.dname filesep 'Output' filesep 'rbc_results.mat'], 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'rbc_results.mat'], 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'rbc_results.mat'], 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'rbc_results.mat'], 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'rbc_results.mat'], 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'rbc_results.mat'], 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'rbc_results.mat'], 'oo_recursive_', '-append');
end
if exist('options_mom_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'rbc_results.mat'], 'options_mom_', '-append');
end
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
