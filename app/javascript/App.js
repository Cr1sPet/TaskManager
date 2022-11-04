import React from 'react';

import store from 'store';
import { Provider } from 'react-redux';
import TaskBoard from 'containers/TaskBoard';
import MUITheme from 'MUITheme/MUITheme';

function App() {
  return (
    <Provider store={store}>
      <MUITheme>
        <TaskBoard />
      </MUITheme>
    </Provider>
  );
}

export default App;
