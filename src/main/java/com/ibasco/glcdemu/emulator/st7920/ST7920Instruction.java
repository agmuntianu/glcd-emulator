package com.ibasco.glcdemu.emulator.st7920;

import com.ibasco.glcdemu.emulator.GlcdInstruction;

/**
 * Base class for ST7920 instruction
 *
 * @author Rafael Ibasco
 */
public class ST7920Instruction extends GlcdInstruction<ST7920InstructionFlags> {
    public ST7920Instruction(ST7920InstructionFlags flag, byte value) {
        super(flag, value);
    }

}