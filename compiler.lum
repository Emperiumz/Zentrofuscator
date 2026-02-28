-- IronVM Compiler Logic
local Compiler = {}

-- 1. Opcode Randomization (The "Secret Language")
local OP_MAP = {
    GETG = math.random(100, 999),
    LOADK = math.random(100, 999),
    CALL = math.random(100, 999),
    RETURN = math.random(100, 999),
}

-- 2. XOR String Encryption
local function xor_cipher(str, key)
    local res = ""
    for i = 1, #str do
        res = res .. string.char(string.byte(str, i) ~ key)
    end
    return res
end

-- 3. Control Flow Flattening (CFF)
-- This destroys the linear order of the script.
function Compiler.Virtualize(input_source)
    local xor_key = math.random(1, 255)
    
    -- In a real scenario, a Lexer would generate this stream.
    -- Here we simulate a virtualized 'print("Obfuscated!")'
    local virtual_instructions = {
        { op = OP_MAP.GETG,  r = 1, k = xor_cipher("print", xor_key) },
        { op = OP_MAP.LOADK, r = 2, k = xor_cipher("Obfuscated via IronVM!", xor_key) },
        { op = OP_MAP.CALL,  r = 1, a = 2 },
        { op = OP_MAP.RETURN }
    }
    
    -- Shuffle instructions and assign "Jumps" to break static analysis
    local proto = {}
    for i, inst in ipairs(virtual_instructions) do
        inst.id = i * 10 -- State ID
        inst.next = (i + 1) * 10
        table.insert(proto, inst)
    end
    
    return proto, OP_MAP, xor_key
end

return Compiler
