# Lua Tables, Metatables, Modules

Lua has 8 datatypes. These are:
- `nil`
- `boolean`
- `number`
- `string`
- `table`
- `function`
- `userdata`
- `thread`

Objected-Oriented design in Lua is done with tables and metatables.

Tables are a combination of dictionaries and arrays.

```
local t = { name="jim", "a", "b", 3}
```

Metatables give tables special behavior. Using certain keys (`__index`, `__add`, `__call`) in the metatable makes tables act a certain way. Setting `__index` allows a table to inherit from another object. Ex. all `string` instances inherit from the `string` type, so you can do stuff like:

```
local s = "test"
s:find("e")
```


Lua supports modules as well. You can create a module in a file like so:

```
local _M = {} -- This can be called anything

function _M.hello_word()
  local s = "hello world"
  print(s)
end

return _M
```


The module can be called anything, it just needs to be returned at the end of the file.
