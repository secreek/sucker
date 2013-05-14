sucker
======

An universal RESTful API wrapper that sucks!

*(A project just for fun, seriously!)*

## Requirement

- Ruby
- cURL

## How to use

Supposing you are making a `GET` request to `https://api.github.com/repos/john/hello/commits`

- Copy the source code of the so called lib of sucker (just `30` lines!)
- Create you own API wrapper like this: `github = Sucker.new('https://api.github.com/')`
- Call your API like this: `puts github.repos.john.hello.commits[0]['commit']['author']`
- That's it.

## Why sucks

- Any REST resource such as Github repo name / user name cannot contain characters that are not allowed in naming Ruby methods (for example: `hello-world` is an invalid repo name for sucker because `-` is not allowed in Ruby method name)

## Not (maybe never) implemented

- No `PUT` `PATCH` `POST`, just `GET` implemented
- No authorization support
- No parameter support
