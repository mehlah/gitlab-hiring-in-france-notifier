# GitLab hiring in France notifier

This script reads the [countries list](https://gitlab.com/gitlab-com/www-gitlab-com/blob/8e17aa630ba08102ef6aa4331f65fa01e119352a/data/country_no_hire.yml) where GitLab can't currently hire employees and contractors,
and will notify me by email when `France` is removed from this list.

I took the opportunity building it to use mruby and to run it on AWS Lambda.

## Necessary mrbgems when compiling mruby

Refer to https://github.com/mruby/mruby/blob/master/doc/guides/compile.md for
compiling mruby instructions.

I needed the following mrbgems:

```
+  conf.gem :github => 'iij/mruby-env'
+  conf.gem :github => 'mattn/mruby-curl'
+  conf.gem :github => 'k0kubun/mruby-yaml'
```
