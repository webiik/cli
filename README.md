<p align="left">
<img src="https://img.shields.io/packagist/l/webiik/webiik.svg"/>
<img src="https://img.shields.io/badge/dependencies-5-orange.svg"/>
</p>

Analyse
=======
This CLI tool analyses code using preconfigured PHPCS, PHPMD, PHPSTAN, PHPmetrics and SonarCloud. It can help you to write better code and find possible errors.

> It's very likely that this tool will find "bugs" in your code. Always investigate these "bugs" and consider a fix. Avoid over-optimization of code, always keep in mind readability and testability.      

Usage
-----
### analyse
```php
analyse source-dir output-dir
```
**analyse** runs code analyses over the source directory and outputs analyses results to the output directory.
```php
bash analyse /private/app/ /private/tmp/analysis/app/
```

Settings
--------
In brief, command **analyse** tests code for the PSR-2 standards and PHP strict types. It uses the following settings:
```php
phpmd [source_dir] html cleancode,codesize,design,naming,unusedcode --reportfile [output_dir]/phpmd/index.html
```
```php
phpcs --standard=PSR2 --report-full=[output_dir]/phpcs/report-full.txt --report-code=[output_dir]/phpcs/report-code.txt [source_dir]
```
```php
phpstan analyse [source_dir] -l 7 --no-ansi --no-progress | awk '{$1=$1;print}' > [output_dir]/phpstan/result.txt
```
```php
phpmetrics --report-html=[output_dir]/phpmetrics [source_dir]
```
```php
sonar-scanner \
-Dsonar.projectKey=[sonar project key] \
-Dsonar.organization=[sonar organization] \
-Dsonar.projectBaseDir=[source_dir] \
-Dsonar.sources=. \
-Dsonar.host.url=https://sonarcloud.io \
-Dsonar.login=[sonar login]
```

Resources
---------
* [Webiik framework][1]
* [Report issues][2]

[1]: https://github.com/webiik/webiik
[2]: https://github.com/webiik/webiik/issues