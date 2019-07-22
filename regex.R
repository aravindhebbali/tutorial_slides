## ----install, eval=TRUE, message=FALSE, warning=FALSE--------------------
library(dplyr)
library(readr)

## ----str1, echo=FALSE, eval=TRUE, results='hide', message=FALSE----------
library(dplyr)

## ----read_data, message=FALSE--------------------------------------------
read_csv("data/package_names.csv") %>%
  pull(1) -> r_packages 
r_packages

## ----top_downloads-------------------------------------------------------
top_downloads <- c("devtools", "rlang", "dplyr", "Rcpp", "tibble",    
                   "ggplot2", "glue", "pillar", "cli", "data.table")
top_downloads

## ----grep_index, echo=FALSE, fig.align="center", out.width="100%"--------
knitr::include_graphics("img/regex_grep_index_canva.png")

## ----grep_code-----------------------------------------------------------
grep(x = top_downloads, pattern = "r")

## ----grep_value, echo=FALSE, fig.align="center", out.width="100%"--------
knitr::include_graphics("img/regex_grep_value_canva.png")

## ----grep_value_code-----------------------------------------------------
grep(x = top_downloads, pattern = "r", value = TRUE)

## ----grep_ignore_case, echo=FALSE, fig.align="center", out.width="100%"----
knitr::include_graphics("img/regex_grep_ignore_case_canva.png")

## ----grep_ignore_case_code-----------------------------------------------
grep(x = top_downloads, pattern = "r", value = TRUE, ignore.case = TRUE)
grep(x = top_downloads, pattern = "R", value = TRUE)
grep(x = top_downloads, pattern = "R", value = TRUE, ignore.case = TRUE)

## ----grep_invert, echo=FALSE, fig.align="center", out.width="100%"-------
knitr::include_graphics("img/regex_grep_invert_canva.png")

## ----grep_invert_code----------------------------------------------------
grep(x = top_downloads, pattern = "r", value = TRUE, invert = TRUE)
grep(x = top_downloads, pattern = "r", value = TRUE, 
     invert = TRUE, ignore.case = TRUE)

## ----grepl, echo=FALSE, fig.align="center", out.width="100%"-------------
knitr::include_graphics("img/regex_grepl_canva.png")

## ----grepl_code----------------------------------------------------------
grepl(x = top_downloads, pattern = "r")

## ----grepl_ignore_case, echo=FALSE, fig.align="center", out.width="100%"----
knitr::include_graphics("img/regex_grepl_ignore_case_canva.png")

## ----grepl_ignore_case_code----------------------------------------------
grepl(x = top_downloads, pattern = "r", ignore.case = TRUE)

## ----regexpr-------------------------------------------------------------
rr_pkgs <- c("purrr", "olsrr", "blorr")
regexpr("r", rr_pkgs)

## ----gregexpr------------------------------------------------------------
gregexpr("r", rr_pkgs)

## ----regexec-------------------------------------------------------------
regexec("r", rr_pkgs)

## ----sub, echo=FALSE, fig.align="center", out.width="100%"---------------
knitr::include_graphics("img/regex_sub_canva.png")

## ----sub_code------------------------------------------------------------
rr_pkgs <- c("purrr", "olsrr", "blorr")
sub(x = rr_pkgs, pattern = "r", replacement = "s")

## ----gsub, echo=FALSE, fig.align="center", out.width="100%"--------------
knitr::include_graphics("img/regex_gsub_canva.png")

## ----gsub_code-----------------------------------------------------------
gsub(x = rr_pkgs, pattern = "r", replacement = "s")

## ----anchor_start}, echo=FALSE, fig.align="center", out.width="100%"-----
knitr::include_graphics("img/regex_anchor_start_canva.png")

## ----anchor_start_code---------------------------------------------------
grep(x = top_downloads, pattern = "^r", value = TRUE)

## ----anchor_start_ignore_case, echo=FALSE, fig.align="center", out.width="100%"----
knitr::include_graphics("img/regex_anchor_start_ignore_case_canva.png")

## ----anchor_start_ignore_case_code---------------------------------------
grep(x = top_downloads, pattern = "^r", value = TRUE, ignore.case = TRUE)

