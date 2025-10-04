// main.js

function MyButton() {
  return (
    <button>
      I'm a button
    </button>
  );
}

function MyApp() {
  return (
    <div>
      <h1>Welcome to my app</h1>
      <MyButton />
    </div>
  );
}

// Render to the DOM
const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(<MyApp />);

function CounterButton() {
  const [count, setCount] = React.useState(0);
  return (
    <button onClick={() => setCount(count + 1)}>
      Clicked {count} times
    </button>
  );
}