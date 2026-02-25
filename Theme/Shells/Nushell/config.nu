# Steelbore Nushell Module
# Save to ~/.config/nushell/steelbore.nu

export def main [] { return {
    separator: "#6272A4"
    header: { fg: "#50FA7B" attr: "b" }
    int: "#D98E32"
    filesize: "#8BE9FD"
    date: "#4B7EB0"
    string: "#E6E6F0"
    bool: {|| if $in { "#50FA7B" } else { "#FF5C5C" } }
    row_index: { fg: "#50FA7B" attr: "b" }
    
    # Shape Colors (Syntax)
    shape_garbage: { fg: "#FFFFFF" bg: "#FF5C5C" attr: "b" }
    shape_binary: { fg: "#BD93F9" attr: "b" }
    shape_int: { fg: "#BD93F9" attr: "b" }
    shape_float: { fg: "#BD93F9" attr: "b" }
    shape_range: { fg: "#D98E32" attr: "b" }
    shape_internalcall: { fg: "#8BE9FD" attr: "b" }
    shape_external: "#8BE9FD"
    shape_external_resolved: "#50FA7B"
    shape_literal: "#4B7EB0"
    shape_operator: "#D98E32"
    shape_signature: { fg: "#50FA7B" attr: "b" }
    shape_string: "#50FA7B"
    shape_filepath: "#8BE9FD"
    shape_globpattern: { fg: "#8BE9FD" attr: "b" }
    shape_variable: "#D98E32"
    shape_flag: { fg: "#4B7EB0" attr: "b" }
    shape_custom: "#50FA7B"
    shape_nothing: "#50FA7B"
}}