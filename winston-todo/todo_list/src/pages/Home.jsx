import React from "react";
import TodoInput from "../components/TodoInput";
import TodoList from "../components/TodoList";

const Home = () => {
  return (
    <div>
      <h1>Todo List</h1>
      <TodoInput />
      <TodoList />
    </div>
  );
};

export default Home;
