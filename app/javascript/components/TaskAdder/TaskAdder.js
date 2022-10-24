import React from 'react';
import Fab from '@material-ui/core/Fab';
import AddIcon from '@mui/icons-material/Add';
import styles from './useStyles';

export default function TaskAdder() {
  return (
    <Fab className={styles.addButton} color="primary" aria-label="add">
      <AddIcon />
    </Fab>
  );
}
