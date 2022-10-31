import PropTypes from 'prop-types';
import PropTypesPresenter from 'utils/PropTypesPresenter';

export default new PropTypesPresenter(
  {
    id: PropTypes.number,
    name: PropTypes.string.isRequired,
    description: PropTypes.string.isRequired,
  },
  {
    fullName(user) {
      return `${this.firstName(user)} ${this.lastName(user)}`;
    },
  },
);
