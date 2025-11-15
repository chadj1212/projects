import React, { createContext, useContext, useReducer } from "react";

const ADD_TODO = "ADD_TODO";
const TOGGLE_TODO = "TOGGLE_TODO";
const DELETE_TODO = "DELETE_TODO";
const EDIT_TODO = "EDIT_TODO";


const initialState = [];


const todoReducer = (state, action) => {
  switch (action.type) {
    case ADD_TODO:
      return [...state, { id: Date.now(), text: action.payload, completed: false }];
    case TOGGLE_TODO:
      return state.map(todo =>
        todo.id === action.payload ? { ...todo, completed: !todo.completed } : todo
      );
    case DELETE_TODO:
      return state.filter(todo => todo.id !== action.payload);
    default:
      return state;
      case EDIT_TODO:
  return state.map(todo =>
    todo.id === action.payload.id ? { ...todo, text: action.payload.text } : todo
  );

  }
};


const TodoContext = createContext();

export const TodoProvider = ({ children }) => {
  const [todos, dispatch] = useReducer(todoReducer, initialState);

  const addTodo = (text) => dispatch({ type: ADD_TODO, payload: text });
  const toggleTodo = (id) => dispatch({ type: TOGGLE_TODO, payload: id });
  const deleteTodo = (id) => dispatch({ type: DELETE_TODO, payload: id });
  const editTodo = (id, text) => dispatch({ type: EDIT_TODO, payload: { id, text } });

  return (
    <TodoContext.Provider value={{ todos, addTodo, toggleTodo, deleteTodo, editTodo }}>
      {children}
    </TodoContext.Provider>
  );
};




export const useTodos = () => useContext(TodoContext);