import React, { useEffect, useState } from 'react';
import KanbanBoard from '@asseinfo/react-kanban';
import Fab from '@material-ui/core/Fab';
import AddIcon from '@material-ui/icons/Add';
import '@asseinfo/react-kanban/dist/styles.css';

import Task from 'components/Task';
import AddPopup from 'components/AddPopup';
import EditPopup from 'components/EditPopup';
import ColumnHeader from 'components/ColumnHeader';

import useTasks from 'hooks/store/useTasks';

import useStyles from './useStyles';

const MODES = {
  ADD: 'add',
  NONE: 'none',
  EDIT: 'edit',
};

function TaskBoard() {
  const { board, loadBoard, loadTask, updateTask, destroyTask, createTask, onCardDragEnd, onLoadColumnMore } =
    useTasks();
  const [mode, setMode] = useState(MODES.NONE);
  const [openedTaskId, setOpenedTaskId] = useState(null);
  const styles = useStyles();

  useEffect(() => {
    loadBoard();
  }, []);

  const handleOpenAddPopup = () => {
    setMode(MODES.ADD);
  };

  const handleOpenEditPopup = (task) => {
    setOpenedTaskId(task.id);
    setMode(MODES.EDIT);
  };

  const handleClose = () => {
    setMode(MODES.NONE);
    setOpenedTaskId(null);
  };

  const handleTaskUpdate = (task) => updateTask(task).then(() => handleClose());

  const handleTaskLoad = (id) => loadTask(id);

  const loadColumnMore = (state, page = 1, perPage = 10) => onLoadColumnMore(state, page, perPage);
  const handleCardDragEnd = (task, source, destination) => {
    onCardDragEnd(task, source, destination);
  };
  const handleTaskCreate = (params) =>
    createTask(params).then(() => {
      handleClose();
    });
  const handleTaskDestroy = (task) =>
    destroyTask(task).then(() => {
      handleClose();
    });

  return (
    <>
      <Fab onClick={handleOpenAddPopup} className={styles.addButton} color="primary" aria-label="add">
        <AddIcon />
      </Fab>

      <KanbanBoard
        disableColumnDrag
        onCardDragEnd={handleCardDragEnd}
        renderCard={(card) => <Task onClick={handleOpenEditPopup} task={card} />}
        renderColumnHeader={(column) => <ColumnHeader column={column} onLoadMore={loadColumnMore} />}
      >
        {board}
      </KanbanBoard>

      {mode === MODES.ADD && <AddPopup onCreateCard={handleTaskCreate} onClose={handleClose} />}
      {mode === MODES.EDIT && (
        <EditPopup
          onLoadCard={handleTaskLoad}
          onCardDestroy={handleTaskDestroy}
          onUpdateCard={handleTaskUpdate}
          onClose={handleClose}
          cardId={openedTaskId}
        />
      )}
    </>
  );
}
export default TaskBoard;