## ----anchor_end, echo=FALSE, fig.align="center", out.width="100%"--------
knitr::include_graphics("img/regex_anchor_end_canva.png")

## ----anchor_end_code-----------------------------------------------------
grep(x = top_downloads, pattern = "r$", value = TRUE)

## ----meta_characters, echo=FALSE, fig.align="center", out.width="50%"----
knitr::include_graphics("img/regex_meta_characters.png")

## ----quantifier_dot, echo=FALSE, fig.align="center", out.width="100%"----
knitr::include_graphics("img/regex_quantifier_dot_canva.png")

## ----quantifier_dot_code_1-----------------------------------------------
data_pkgs <- grep(x = r_packages, pattern = "data", value = TRUE)
grep(x = data_pkgs, pattern = "data.r", value = TRUE, ignore.case = TRUE)

## ----quantifier_dot_code_2-----------------------------------------------
grep(x = data_pkgs, pattern = "data...r", value = TRUE, ignore.case = TRUE)

## ----quantifier_dot_code_3-----------------------------------------------
grep(x = r_packages, pattern = "data(.){3}r", value = TRUE, ignore.case = TRUE)

## ----quantifier_dot_code_4-----------------------------------------------
grep(x = r_packages, pattern = "stat..r", value = TRUE, ignore.case = TRUE)

## ----quantifier_mark_1, echo=FALSE, fig.align="center", out.width="100%"----
knitr::include_graphics("img/regex_quantifier_question_mark.png")

## ----quantifier_question_code_1------------------------------------------
grep(x = data_pkgs, pattern = "r(.)?data", value = TRUE)

## ----quantifier_mark_2, echo=FALSE, fig.align="center", out.width="100%"----
knitr::include_graphics("img/regex_quantifier_question_mark_2.png")

## ----quantifier_question_code_2------------------------------------------
grep(x = data_pkgs, pattern = "r(\\.)?data", value = TRUE)

## ----quantifier_mark_3, echo=FALSE, fig.align="center", out.width="100%"----
knitr::include_graphics("img/regex_quantifier_question_mark_3.png")

## ----quantifier_question_code_3------------------------------------------
grep(x = data_pkgs, pattern = "r(m|y|q)?data", value = TRUE)

## ----quantifier_mark_4, echo=FALSE, fig.align="center", out.width="100%"----
knitr::include_graphics("img/regex_quantifier_question_mark_4.png")

## ----quantifier_question_code_4------------------------------------------
grep(x = data_pkgs, pattern = "r(\\.|m|y|q)?data", value = TRUE)

## ----quantifier_star, echo=FALSE, fig.align="center", out.width="100%"----
knitr::include_graphics("img/regex_quantifier_star.png")

## ----quantifier_star_code------------------------------------------------
grep(x = data_pkgs, pattern = "r(.)*data", value = TRUE)

## ----quantifier_plus, echo=FALSE, fig.align="center", out.width="100%"----
knitr::include_graphics("img/regex_quantifier_plus.png")

## ----quantifier_plus_code------------------------------------------------
plot_pkgs <- grep(x = r_packages, pattern = "plot", value = TRUE)
grep(x = plot_pkgs, pattern = "(g)+plot", value = TRUE, ignore.case = TRUE)

## ----quantifier_exact_n_match, echo=FALSE, fig.align="center", out.width="100%"----
knitr::include_graphics("img/regex_quantifier_exact_n_match_canva.png")

## ----quantifier_n_code---------------------------------------------------
grep(x = plot_pkgs, pattern = "(g){2}plot", value = TRUE)

## ----quantifier_match_one_or_more, echo=FALSE, fig.align="center", out.width="100%"----
knitr::include_graphics("img/regex_quantifier_match_one_or_more_canva.png")

## ----quantifier_n_or_more_code-------------------------------------------
grep(x = plot_pkgs, pattern = "(g){1, }plot", value = TRUE)

## ----quantifier_match_between, echo=FALSE, fig.align="center", out.width="100%"----
knitr::include_graphics("img/regex_quantifier_match_between_canva.png")

