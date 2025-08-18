
# ### RUN THIS ON SERVER ###
# 
# require(brms)
# require(posterior)
# 
# -----
# 
# load('paradat.rda') # with contrast coding for sameParadigm
# 
# -----
# 
# brm.LANDING_POSITION <- bf(RELATIVE_LANDING_POSITION.pt.z ~
# 	sameParadigm.ContrSum / (
# 		TRIAL_INDEX.z +
# 		NumOfWords +
# 		IA_FIRST_RUN_LAUNCH_SITE.rt +
# 		prevWordLength +
# 		targetWordLength +
# 		prevWordFreq.log +
# 		targetWordFreq.log +
# 		Levenshtein +
# 		REcomb +
# 		Cosine +
# 		G2L.AllCoAct.rt +
# 		G2L.AllCoADiversity.rt +
# 		L2L.Diversity.rt +
# 		L2L.RTypicality.rt +
# 		L2L.RSimilarity.rt +
# 		L2L.CSimilarity.rt +
# 		(1|r|targetLemma) +
# 		(1+TRIAL_INDEX.z|p|RECORDING_SESSION_LABEL))) +
# 	gaussian()
# brm.FIRST_FIXATION <- bf(IA_FIRST_FIXATION_DURATION.pt.z ~
# 	sameParadigm.ContrSum / (
# 		TRIAL_INDEX.z +
# 		NumOfWords +
# 		IA_FIRST_RUN_LAUNCH_SITE.rt +
# 		prevWordLength +
# 		poly(targetWordLength, 2, raw=FALSE) +
# 		prevWordFreq.log +
# 		targetWordFreq.log +
# 		Levenshtein +
# 		REcomb +
# 		Cosine +
# 		G2L.AllCoAct.rt +
# 		G2L.AllCoADiversity.rt +
# 		L2L.Diversity.rt +
# 		L2L.RTypicality.rt +
# 		L2L.RSimilarity.rt +
# 		L2L.CSimilarity.rt +
# 		(1|q|prevLemma) +
# 		(1|r|targetLemma) +
# 		(1+TRIAL_INDEX.z|p|RECORDING_SESSION_LABEL))) +
# 	gaussian()
# brm.DWELL_TIME <- bf(IA_DWELL_TIME.pt.z ~
# 	sameParadigm.ContrSum / (
# 		TRIAL_INDEX.z +
# 		NumOfWords +
# 		IA_FIRST_RUN_LAUNCH_SITE.rt +
# 		prevWordLength +
# 		targetWordLength +
# 		prevWordFreq.log +
# 		targetWordFreq.log +
# 		Levenshtein +
# 		REcomb +
# 		Cosine +
# 		G2L.AllCoAct.rt +
# 		G2L.AllCoADiversity.rt +
# 		L2L.Diversity.rt +
# 		L2L.RTypicality.rt +
# 		L2L.RSimilarity.rt +
# 		L2L.CSimilarity.rt +
# 		(1|q|prevLemma) +
# 		(1|r|targetLemma) +
# 		(1+TRIAL_INDEX.z|p|RECORDING_SESSION_LABEL))) +
# 	gaussian()
# brm.PUPIL_SIZE <- bf(IA_AVERAGE_FIX_PUPIL_SIZE.pt.z ~
# 	sameParadigm.ContrSum / (
# 		TRIAL_INDEX.z +
# 		NumOfWords +
# 		IA_FIRST_RUN_LAUNCH_SITE.rt +
# 		prevWordLength +
# 		targetWordLength +
# 		prevWordFreq.log +
# 		targetWordFreq.log +
# 		Levenshtein +
# 		REcomb +
# 		Cosine +
# 		G2L.AllCoAct.rt +
# 		G2L.AllCoADiversity.rt +
# 		L2L.Diversity.rt +
# 		L2L.RTypicality.rt +
# 		L2L.RSimilarity.rt +
# 		L2L.CSimilarity.rt +
# 		(1|q|prevLemma) +
# 		(1+TRIAL_INDEX.z|p|RECORDING_SESSION_LABEL))) +
# 	gaussian()
# 
# summary.brm.lmer_R1 <- summary(brm.lmer_R1 <- brm(
#     brm.LANDING_POSITION + brm.FIRST_FIXATION +
#     brm.DWELL_TIME + brm.PUPIL_SIZE +
#     set_rescor(TRUE),
#     data=paradat,
#     chains=4, iter=8000, cores=4,
#     save_pars=save_pars(all=TRUE),
#     control=list(adapt_delta=0.99, max_treedepth=15)))
# 
# brm.lmer_R1 <- add_criterion(brm.lmer_R1, 'loo',
# 	moment_match=TRUE, reloo=TRUE)
# 
# save(brm.lmer_R1, file='brm.lmer_R1.rda')
# save(summary.brm.lmer_R1, file='summary.brm.lmer_R1.rda')
# 
# posteriorSum.brm.lmer_R1 = posterior_summary(brm.lmer_R1,
# 	variable=c('^b_', '^sd_', 'sigma'), probs=c(0.001, 0.999))
# 
# save(posteriorSum.brm.lmer_R1, file='posteriorSum.brm.lmer_R1.rda')
# 
# ### END OF THE SERVER CODE ###

################################

# require(brms)
# require(posterior)
# 
# options(future.globals.maxSize= 1073741824)
# options(max.print=10000)
# 
# load('brm.lmer_R1.rda')
# load('summary.brm.lmer_R1.rda')
# load('posteriorSum.brm.lmer_R1.rda')


