## Fully functioning UF Dissertation in Latex

This is a full PhD dissertation written in Latex and accepted by the University of Florida Graduate School Editorial office in Fall 2019. It was written on the website Overleaf.com using a provided template. The template is titled "University of Florida Thesis Template" and originally [provided by the UF](http://helpdesk.ufl.edu/application-support-center/etd-technical-support/ms-word-and-latex-templates/).  

Using the github interface you can see the [original template](https://github.com/sdtaylor/dissertation/tree/original_overleaf_template), the [full accepted dissertation](https://github.com/sdtaylor/dissertation/tree/accepted_dissertation), and the [exact changes](https://github.com/sdtaylor/dissertation/commit/35a8df380f53d6b91f00e4f6d7d953d9eb242cde) I made to go from template to completed dissertation. 

I wrote this on Overleaf.org. It may work on a PC with Latex installed but I have not tried. Overleaf is free as long as your dissertation doesn't take more than 5 minutes to render (otherwise $8/month for students).  

**Some notes**:

- No original figures are included here as they are fairly large in my dissertation. A single placeholder image is used throughout. 
- You'll need to provide your references in a bibtex format in the file `bib/dissertation_refs.bib`. These are available for export in most reference managers such as Mendeley or Zotero.
- If you'd like to actually read my dissertation and learn about phenology forecasting all chapters are published [here](https://doi.org/10.1002/ecy.2568), [here](https://doi.org/10.7287/peerj.preprints.27629v1), and [here](https://doi.org/10.1101/634568).

**More on references**:  
One thing I ran into a lot is Latex slicing up institutional names. For example the following reference:  

>US Geological Survey, 1999. Digital representation of Atlas of United States Trees by
Elbert L. Little, Jr.

would by default get formatted as 

>Survey, USG. 1999. Digital representation of Atlas of United States Trees by
Elbert L. Little, Jr.  

This was fixed by add double `{}` to the author bibtex entry. So adjusting this:

```
@misc{little1999,
author = {US Geological Survey},
publisher = {US Geological Survey, Lakewood, CO},
title = {{Digital representation of “Atlas of United States Trees” by Elbert L. Little, Jr.}},
year = {1999}
}
```

to

```
@misc{little1999,
author = {{US Geological Survey}},
publisher = {US Geological Survey, Lakewood, CO},
title = {{Digital representation of “Atlas of United States Trees” by Elbert L. Little, Jr.}},
year = {1999}
}

```

The double brackets can be used on last names with two words as well, such as

```
  Author = {{de Keyzer}, Charlotte W. and Rafferty, Nicole E. and Inouye, David W. and Thomson, James D.},

```

Another issue was the bibliography was double spaced, which is not what the editorial office wants. I fixed this by adding the `ufnatbib.cfg` file, which addresses this and other issues. This file was made available in the latest version of the UF Latex Template from the site listed above.

I used the references style from the journal [Ecology](https://esajournals.onlinelibrary.wiley.com/journal/19399170), which is set [here](https://github.com/sdtaylor/dissertation/blob/69893f7b4bda7c47ac70d2558641f34d645edcff/main.tex#L86).

### Figures
All figures are uploaded to the `images` directory. The filename is set along with the caption and figure label (see below). The easiest option is to put figures and tables at the end of each chapter. I organized my figures as so.

```
%%%%%%%%%%%%%%%%%%%%%%
%% Figure 1 the map
%%%%%%%%%%%%%%%%%%%%%%

\begin{figure}
	\centering
	%\includegraphics[scale=0.6]{images/figure_2-1_site_map.png}
	\includegraphics[scale=0.3]{images/figure_filler.jpg}
	\caption[Locations of Locations of U.S.A. National Phenology Network and 
	Long Term Ecological Research sites]{Locations of Locations of U.S.A. National 
	Phenology Network and Long Term Ecological Research sites. U.S.A. National Phenology 
	Network sites used are shown as black points and Long Term Ecological Research sites
	as labeled circles, with greyscale showing elevation.} \label{fig-2-1}
\end{figure}

%%%%%%%%%%%%%%%%%%%%%%
%% Figure 2 parameter comparison
%%%%%%%%%%%%%%%%%%%%%%

\begin{figure}
	\centering
    %\includegraphics[scale=0.6]{images/figure_2-2_param_comparison_final.png}
    \includegraphics[scale=0.3]{images/figure_filler.jpg}
    \caption[Comparisons of parameter estimates between USA-NPN and LTER 
    derived models]{Comparisons of parameter estimates between USA-NPN and LTER 
    derived models. Each point represents a parameter value for a specific species 
    and phenophase, and is the mean value from 250 bootstrap iterations. The black 
    line is the 1:1 line.} \label{fig-2-2}
\end{figure}

```

Two important things to note. The `\caption` command has the format `\caption[]{}` where the square brackets `[]` are the figure title, while the curly brackets `{}` are the full caption. The title will be used in the table of contents, while the full caption is displayed below the image. The title must be repeated in the beginning of the full caption per formatting guidelines.  
Second, the `\label{}` command gives a reference to the figure throughout the text. I used a standard format for figures of fig-CHAPTER-FIGURE_NUMBER for all figures. In this main text this will be referenced as `Figure \ref{fig-2-1}`, and Latex will take care of figure numbering. See an example [here](https://github.com/sdtaylor/dissertation/blob/35a8df380f53d6b91f00e4f6d7d953d9eb242cde/tex/chapter3.tex#L48). This is used for appendix figures as well (ie. `\label{fig-a-1}`), which can also be referenced in the main chapter files even though appendix files are separate. 

All the same ideas are used for tables. Here is an example

```
%%%%%%%%%%%%%%%%%%%%%%
%% Table 3, differences between LTER and USA-NPN
%%%%%%%%%%%%%%%%%%%%%%

\begin{table}
    \caption[Attributes of the two datasets used in this study]{Attributes of the 
    two datasets used in this study. Bold text indicates an attribute is expected 
    to increase over time.} \label{table-2-3}
    \begin{tabularx}{6.5in}{XXX}
    \hline
                                    & LTER  & USA-NPN           \\
    \hline
    Time-series length                          & \textbf{High} & \textbf{Low}  \\
    Spatial extent                              & Low           & \textbf{High} \\
    Local species representation                & High          & Low           \\
    Regional/Continental species representation & Low           & \textbf{High} \\
    Number of observers                         & \textbf{Low}  & \textbf{High} \\
    Site fidelity                               & High          & Low          
    \end{tabularx}
\end{table}
```

As in images the caption as a title and a full caption, and this can be referenced as `Table \ref{table-2-3}`.  

Long tables must be spread across two pages and require some special formatting. See an example [here](https://github.com/sdtaylor/dissertation/blob/35a8df380f53d6b91f00e4f6d7d953d9eb242cde/tex/appendixC.tex#L83). To get tables into the initial latex format I used the R packages [knitr and kableExtra](https://cran.r-project.org/web/packages/kableExtra/vignettes/awesome_table_in_html.html) to output data into Latex and then copied into Overleaf. 