## ----quantifier_between_code---------------------------------------------
grep(x = plot_pkgs, pattern = "(t){1,3}plot", value = TRUE)

## ----or_round, echo=FALSE, fig.align="center", out.width="100%"----------
knitr::include_graphics("img/regex_or_round_bracket_canva.png")

## ----or_round_code-------------------------------------------------------
grep(x = top_downloads, pattern = "g(g|l)", value = TRUE)

## ----or_square, echo=FALSE, fig.align="center", out.width="100%"---------
knitr::include_graphics("img/regex_or_square_bracket_canva.png")

## ----or_square_code------------------------------------------------------
grep(x = top_downloads, pattern = "d[epa]", value = TRUE)

## ----sequence_digit, echo=FALSE, fig.align="center", out.width="100%"----
knitr::include_graphics("img/regex_match_digit.png")

## ----digit_code----------------------------------------------------------
grep(x = r_packages, pattern = "\\d", value = TRUE)

## ----sequence_non_digit, echo=FALSE, fig.align="center", out.width="100%"----
knitr::include_graphics("img/regex_match_non_digit.png")

## ----non_digit_code------------------------------------------------------
invoice_id <- c("R536365", "R536472", "R536671", "536915", "R536125", "R536287",
                "536741", "R536893", "R536521", "536999")
grep(x = invoice_id, pattern = "\\D", value = TRUE)

## ----sequence_space, echo=FALSE, fig.align="center", out.width="100%"----
knitr::include_graphics("img/regex_match_space.png")

## ----space_code----------------------------------------------------------
grep(x = c("R536365", "R 536472", "R536671", "R536915", "R53 6125", "R536287",
           "536741", "R5368  93", "R536521", "536 999"), 
     pattern = "\\s", value = TRUE)

## ----sequence_non_space, echo=FALSE, fig.align="center", out.width="100%"----
knitr::include_graphics("img/regex_match_non_space.png")

## ----non_space_code------------------------------------------------------
grep(x = c("R536365", "R 536472", " ", "R536915", "R53 6125", "R536287",
           " ", "R5368  93", "R536521", "536 999"), 
     pattern = "\\S", value = TRUE)

## ----sequence_word, echo=FALSE, fig.align="center", out.width="100%"-----
knitr::include_graphics("img/regex_match_word.png")

## ----word_code-----------------------------------------------------------
grep(x = c("R536365", "%+$!#@?", "R536671", "R536915", "$%+#!@?", "R5362@87",
           "53+67$41", "R536893", "@$+%#!", "536#999"), 
     pattern = "\\w", value = TRUE)

## ----sequence_non_word, echo=FALSE, fig.align="center", out.width="100%"----
knitr::include_graphics("img/regex_match_non_word.png")

## ----non_word_code-------------------------------------------------------
grep(x = c("R536365", "%+$!#@?", "R536671", "R536915", "$%+#!@?", "R5362@87",
           "53+67$41", "R536893", "@$+%#!", "536#999"), 
     pattern = "\\W", value = TRUE)

## ----word_boundary_1, echo=FALSE, fig.align="center", out.width="100%"----
knitr::include_graphics("img/regex_word_boundary_1.png")

## ----boundary_code_2-----------------------------------------------------
grep(x = r_packages, pattern = "\\bstat", value = TRUE) 

## ----word_boundary_2, echo=FALSE, fig.align="center", out.width="100%"----
knitr::include_graphics("img/regex_word_boundary_2.png")

## ----boundary_code_3-----------------------------------------------------
grep(x = r_packages, pattern = "stat\\b", value = TRUE)

## ----word_boundary_3, echo=FALSE, fig.align="center", out.width="100%"----
knitr::include_graphics("img/regex_word_boundary_3.png")

## ----boundary_code_4-----------------------------------------------------
grep(x = r_packages, pattern = "\\Bstat", value = TRUE)

## ----word_boundary_4, echo=FALSE, fig.align="center", out.width="100%"----
knitr::include_graphics("img/regex_word_boundary_4.png")

