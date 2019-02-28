<p align="left">
<img src="https://img.shields.io/packagist/l/webiik/webiik.svg"/>
<img src="https://img.shields.io/badge/dependencies-0-brightgreen.svg"/>
</p>

Webiik CLI
==========
Webiik CLI helps you to work quickly with Webiik framework.

Extensions
----------
Extension allows you to extend your Webiik applications. This is one of most powerful features of Webiik framework. 
### add
```php
add repo url | package name
```
**add** adds Webiik extension to your Webiik app.
```php
webiik add webiik/account
```

### rm
```php
rm repo url | package name
```
**rm** removes Webiik extension from your Webiik app.
```php
webiik rm webiik/account
```

Parcel.js
---------
### install-parcel
```php
install-parcel
```
**install-parcel** installs and configures [Parcel](https://parceljs.org). Parcel optimizes css and js in all private/assets folders and optimized css and js copies to appropriate public/assets folder. Parcel makes it automatically with every update of original css and js.
> Requires node.js with npm
```php
webiik install-parcel
```

Code Analyse
------------
### analyse
```php
analyse source-dir output-dir
```
**analyse** runs code analyses over the source directory and outputs analyses results to the output directory. Read more about [analyses settings](../Analyse/README.md).
```php
webiik analyse /private/app/ /private/tmp/analysis/app/
```


Resources
---------
* [Webiik framework][1]
* [Report issue][2]

[1]: https://github.com/webiik/webiik
[2]: https://github.com/webiik/components/issues