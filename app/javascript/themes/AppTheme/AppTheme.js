import { purple, green } from '@material-ui/core/colors';
import { createTheme } from '@material-ui/core/styles';

const AppTheme = createTheme({
  palette: {
    primary: {
      main: purple[500],
    },
    secondary: {
      main: green[500],
    },
  },
});

export default AppTheme;
