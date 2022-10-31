import PropTypes from 'prop-types';
import PropTypesPresenter from 'utils/PropTypesPresenter';
import UserPresenter from './UserPresenter';

export default new PropTypesPresenter(
  {
    id: PropTypes.number,
    name: PropTypes.string.isRequired,
    description: PropTypes.string.isRequired,
    author: UserPresenter.shape(),
  },
  {
    name(task) {
      return task.name;
    },
    description(task) {
      return task.description;
    },
  },
);
