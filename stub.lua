-- THE IRON-VM RUNTIME
-- Minified and Obfuscated variables to prevent manual reading
return (function(data, keys, x_key)
    local _env = getfenv and getfenv() or _ENV
    local _stack = {}
    local _pc = 10 -- Starting State ID
    
    -- Localizing functions to prevent "Global Hooking" (Anti-Dump)
    local _str_char = string.char
    local _str_byte = string.byte
    
    -- XOR Decryption Engine
    local function _decrypt(s)
        local r = ""
        for i = 1, #s do r = r .. _str_char(_str_byte(s, i) ~ x_key) end
        return r
    end

    -- The Virtual Machine Loop
    -- This is a "State Machine" that machines cannot easily decompile.
    while true do
        local _found = false
        for _, inst in ipairs(data) do
            if inst.id == _pc then
                _found = true
                local op = inst.op
                
                -- Opcode Dispatcher
                if op == keys.GETG then
                    _stack[inst.r] = _env[_decrypt(inst.k)]
                elseif op == keys.LOADK then
                    _stack[inst.r] = _decrypt(inst.k)
                elseif op == keys.CALL then
                    _stack[inst.r](_stack[inst.a])
                elseif op == keys.RETURN then
                    return
                end
                
                -- Jump to next calculated state
                _pc = inst.next
                break
            end
        end
        if not _found then break end
    end
end)
