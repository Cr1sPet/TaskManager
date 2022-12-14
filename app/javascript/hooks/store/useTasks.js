import { useSelector } from 'react-redux';
import { useTasksActions } from 'slices/TasksSlice';
import { STATES } from 'presenters/TaskPresenter';

const useTasks = () => {
  const board = useSelector((state) => state.TasksSlice.board);
  const { loadColumn, loadTask, updateTask, destroyTask, createTask, onCardDragEnd, onLoadColumnMore } =
    useTasksActions();
  const loadBoard = () => Promise.all(STATES.map(({ key }) => loadColumn(key)));

  return {
    board,
    loadBoard,
    loadColumn,
    loadTask,
    updateTask,
    destroyTask,
    createTask,
    onCardDragEnd,
    onLoadColumnMore,
  };
};

export default useTasks;
