# Ecopod
* Emacs Devlopment Environment for Golang

## Description
The main aim of this Project is to come up with a localized  Pod containing
all the development tools required for developing and testing projects written in golang using
Emacs ide and language Server Protocol

## Contents of Ecopod
Ecopod contains 2 containers
1. Ide pod containing emacs with all it's tuning for golang development and ginkgo testing frameworks
2. Gopls (Go Please) language server

## Build Container images

1. Build the language server Container
`podman build -t lsp lsp/`

2. Build the ide container image
`podman build -t ide ide/`

## Creating Pod
podman pod create --name ecopod -p 7050:7050 -p 6060:6060
podman run -dt --pod ecopod -v '/code/myworkspace/:/code/myworkspace/:z,ro'  localhost/lsp:latest
podman run -dt --pod ecopod -v '/code/myworkspace/:/code/myworkspace/:z,rw'  localhost/ecopod:latest

## start emacs
podman exec -it <ecopod container id> bash


## TBD
* Using podman desktop
* Currently Pod aims to get emacs ide working from a container, and still requires more fine tuning
* In future this can be extended to other ide's like vim

