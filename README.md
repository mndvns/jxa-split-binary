# jxa-split-binary

Split a binary with a given delimiter.

## Usage

```lisp
(ns my-namespace
  (require jxa-split-binary))

(jxa-split-binary/defsplit split-on-slash \/ 50)

(split-on-slash <<"/hello/there">>)
```

## Test

Automated tests to follow. For now, run `make repl`.

```bash
joxa-is> (use jxa-split-binary-test)
ok
joxa-is> (foobar <<"buzz/bazz">>)
[<<"buzz">>,<<"bazz">>]
```
