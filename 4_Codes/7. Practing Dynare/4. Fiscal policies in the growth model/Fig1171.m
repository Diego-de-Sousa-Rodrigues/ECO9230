%
% Status : main Dynare file 
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

clear all
tic;
global M_ oo_ options_ ys0_ ex0_ estimation_info
options_ = [];
M_.fname = 'Fig1171';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('Fig1171.log');
M_.exo_names = 'taui';
M_.exo_names_tex = 'taui';
M_.exo_names_long = 'taui';
M_.exo_names = char(M_.exo_names, 'tauc');
M_.exo_names_tex = char(M_.exo_names_tex, 'tauc');
M_.exo_names_long = char(M_.exo_names_long, 'tauc');
M_.exo_names = char(M_.exo_names, 'tauk');
M_.exo_names_tex = char(M_.exo_names_tex, 'tauk');
M_.exo_names_long = char(M_.exo_names_long, 'tauk');
M_.exo_names = char(M_.exo_names, 'g');
M_.exo_names_tex = char(M_.exo_names_tex, 'g');
M_.exo_names_long = char(M_.exo_names_long, 'g');
M_.endo_names = 'c';
M_.endo_names_tex = 'c';
M_.endo_names_long = 'c';
M_.endo_names = char(M_.endo_names, 'k');
M_.endo_names_tex = char(M_.endo_names_tex, 'k');
M_.endo_names_long = char(M_.endo_names_long, 'k');
M_.endo_names = char(M_.endo_names, 'rq');
M_.endo_names_tex = char(M_.endo_names_tex, 'rq');
M_.endo_names_long = char(M_.endo_names_long, 'rq');
M_.endo_names = char(M_.endo_names, 'wq');
M_.endo_names_tex = char(M_.endo_names_tex, 'wq');
M_.endo_names_long = char(M_.endo_names_long, 'wq');
M_.endo_names = char(M_.endo_names, 'Rbig');
M_.endo_names_tex = char(M_.endo_names_tex, 'Rbig');
M_.endo_names_long = char(M_.endo_names_long, 'Rbig');
M_.endo_names = char(M_.endo_names, 'sq');
M_.endo_names_tex = char(M_.endo_names_tex, 'sq');
M_.endo_names_long = char(M_.endo_names_long, 'sq');
M_.endo_names = char(M_.endo_names, 'qt');
M_.endo_names_tex = char(M_.endo_names_tex, 'qt');
M_.endo_names_long = char(M_.endo_names_long, 'qt');
M_.param_names = 'bet';
M_.param_names_tex = 'bet';
M_.param_names_long = 'bet';
M_.param_names = char(M_.param_names, 'gam');
M_.param_names_tex = char(M_.param_names_tex, 'gam');
M_.param_names_long = char(M_.param_names_long, 'gam');
M_.param_names = char(M_.param_names, 'del');
M_.param_names_tex = char(M_.param_names_tex, 'del');
M_.param_names_long = char(M_.param_names_long, 'del');
M_.param_names = char(M_.param_names, 'alpha');
M_.param_names_tex = char(M_.param_names_tex, 'alpha');
M_.param_names_long = char(M_.param_names_long, 'alpha');
M_.param_names = char(M_.param_names, 'A');
M_.param_names_tex = char(M_.param_names_tex, 'A');
M_.param_names_long = char(M_.param_names_long, 'A');
M_.exo_det_nbr = 0;
M_.exo_nbr = 4;
M_.endo_nbr = 7;
M_.param_nbr = 5;
M_.orig_endo_nbr = 7;
M_.aux_vars = [];
M_.Sigma_e = zeros(4, 4);
M_.Correlation_matrix = eye(4, 4);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = 1;
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
erase_compiled_function('Fig1171_static');
erase_compiled_function('Fig1171_dynamic');
M_.lead_lag_incidence = [
 0 2 9;
 1 3 0;
 0 4 0;
 0 5 0;
 0 6 0;
 0 7 0;
 0 8 0;]';
M_.nstatic = 5;
M_.nfwrd   = 1;
M_.npred   = 1;
M_.nboth   = 0;
M_.nsfwrd   = 1;
M_.nspred   = 1;
M_.ndynamic   = 2;
M_.equations_tags = {
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:4];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(7, 1);
M_.maximum_exo_lag = 1;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(4, 1);
M_.params = NaN(5, 1);
M_.NNZDerivatives = zeros(3, 1);
M_.NNZDerivatives(1) = 29;
M_.NNZDerivatives(2) = 0;
M_.NNZDerivatives(3) = -1;
M_.params( 1 ) = .95;
bet = M_.params( 1 );
M_.params( 2 ) = 2;
gam = M_.params( 2 );
M_.params( 3 ) = .2;
del = M_.params( 3 );
M_.params( 4 ) = .33;
alpha = M_.params( 4 );
M_.params( 5 ) = 1;
A = M_.params( 5 );
%
% INITVAL instructions
%
options_.initval_file = 0;
oo_.steady_state( 2 ) = 1.5;
oo_.steady_state( 1 ) = 0.6;
oo_.exo_steady_state( 4 ) = 0.2;
oo_.exo_steady_state( 2 ) = 0;
oo_.exo_steady_state( 1 ) = 0;
oo_.exo_steady_state( 3 ) = 0;
if M_.exo_nbr > 0;
	oo_.exo_simul = [ones(M_.maximum_lag,1)*oo_.exo_steady_state'];
end;
if M_.exo_det_nbr > 0;
	oo_.exo_det_simul = [ones(M_.maximum_lag,1)*oo_.exo_det_steady_state'];
end;
steady;
%
% ENDVAL instructions
%
ys0_= oo_.steady_state;
ex0_ = oo_.exo_steady_state;
oo_.steady_state( 2 ) = 1.5;
oo_.steady_state( 1 ) = 0.6;
oo_.exo_steady_state( 4 ) = 0.2;
oo_.exo_steady_state( 2 ) = 0;
oo_.exo_steady_state( 1 ) = 0;
oo_.exo_steady_state( 3 ) = 0;
steady;
%
% SHOCKS instructions
%
make_ex_;
set_shocks(0,10, 4, 0.4);
M_.exo_det_length = 0;
options_.periods = 100;
simul();
figure
subplot(3,3,1)
plot(k)
title('k')
subplot(3,3,2)
plot(c)
title('c')
subplot(3,3,3)
plot(Rbig)
title('R')
subplot(3,3,4)
plot(wq)
title('w/q')
subplot(3,3,5)
plot(sq)
title('s/q')
subplot(3,3,6)
plot(rq)
title('r/q')
subplot(3,3,7)
plot(qt)
title('q')
save('Fig1171_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('Fig1171_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('Fig1171_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('Fig1171_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('Fig1171_results.mat', 'estimation_info', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
