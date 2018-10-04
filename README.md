# Helsinki Open Data Science 

<a href=https://www.datacamp.com/teach/repositories/73911639/go target="_blank"><img src="https://s3.amazonaws.com/assets.datacamp.com/img/github/content-engineering-repos/course_button.png" width="150"></a>
<a href=https://www.datacamp.com/teach/repositories target="_blank"><img src="https://s3.amazonaws.com/assets.datacamp.com/img/github/content-engineering-repos/dashboard_button.png" width="150"></a>

Welcome to the Helsinki Open Data Science repository! This repository includes the codes for both the <a href=https://www.datacamp.com target="_blank">DataCamp</a> and the presentation slides related to the University of Helsinki course "Introduction to Open Data Science" (IODS), thought by prof. <b>Kimmo Vehkalahti</b>. You can click on the 'Course on DataCamp' -link above to go to the course page. 

Both the DataCamp course and the presentation slides are created by <b>Tuomo Nieminen</b> and <b>Emma Kämäräinen</b>. 


# Course slides

The presentation slides for the IODS course are published in a GitHub web page enabled by this repository. The slides have been created by Tuomo Nieminen and Emma Kämäräinen, using Rpresentation. They can be found in the following link  

[IODS slides](https://tuomonieminen.github.io/Helsinki-Open-Data-Science/#).  

The Rpresentation codes are included in the 'docs' folder. The index.html file in the 'docs' folder has been used to enable the GitHub web page. See 'instructions.Rmd' in the 'docs' folder for more information.  
# DataCamp course creation

Changes made to this GitHub repository are automatically reflected in the linked DataCamp course. This means that you can enjoy all the advantages of version control, collaboration, issue handling ... of GitHub.

## Workflow

1. Edit the markdown and yml files in this repository. You can use GitHub's online editor or use <a href=https://git-scm.com/ target="_blank">git</a> locally and push your changes.
2. Check out your build attempts on the <a href=https://www.datacamp.com/teach/repositories target="_blank">Teach Dashboard</a>.
3. Check out your automatically updated <a href=https://www.datacamp.com/teach/repositories/73911639/go target="_blank">course on DataCamp</a>

## Getting Started

A DataCamp course consists of two types of files:

- `course.yml`, a <a href=http://docs.ansible.com/ansible/YAMLSyntax.html target="_blank">YAML-formatted file</a> that's prepopulated with some general course information.
- `chapterX.md`, a markdown file with:
   - a YAML header containing chapter information.
   - markdown chunks representing DataCamp Exercises.

To learn more about the structure of a DataCamp course, check out the <a href=https://www.datacamp.com/teach/documentation#tab_course_structure target="_blank">documentation</a>.

Every DataCamp exercise consists of different parts, read up about them <a href=https://www.datacamp.com/teach/documentation#tab_code_exercises target="_blank">here</a>. A very important part about DataCamp exercises is to provide automated personalized feedback to students. In R, these so-called Submission Correctness Tests (SCTs) are written with the <a href=https://github.com/datacamp/testwhat target="_blank">`testwhat`</a> package. Check out the GitHub repositories' wiki pages for more information and examples.

For more information check out the <a href=https://www.datacamp.com/teach/documentation target="_blank">documentation</a> on teaching at DataCamp.

## Datasets  

The data found in the 'datasets' folder of this repository are used in the DataCamp exercises. The files with data related filename extensions in the 'datasets' folder are automatically uploaded to amazon S3 servers.  

The links to the currently used data files can be seen from the chapterx.Rmd files. The links to new files can be seen from the course build log under datacamp.com/teach. There is also information about uploading assets in the DataCamp [teach documentation](https://www.datacamp.com/teach/documentation#tab_upload_assets)

