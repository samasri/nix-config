[
  {
    key = "ctrl+f";
    command = "-cursorRight";
    when = "textInputFocus";
  }
  {
    key = "ctrl+f";
    command = "actions.find";
  }
  {
    key = "cmd+f";
    command = "-actions.find";
  }
  {
    key = "ctrl+z";
    command = "undo";
    when = "textInputFocus && !editorReadonly";
  }
  {
    key = "cmd+z";
    command = "-undo";
    when = "textInputFocus && !editorReadonly";
  }
  {
    key = "ctrl+y";
    command = "redo";
    when = "textInputFocus && !editorReadonly";
  }
  {
    key = "shift+cmd+z";
    command = "-redo";
    when = "textInputFocus && !editorReadonly";
  }
  {
    key = "ctrl+c";
    command = "editor.action.clipboardCopyAction";
    when = "textInputFocus";
  }
  {
    key = "cmd+c";
    command = "-editor.action.clipboardCopyAction";
    when = "textInputFocus";
  }
  {
    key = "ctrl+v";
    command = "editor.action.clipboardPasteAction";
    when = "textInputFocus && !editorReadonly";
  }
  {
    key = "cmd+v";
    command = "-editor.action.clipboardPasteAction";
    when = "textInputFocus && !editorReadonly";
  }
  {
    key = "ctrl+w";
    command = "workbench.action.closeGroup";
    when = "activeEditorGroupEmpty && multipleEditorGroups";
  }
  {
    key = "cmd+w";
    command = "-workbench.action.closeGroup";
    when = "activeEditorGroupEmpty && multipleEditorGroups";
  }
  {
    key = "ctrl+w";
    command = "workbench.action.closeActiveEditor";
  }
  {
    key = "cmd+w";
    command = "-workbench.action.closeActiveEditor";
  }
  {
    key = "ctrl+w";
    command = "workbench.action.closeWindow";
    when = "!editorIsOpen && !multipleEditorGroups";
  }
  {
    key = "cmd+w";
    command = "-workbench.action.closeWindow";
    when = "!editorIsOpen && !multipleEditorGroups";
  }
  {
    key = "cmd+w";
    command = "workbench.action.switchWindow";
  }
  {
    key = "ctrl+w";
    command = "-workbench.action.switchWindow";
  }
  {
    key = "ctrl+s";
    command = "workbench.action.files.save";
  }
  {
    key = "cmd+s";
    command = "-workbench.action.files.save";
  }
  {
    key = "ctrl+shift+t";
    command = "workbench.action.reopenClosedEditor";
  }
  {
    key = "shift+cmd+t";
    command = "-workbench.action.reopenClosedEditor";
  }
  {
    key = "ctrl+left";
    command = "cursorWordStartLeft";
    when = "textInputFocus";
  }
  {
    key = "alt+left";
    command = "-cursorWordStartLeft";
    when = "textInputFocus";
  }
  {
    key = "ctrl+right";
    command = "cursorWordEndRight";
    when = "textInputFocus";
  }
  {
    key = "alt+right";
    command = "-cursorWordEndRight";
    when = "textInputFocus";
  }
  {
    key = "ctrl+shift+right";
    command = "cursorWordEndRightSelect";
    when = "textInputFocus";
  }
  {
    key = "shift+alt+right";
    command = "-cursorWordEndRightSelect";
    when = "textInputFocus";
  }
  {
    key = "ctrl+shift+left";
    command = "cursorWordStartLeftSelect";
    when = "textInputFocus";
  }
  {
    key = "shift+alt+left";
    command = "-cursorWordStartLeftSelect";
    when = "textInputFocus";
  }
  {
    key = "ctrl+delete";
    command = "workbench.action.terminal.deleteWordRight";
    when = "terminalFocus";
  }
  {
    key = "alt+delete";
    command = "-workbench.action.terminal.deleteWordRight";
    when = "terminalFocus";
  }
  {
    key = "ctrl+shift+delete";
    command = "deleteWordPartRight";
    when = "textInputFocus && !editorReadonly";
  }
  {
    key = "ctrl+alt+delete";
    command = "-deleteWordPartRight";
    when = "textInputFocus && !editorReadonly";
  }
  {
    key = "ctrl+delete";
    command = "deleteWordRight";
    when = "textInputFocus && !editorReadonly";
  }
  {
    key = "alt+delete";
    command = "-deleteWordRight";
    when = "textInputFocus && !editorReadonly";
  }
  {
    key = "ctrl+left";
    command = "workbench.action.terminal.deleteWordLeft";
    when = "terminalFocus";
  }
  {
    key = "alt+backspace";
    command = "-workbench.action.terminal.deleteWordLeft";
    when = "terminalFocus";
  }
  {
    key = "ctrl+x";
    command = "editor.action.clipboardCutAction";
    when = "textInputFocus && !editorReadonly";
  }
  {
    key = "cmd+x";
    command = "-editor.action.clipboardCutAction";
    when = "textInputFocus && !editorReadonly";
  }
  {
    key = "cmd+backspace";
    command = "deleteAllLeft";
    when = "textInputFocus && !editorReadonly";
  }
  {
    key = "cmd+backspace";
    command = "-deleteAllLeft";
    when = "textInputFocus && !editorReadonly";
  }
  {
    key = "cmd+backspace";
    command = "workbench.action.terminal.deleteToLineStart";
    when = "terminalFocus";
  }
  {
    key = "cmd+backspace";
    command = "-workbench.action.terminal.deleteToLineStart";
    when = "terminalFocus";
  }
  {
    key = "ctrl+backspace";
    command = "deleteWordLeft";
    when = "textInputFocus && !editorReadonly";
  }
  {
    key = "alt+backspace";
    command = "-deleteWordLeft";
    when = "textInputFocus && !editorReadonly";
  }
  {
    key = "ctrl+/";
    command = "workbench.action.quickOpenView";
  }
  {
    key = "ctrl+q";
    command = "-workbench.action.quickOpenView";
  }
  {
    key = "cmd+q";
    command = "workbench.action.quit";
  }
  {
    key = "cmd+q";
    command = "-workbench.action.quit";
  }
  {
    key = "ctrl+q";
    command = "editor.action.commentLine";
    when = "editorTextFocus && !editorReadonly";
  }
  {
    key = "cmd+/";
    command = "-editor.action.commentLine";
    when = "editorTextFocus && !editorReadonly";
  }
  {
    key = "cmd+a";
    command = "workbench.action.terminal.selectAll";
    when = "terminalFocus";
  }
  {
    key = "cmd+a";
    command = "-workbench.action.terminal.selectAll";
    when = "terminalFocus";
  }
  {
    key = "ctrl+a";
    command = "-cursorLineStart";
    when = "textInputFocus";
  }
  {
    key = "ctrl+a";
    command = "editor.action.selectAll";
    when = "textInputFocus";
  }
  {
    key = "cmd+a";
    command = "-editor.action.selectAll";
    when = "textInputFocus";
  }
]
