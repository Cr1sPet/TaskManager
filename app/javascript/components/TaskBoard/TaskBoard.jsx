import React from 'react';
import TasksRepository from 'repositories/TasksRepository';
import { camelize, decamelize } from 'utils/keysConverter';

function TaskBoard() {
  const fetch = () => {
    TasksRepository.index({
      q: { stateEq: 'new_task' },
      page: 1,
      perPage: 5,
    });
  };
  return (
    <button type="button" onClick={() => fetch()}>
      Fetch all Tasks
    </button>
  );
}

export default TaskBoard;
