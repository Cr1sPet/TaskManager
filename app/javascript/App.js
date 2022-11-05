import React from 'react';

import store from 'store';
import { Provider } from 'react-redux';
import TaskBoard from 'containers/TaskBoard';
import { ThemeProvider } from '@material-ui/core/styles';

import AppTheme from 'themes/AppTheme';

function App() {
  return (
    <Provider store={store}>
      <ThemeProvider theme={AppTheme}>
        <TaskBoard />
      </ThemeProvider>
    </Provider>
  );
}

export default App;
