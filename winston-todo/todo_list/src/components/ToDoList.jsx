import React from "react";
import { useTodos } from "../context/TodoContext";
import TodoItem from "./ToDoItem";

const TodoList = () => {
  const { todos } = useTodos();

  if (todos.length === 0) return <p>No todos yet!</p>;

  return (
    <ul style={{ listStyle: "none", padding: 0 }}>
      {todos.map((todo) => (
        <TodoItem key={todo.id} todo={todo} />
      ))}
    </ul>
  );
};

export default TodoList;