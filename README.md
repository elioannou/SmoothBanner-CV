## Smooth Banner resume class

This is a resume template featuring a coloured sidebar.  It is based on the
[twenty-seconds](https://github.com/spagnuolocarmine/TwentySecondsCurriculumVitae-LaTex)
template with added features and extended to allow for multiple pages.

### Build

This class uses only T1 LaTeX fonts and can be compiled by `latex` or
`pdflatex`.

`pdflatex my_cv.tex`

*Note:* The compilation process should be run twice for the correct
placement of the tikz boxes.

### How to use

This is a straight-forward configuration and requires only minimal knowledge of
LaTeX to use.

Simply open the `.tex` file and replace the information and text with your
own. There are comments inline to explain what you need to fill in.

### Class elements

The resume is made up of *elements* that present your information such as education,
work experience and skills. There are different types of elements some of which
are used in the sidebar and some in the main body. They are described below.

#### Sidebar 

The sidebar can have any number of the sidebar elements

1. Profile picture
2. Profile information using the fontawesome icons
3. Regular text
4. Skills in bars format
5. Skills in table format

#### Main body

The main body has two elements that can be used

1. Rich list (for education and work entries) 
2. Simple list (for awards, publications)
3. Regular text.

### Themes

By default, the colour of the sidebar is light and the text is dark coloured. 

A dark theme is also available, which will make the sidebar darker and the side
text white. To choose the dark theme, specify `dark` in the class options.  
e.g. `\documentclass[dark,a4paper]{smooth-banner-cv}`

### Sample

A sample of the first page from the produced pdf. The default theme is no the
left and the dark theme on the right.

![sample résumé](https://github.com/elioannou/SmoothBannerCV/raw/master/sample_cv.jpg)

