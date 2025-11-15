import React, { useState } from "react";
import { useTodos } from "../context/TodoContext";

const TodoItem = ({ todo }) => {
  const { toggleTodo, deleteTodo, editTodo } = useTodos();
  const [isEditing, setIsEditing] = useState(false);
  const [editText, setEditText] = useState(todo.text);

  const handleSave = () => {
    if (editText.trim()) {
      editTodo(todo.id, editText);
      setIsEditing(false);
    }
  };

  return (
    <li className="todo-item">
      {isEditing ? (
        <>
          <input
            type="text"
            className="todo-edit-input"
            value={editText}
            onChange={(e) => setEditText(e.target.value)}
          />
          <button className="todo-btn todo-save" onClick={handleSave}>
            Save
          </button>
          <button className="todo-btn todo-cancel" onClick={() => setIsEditing(false)}>
            Cancel
          </button>
        </>
      ) : (
        <>
          <div className="todo-left">
            <input
              type="checkbox"
              checked={todo.completed}
              onChange={() => toggleTodo(todo.id)}
              className="todo-checkbox"
            />

            <span className={todo.completed ? "completed" : ""}>
              {todo.text}
            </span>
          </div>

          <div className="todo-actions">
            <button className="todo-btn todo-edit" onClick={() => setIsEditing(true)}>
              Edit
            </button>
            <button className="todo-btn" onClick={() => deleteTodo(todo.id)}>
              Delete
            </button>
          </div>
        </>
      )}
    </li>
  );
};

export default TodoItem;