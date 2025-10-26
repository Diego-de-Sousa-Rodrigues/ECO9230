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
M_.fname = 'NewKeynesian';
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
M_.endo_names = cell(11,1);
M_.endo_names_tex = cell(11,1);
M_.endo_names_long = cell(11,1);
M_.endo_names(1) = {'Y'};
M_.endo_names_tex(1) = {'Y'};
M_.endo_names_long(1) = {'Y'};
M_.endo_names(2) = {'I'};
M_.endo_names_tex(2) = {'I'};
M_.endo_names_long(2) = {'I'};
M_.endo_names(3) = {'C'};
M_.endo_names_tex(3) = {'C'};
M_.endo_names_long(3) = {'C'};
M_.endo_names(4) = {'R'};
M_.endo_names_tex(4) = {'R'};
M_.endo_names_long(4) = {'R'};
M_.endo_names(5) = {'K'};
M_.endo_names_tex(5) = {'K'};
M_.endo_names_long(5) = {'K'};
M_.endo_names(6) = {'W'};
M_.endo_names_tex(6) = {'W'};
M_.endo_names_long(6) = {'W'};
M_.endo_names(7) = {'L'};
M_.endo_names_tex(7) = {'L'};
M_.endo_names_long(7) = {'L'};
M_.endo_names(8) = {'MC'};
M_.endo_names_tex(8) = {'MC'};
M_.endo_names_long(8) = {'MC'};
M_.endo_names(9) = {'P'};
M_.endo_names_tex(9) = {'P'};
M_.endo_names_long(9) = {'P'};
M_.endo_names(10) = {'PI'};
M_.endo_names_tex(10) = {'PI'};
M_.endo_names_long(10) = {'PI'};
M_.endo_names(11) = {'A'};
M_.endo_names_tex(11) = {'A'};
M_.endo_names_long(11) = {'A'};
M_.endo_partitions = struct();
M_.param_names = cell(8,1);
M_.param_names_tex = cell(8,1);
M_.param_names_long = cell(8,1);
M_.param_names(1) = {'sigma'};
M_.param_names_tex(1) = {'sigma'};
M_.param_names_long(1) = {'sigma'};
M_.param_names(2) = {'phi'};
M_.param_names_tex(2) = {'phi'};
M_.param_names_long(2) = {'phi'};
M_.param_names(3) = {'alpha'};
M_.param_names_tex(3) = {'alpha'};
M_.param_names_long(3) = {'alpha'};
M_.param_names(4) = {'beta'};
M_.param_names_tex(4) = {'beta'};
M_.param_names_long(4) = {'beta'};
M_.param_names(5) = {'delta'};
M_.param_names_tex(5) = {'delta'};
M_.param_names_long(5) = {'delta'};
M_.param_names(6) = {'rhoa'};
M_.param_names_tex(6) = {'rhoa'};
M_.param_names_long(6) = {'rhoa'};
M_.param_names(7) = {'psi'};
M_.param_names_tex(7) = {'psi'};
M_.param_names_long(7) = {'psi'};
M_.param_names(8) = {'theta'};
M_.param_names_tex(8) = {'theta'};
M_.param_names_long(8) = {'theta'};
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 1;
M_.endo_nbr = 11;
M_.param_nbr = 8;
M_.orig_endo_nbr = 11;
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
options_.linear = true;
options_.block = false;
options_.bytecode = false;
options_.use_dll = false;
options_.ramsey_policy = false;
options_.discretionary_policy = false;
M_.nonzero_hessian_eqs = [];
M_.hessian_eq_zero = isempty(M_.nonzero_hessian_eqs);
M_.eq_nbr = 11;
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
 0 4 0;
 0 5 0;
 0 6 15;
 0 7 16;
 1 8 0;
 0 9 0;
 0 10 0;
 0 11 0;
 2 12 17;
 0 13 18;
 3 14 0;]';
