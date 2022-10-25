import React, { useState } from 'react';
import Fab from '@material-ui/core/Fab';
import AddIcon from '@mui/icons-material/Add';
import useStyles from './useStyles';
import AddPopup from 'components/AddPopup';
import TaskForm from 'forms/TaskForm';
import TasksRepository from 'repositories/TasksRepository';

export default function TaskAdder({ loadColumn }) {
  const styles = useStyles();

  const MODES = {
    ADD: 'add',
    NONE: 'none',
  };

  const [mode, setMode] = useState(MODES.NONE);

  const handleOpenAddPopup = () => {
    setMode(MODES.ADD);
  };

  const handleClose = () => {
    setMode(MODES.NONE);
  };

  const handleTaskCreate = (params) => {
    const attributes = TaskForm.attributesToSubmit(params);
    return TasksRepository.create(attributes).then(({ data: { task } }) => {
      handleClose();
      loadColumn(task.state);
    });
  };

  return (
    <div>
      {mode === MODES.ADD && <AddPopup onCreateCard={handleTaskCreate} onClose={handleClose} />}
      <Fab onClick={handleOpenAddPopup} className={styles.addButton} color="primary" aria-label="add">
        <AddIcon />
      </Fab>
    </div>
  );
}