## ----boundary_code_5-----------------------------------------------------
grep(x = r_packages, pattern = "stat\\B", value = TRUE)

## ----word_boundary_5, echo=FALSE, fig.align="center", out.width="100%"----
knitr::include_graphics("img/regex_word_boundary_5.png")

## ----boundary_code_6-----------------------------------------------------
grep(x = r_packages, pattern = "\\Bstat\\B", value = TRUE)

## ----character_class_numbers, echo=FALSE, fig.align="center", out.width="100%"----
knitr::include_graphics("img/regex_character_class_numbers.png")

## ----character_code_1----------------------------------------------------
grep(x = top_downloads, pattern = "[aeiou]", value = TRUE)

## ----character_code_2----------------------------------------------------
grep(x = r_packages, pattern = "[0-9]", value = TRUE)

## ----character_code_3----------------------------------------------------
grep(x = r_packages, pattern = "^[0-9]", value = TRUE)

## ----character_code_4----------------------------------------------------
grep(x = r_packages, pattern = "[0-9]$", value = TRUE)

## ----character_code_5----------------------------------------------------
grep(x = r_packages, pattern = "^[A-Z][A-Z]{1, }[A-Z]$", value = TRUE)

## ----cs_blood_group_pattern, echo=FALSE, fig.align="center", out.width="100%"----
knitr::include_graphics("img/regex_cs_blood_groups.png")

## ----cs_blood_group, echo=FALSE, fig.align="center", out.width="100%"----
knitr::include_graphics("img/regex_cs_bg_table.png")

## ----blood_group---------------------------------------------------------
blood_pattern <- "^(A|B|AB|O)[-|+]$"
blood_sample <- c("A+", "C-", "AB+")
grep(x = blood_sample, pattern = blood_pattern, value = TRUE)

## ----cs_email_pattern, echo=FALSE, fig.align="center", out.width="100%"----
knitr::include_graphics("img/regex_cs_email.png")

## ----cs_email, echo=FALSE, fig.align="center", out.width="100%"----------
knitr::include_graphics("img/regex_cs_email_table.png")

## ----email_validation----------------------------------------------------
email_pattern <- "^[a-zA-Z0-9\\!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+\\.[a-z]"
emails <- c("test9+_A@test.com", "test@test..com", "test-test.com")
grep(x = emails, pattern = email_pattern, value = TRUE)

## ----cs_pan_pattern_1, echo=FALSE, fig.align="center", out.width="100%"----
knitr::include_graphics("img/regex_cs_pan_1.png")

## ----cs_pan_pattern_2, echo=FALSE, fig.align="center", out.width="100%"----
knitr::include_graphics("img/regex_cs_pan_2.png")

## ----cs_pan, echo=FALSE, fig.align="center", out.width="100%"------------
knitr::include_graphics("img/regex_cs_pan_table.png")

## ----pan_validation------------------------------------------------------
pan_pattern <- "^[A-Z]{3}(A|B|C|F|G|H|L|J|P|T|E)[A-Z][0-9]{4}[A-Z]"
my_pan <- c("AJKHT3865H", "AJKNT38655", "A2KNT3865H", "AJKDT3865H")
grep(x = my_pan, pattern = pan_pattern, value = TRUE)

## ----cs_gst_pattern, echo=FALSE, fig.align="center", out.width="100%"----
knitr::include_graphics("img/regex_cs_gst.png")

## ----cs_gst, echo=FALSE, fig.align="center", out.width="100%"------------
knitr::include_graphics("img/regex_cs_gst_table.png")

## ----gst_validation------------------------------------------------------
gst_pattern <- "^[0-3][1-5][A-Z]{3}(A|B|C|F|G|H|L|J|P|T|E)[A-Z][0-9]{4}[A-Z][1-9]Z[0-9A-Z]"
sample_gst <- c("22AAAAA0000A1Z5", "22AAAAA0000A1Z", "42AAAAA0000A1Z5",
                "38AAAAA0000A1Z5", "22AAAAA0000A0Z5", "22AAAAA0000A1X5",
                "22AAAAA0000A1Z$")
grep(x = sample_gst, pattern = gst_pattern, value = TRUE)

