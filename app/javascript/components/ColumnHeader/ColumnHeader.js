import React from 'react';
import PropTypes from 'prop-types';

import IconButton from '@material-ui/core/IconButton';
import SystemUpdateAltIcon from '@material-ui/icons/SystemUpdateAlt';

import useStyles from './useStyles';

function ColumnHeader({ column, onLoadMore }) {
  const styles = useStyles();

  const {
    id,
    title,
    cards,
    meta: { totalCount, currentPage },
  } = column;

  const count = cards.length;

  const show = !(count === totalCount);

  const handleLoadMore = () => {
    onLoadMore(id, currentPage + 1);
  };

  return (
    <div className={styles.root}>
      <div className={styles.title}>
        <b>{title}</b> ({count}/{totalCount || '…'})
      </div>
      <div className={styles.actions}>
        {show && (
          <IconButton aria-label="Load more" onClick={() => handleLoadMore()}>
            <SystemUpdateAltIcon fontSize="small" />
          </IconButton>
        )}
      </div>
    </div>
  );
}

ColumnHeader.propTypes = {
  column: PropTypes.shape({
    id: PropTypes.string.isRequired,
    title: PropTypes.string.isRequired,
    cards: PropTypes.arrayOf(PropTypes.shape()).isRequired,
    meta: PropTypes.shape({
      totalCount: PropTypes.number,
      currentPage: PropTypes.number,
    }),
  }).isRequired,
  onLoadMore: PropTypes.func.isRequired,
};

export default ColumnHeader;
