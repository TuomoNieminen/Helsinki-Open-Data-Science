# Helsinki Open Data Science 

<a href=https://www.datacamp.com//teach/repositories/73911639/go target="_blank"><img src="https://s3.amazonaws.com/assets.datacamp.com/img/github/content-engineering-repos/course_button.png" width="150"></a>
<a href=https://www.datacamp.com//teach/repositories target="_blank"><img src="https://s3.amazonaws.com/assets.datacamp.com/img/github/content-engineering-repos/dashboard_button.png" width="150"></a>

Wellcome to the Helsinki Open Data Science DataCamp course repository. Changes made to this GitHub repository are automatically reflected in the linked DataCamp course. 

# About

This a <a href=https://www.datacamp.com target="_blank">DataCamp</a> course created by Tuomo Nieminen and Emma Kämäräinen for the use of a University of Helsinki course called "Introduction to Open Data Science", thought by prof. Kimmo Vehkalahti.

# Course slides

The course slides for the University of Helsink course "Introduction to Open Data Science" (IODS) are published in the GitHub web page enabled by this repository and can be found in the following link  

[IODS slides](https://tuomonieminen.github.io/Helsinki-Open-Data-Science/#).  

The slides have been created by Tuomo Nieminen and Emma Kämäräinen, using Rpresentation. The codes are included in the 'docs' folder. The index.html file in the docs-folder has been used to enable the GitHub web page. See 'instructions.Rmd' in the docs-folder for more information.  

# Datasets  

The files with common data related filename extensions in the 'datasets' folder are automatically uploaded to amazon S3 servers. The data found in the datasets folder of this repository are used in the DataCamp exercises. The links to the current data files can be seen from chapterx.Rmd files. The links to new files can be seen from the course build log under datacamp.com/teach. There is also information about uploading assets in the DataCamp [teach documentation](https://www.datacamp.com/teach/documentation#tab_upload_assets)

# DataCamp course creation

Changes you make to this GitHub repository are automatically reflected in the linked DataCamp course. This means that you can enjoy all the advantages of version control, collaboration, issue handling ... of GitHub.

## Workflow

1. Edit the markdown and yml files in this repository. You can use GitHub's online editor or use <a href=https://git-scm.com/ target="_blank">git</a> locally and push your changes.
2. Check out your build attempts on the <a href=https://www.datacamp.com//teach/repositories target="_blank">Teach Dashboard</a>.
3. Check out your automatically updated <a href=https://www.datacamp.com/teach/repositories/73911639/go target="_blank">course on DataCamp</a>

## Getting Started

A DataCamp course consists of two types of files:

- `course.yml`, a <a href=http://docs.ansible.com/ansible/YAMLSyntax.html target="_blank">YAML-formatted file</a> that's prepopulated with some general course information.
- `chapterX.md`, a markdown file with:
   - a YAML header containing chapter information.
   - markdown chunks representing DataCamp Exercises.

To learn more about the structure of a DataCamp course, check out the <a href=https://www.datacamp.com//teach/documentation#tab_course_structure target="_blank">documentation</a>.

Every DataCamp exercise consists of different parts, read up about them <a href=https://www.datacamp.com//teach/documentation#tab_code_exercises target="_blank">here</a>. A very important part about DataCamp exercises is to provide automated personalized feedback to students. In R, these so-called Submission Correctness Tests (SCTs) are written with the <a href=https://github.com/datacamp/testwhat target="_blank">`testwhat`</a> package. SCTs for Python exercises are coded up with <a href=https://github.com/datacamp/pythonwhat target="_blank">`pythonwhat`</a>. Check out the GitHub repositories' wiki pages for more information and examples.

Want to learn more? Check out the <a href=https://www.datacamp.com//teach/documentation target="_blank">documentation</a> on teaching at DataCamp.

*Happy teaching!*
