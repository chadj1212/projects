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
    <li>
      {isEditing ? (
        <>
          <input
            type="text"
            value={editText}
            onChange={(e) => setEditText(e.target.value)}
          />
          <button className="todo-btn todo-save" onClick={handleSave}>Save</button>
          <button className="todo-btn todo-cancel" onClick={() => setIsEditing(false)}>Cancel</button>
        </>
      ) : (
        <>
          <span
            onClick={() => toggleTodo(todo.id)}
            className={todo.completed ? "completed" : ""}
          >
            {todo.text}
          </span>
          <div>
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