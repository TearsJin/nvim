# my nvim config

* `:VsnipOpen` 添加snippets，例子
```
{
  "Class": {
    "prefix": ["class"],
    "body": [
      "/**",
      " * @author ${VIM:\\$USER}",
      " */",
      "class $1 ${2:extends ${3:Parent} }{",
      "\tconstructor() {",
      "\t\t$0",
      "\t}",
      "}"
    ],
    "description": "Class definition template."
  }
}
```