M_.nstatic = 5;
M_.nfwrd   = 3;
M_.npred   = 2;
M_.nboth   = 1;
M_.nsfwrd   = 4;
M_.nspred   = 3;
M_.ndynamic   = 6;
M_.dynamic_tmp_nbr = [7; 0; 0; 0; ];
M_.equations_tags = {
  1 , 'name' , '1' ;
  2 , 'name' , '2' ;
  3 , 'name' , 'K' ;
  4 , 'name' , 'Y' ;
  5 , 'name' , '5' ;
  6 , 'name' , 'L' ;
  7 , 'name' , 'MC' ;
  8 , 'name' , 'PI' ;
  9 , 'name' , '9' ;
  10 , 'name' , '10' ;
  11 , 'name' , 'A' ;
};
M_.mapping.Y.eqidx = [4 5 6 10 ];
M_.mapping.I.eqidx = [3 10 ];
M_.mapping.C.eqidx = [1 2 10 ];
M_.mapping.R.eqidx = [2 5 7 ];
M_.mapping.K.eqidx = [3 4 5 ];
M_.mapping.W.eqidx = [1 6 7 ];
M_.mapping.L.eqidx = [1 4 6 ];
M_.mapping.MC.eqidx = [7 8 ];
M_.mapping.P.eqidx = [1 2 8 9 ];
M_.mapping.PI.eqidx = [8 9 ];
M_.mapping.A.eqidx = [4 7 11 ];
M_.mapping.e.eqidx = [11 ];
M_.static_and_dynamic_models_differ = false;
M_.has_external_function = false;
M_.block_structure.time_recursive = false;
M_.block_structure.block(1).Simulation_Type = 1;
M_.block_structure.block(1).endo_nbr = 1;
M_.block_structure.block(1).mfs = 1;
M_.block_structure.block(1).equation = [ 11];
M_.block_structure.block(1).variable = [ 11];
M_.block_structure.block(1).is_linear = true;
M_.block_structure.block(1).NNZDerivatives = 2;
M_.block_structure.block(1).bytecode_jacob_cols_to_sparse = [1 2 ];
M_.block_structure.block(2).Simulation_Type = 8;
M_.block_structure.block(2).endo_nbr = 10;
M_.block_structure.block(2).mfs = 8;
M_.block_structure.block(2).equation = [ 6 7 4 10 1 3 9 2 5 8];
M_.block_structure.block(2).variable = [ 7 8 1 2 6 5 9 3 4 10];
M_.block_structure.block(2).is_linear = true;
M_.block_structure.block(2).NNZDerivatives = 31;
M_.block_structure.block(2).bytecode_jacob_cols_to_sparse = [4 5 0 0 9 10 11 12 13 14 15 16 21 22 23 24 ];
M_.block_structure.block(1).g1_sparse_rowval = int32([]);
M_.block_structure.block(1).g1_sparse_colval = int32([]);
M_.block_structure.block(1).g1_sparse_colptr = int32([]);
M_.block_structure.block(2).g1_sparse_rowval = int32([1 4 7 5 1 2 3 7 2 4 1 3 8 4 3 5 8 2 3 6 7 8 5 8 6 6 6 8 ]);
M_.block_structure.block(2).g1_sparse_colval = int32([4 4 4 5 9 9 9 9 10 10 11 11 11 12 13 13 13 14 14 14 15 15 16 16 21 22 23 24 ]);
M_.block_structure.block(2).g1_sparse_colptr = int32([1 1 1 1 4 5 5 5 5 9 11 14 15 18 21 23 25 25 25 25 25 26 27 28 29 ]);
M_.block_structure.variable_reordered = [ 11 7 8 1 2 6 5 9 3 4 10];
M_.block_structure.equation_reordered = [ 11 6 7 4 10 1 3 9 2 5 8];
M_.block_structure.incidence(1).lead_lag = -1;
M_.block_structure.incidence(1).sparse_IM = [
 3 5;
 4 5;
 5 5;
 9 9;
 11 11;
];
M_.block_structure.incidence(2).lead_lag = 0;
M_.block_structure.incidence(2).sparse_IM = [
 1 3;
 1 6;
 1 7;
 1 9;
 2 3;
 3 2;
 3 5;
 4 1;
 4 7;
 4 11;
 5 1;
 5 4;
 6 1;
 6 6;
 6 7;
 7 4;
 7 6;
 7 8;
 7 11;
 8 8;
 8 9;
 8 10;
 9 9;
 9 10;
 10 1;
 10 2;
 10 3;
 11 11;
];
M_.block_structure.incidence(3).lead_lag = 1;
M_.block_structure.incidence(3).sparse_IM = [
 2 3;
 2 4;
 2 9;
 8 10;
];
M_.block_structure.dyn_tmp_nbr = 6;
M_.state_var = [11 5 9 ];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(11, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(1, 1);
M_.params = NaN(8, 1);
M_.endo_trends = struct('deflator', cell(11, 1), 'log_deflator', cell(11, 1), 'growth_factor', cell(11, 1), 'log_growth_factor', cell(11, 1));
M_.NNZDerivatives = [38; 0; -1; ];
M_.dynamic_g1_sparse_rowval = int32([3 4 5 9 11 4 5 6 10 3 10 1 2 10 5 7 3 1 6 7 1 4 6 7 8 1 8 9 8 9 4 7 11 2 2 2 8 11 ]);
M_.dynamic_g1_sparse_colval = int32([5 5 5 9 11 12 12 12 12 13 13 14 14 14 15 15 16 17 17 17 18 18 18 19 19 20 20 20 21 21 22 22 22 25 26 31 32 34 ]);
M_.dynamic_g1_sparse_colptr = int32([1 1 1 1 1 4 4 4 4 5 5 6 10 12 15 17 18 21 24 26 29 31 34 34 34 35 36 36 36 36 36 37 38 38 39 ]);
M_.dynamic_g2_sparse_indices = int32([]);
M_.lhs = {
'sigma*C+phi*L'; 
'sigma/beta*(C(1)-C)'; 
'K'; 
'Y'; 
'K(-1)'; 
'L'; 
'MC'; 
'PI'; 
'PI'; 
'Y*((1/beta-(1-delta))/(1/beta-(1-delta)-(psi-1)/psi*(1-beta*theta)*delta*alpha))^(sigma/(sigma+phi))*((1-alpha)*((psi-1)/psi*(1-beta*theta))^(1/(1-alpha))*(alpha/(1/beta-(1-delta)))^(alpha/(1-alpha))*((1-alpha)*((psi-1)/psi*(1-beta*theta))^(1/(1-alpha))*(alpha/(1/beta-(1-delta)))^(alpha/(1-alpha))/((psi-1)/psi*(1-beta*theta)*(1-alpha)))^phi)^(1/(sigma+phi))'; 
'A'; 
};
M_.static_tmp_nbr = [7; 0; 0; 0; ];
M_.block_structure_stat.block(1).Simulation_Type = 1;
M_.block_structure_stat.block(1).endo_nbr = 1;
M_.block_structure_stat.block(1).mfs = 1;
M_.block_structure_stat.block(1).equation = [ 9];
M_.block_structure_stat.block(1).variable = [ 10];
M_.block_structure_stat.block(2).Simulation_Type = 3;
M_.block_structure_stat.block(2).endo_nbr = 1;
M_.block_structure_stat.block(2).mfs = 1;
M_.block_structure_stat.block(2).equation = [ 11];
M_.block_structure_stat.block(2).variable = [ 11];
M_.block_structure_stat.block(3).Simulation_Type = 6;
M_.block_structure_stat.block(3).endo_nbr = 9;
M_.block_structure_stat.block(3).mfs = 9;
M_.block_structure_stat.block(3).equation = [ 3 4 5 6 7 8 1 10 2];
M_.block_structure_stat.block(3).variable = [ 2 1 5 7 6 8 9 3 4];
M_.block_structure_stat.variable_reordered = [ 10 11 2 1 5 7 6 8 9 3 4];
M_.block_structure_stat.equation_reordered = [ 9 11 3 4 5 6 7 8 1 10 2];
M_.block_structure_stat.incidence.sparse_IM = [
 1 3;
 1 6;
 1 7;
 1 9;
 2 4;
 2 9;
 3 2;
 3 5;
 4 1;
 4 5;
 4 7;
 4 11;
 5 1;
 5 4;
 5 5;
 6 1;
 6 6;
 6 7;
 7 4;
 7 6;
 7 8;
 7 11;
 8 8;
 8 9;
 8 10;
 9 10;
 10 1;
 10 2;
 10 3;
 11 11;
];
M_.block_structure_stat.tmp_nbr = 6;
M_.block_structure_stat.block(1).g1_sparse_rowval = int32([]);
M_.block_structure_stat.block(1).g1_sparse_colval = int32([]);
M_.block_structure_stat.block(1).g1_sparse_colptr = int32([]);
M_.block_structure_stat.block(2).g1_sparse_rowval = int32([1 ]);
M_.block_structure_stat.block(2).g1_sparse_colval = int32([1 ]);
M_.block_structure_stat.block(2).g1_sparse_colptr = int32([1 2 ]);
M_.block_structure_stat.block(3).g1_sparse_rowval = int32([1 8 2 3 4 8 1 2 3 2 4 7 4 5 7 5 6 6 7 9 7 8 3 5 9 ]);
M_.block_structure_stat.block(3).g1_sparse_colval = int32([1 1 2 2 2 2 3 3 3 4 4 4 5 5 5 6 6 7 7 7 8 8 9 9 9 ]);
M_.block_structure_stat.block(3).g1_sparse_colptr = int32([1 3 7 10 13 16 18 21 23 26 ]);
M_.static_g1_sparse_rowval = int32([4 5 6 10 3 10 1 10 2 5 7 3 4 5 1 6 7 1 4 6 7 8 1 2 8 8 9 4 7 11 ]);
M_.static_g1_sparse_colval = int32([1 1 1 1 2 2 3 3 4 4 4 5 5 5 6 6 6 7 7 7 8 8 9 9 9 10 10 11 11 11 ]);
M_.static_g1_sparse_colptr = int32([1 5 7 9 12 15 18 21 23 26 28 31 ]);
M_.params(1) = 2;
sigma = M_.params(1);
M_.params(2) = 1.5;
phi = M_.params(2);
M_.params(3) = 0.35;
alpha = M_.params(3);
M_.params(4) = 0.985;
beta = M_.params(4);
M_.params(5) = 0.025;
delta = M_.params(5);
M_.params(6) = 0.95;
rhoa = M_.params(6);
M_.params(7) = 8;
psi = M_.params(7);
M_.params(8) = 0.75;
theta = M_.params(8);
steady;
oo_.dr.eigval = check(M_,options_,oo_);
model_diagnostics(M_,options_,oo_);
options_model_info_ = struct();
model_info(options_model_info_);
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = (0.01)^2;
options_.order = 2;
var_list_ = {};
[info, oo_, options_, M_] = stoch_simul(M_, options_, oo_, var_list_);


oo_.time = toc(tic0);
disp(['Total computing time : ' dynsec2hms(oo_.time) ]);
if ~exist([M_.dname filesep 'Output'],'dir')
    mkdir(M_.dname,'Output');
end
save([M_.dname filesep 'Output' filesep 'NewKeynesian_results.mat'], 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'NewKeynesian_results.mat'], 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'NewKeynesian_results.mat'], 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'NewKeynesian_results.mat'], 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'NewKeynesian_results.mat'], 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'NewKeynesian_results.mat'], 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'NewKeynesian_results.mat'], 'oo_recursive_', '-append');
end
if exist('options_mom_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'NewKeynesian_results.mat'], 'options_mom_', '-append');
end
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
