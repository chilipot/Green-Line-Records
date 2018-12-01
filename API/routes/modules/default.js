class Query {
  constructor(table) {
    this.table = table;
    this.join = [];
    this.where = [];
    this.statement = [];
    this.columns = [];
  }


  /**
   * setStatement - Sets the query statement that is being used.
   *
   * @param  {String} state INSERT, DELETE, UPDATE, or SELECT.
   * @return {void}         Sets the value of this.statement.
   * @throws                Invalid query statement input.
   */
  setStatement(state) {
    if (state == 'INSERT') {
      this.statement = state;
      return;
    };
    if (state == 'DELETE') {
      this.statement = state;
      return;
    };
    if (state == 'UPDATE') {
      this.statement = state;
      return;
    };
    if (state == 'SELECT') {
      this.statement = state;
      return;
    };
    console.error('Invalid query statement: ' + state);
  }

  /**
   * addJoinTable - Adds given table to the join list.
   *
   * @param {String} table  The name of the table and the join condition.
   * @return {void}         Add's the table to this.join.
   */
  addJoinTable(table) {
    this.join.push(table);
  }

  /**
   * setJoin - Adds tables to be joined together.
   *
   * @param  {String[]} joinTables  A List of tables to join.
   * @return {void}               Sets the value of this.join.
   */
  setJoin(joinTables) {
    for (var i = 0; i < joinTables.length; ++i) {
      this.addJoinTable(joinTables[i]);
    }
  }

  /**
   * addWhereCond - Adds given condition to the where list.
   *
   * @param {String} cond   The conditional.
   * @return {void}         Add's the conditional to this.where.
   */
  addWhereCond(cond) {
    this.where.push(cond);
  }

  /**
   * setWhere - Adds conditions to the query using where.
   *
   * @param  {String[]} whereCond  A List of conditions.
   * @return {void}               Sets the value of this.where.
   */
  setWhere(whereCond) {
    for (var i = 0; i < whereCond.length; ++i) {
      this.addWhereCond(whereCond[i]);
    }
  }

  /**
   * addColumn - Adds the table column to the query.
   *
   * @param {String} col    The name of the colomn.
   * @return {void}         Add's the olumn to this.columns
   */
  addColumn(col) {
    this.columns.push(col);
  }

  /**
   * setColumns - Adds the columns to be displayed in the query.
   *
   * @param  {String[]} columns  A List of columns to display.
   * @return {void}               Sets the value of this.columns.
   */
  setColumns(columns) {
    for (var i = 0; i < columns.length; ++i) {
      this.addColumn(columns[i]);
    }
  }

  /**
   * buildStatement - Concatenates each separate statements.
   *
   * @param  {String[]} array An array of satements.
   * @return {String}         A single string of the concatenated statements.
   */
  buildStatement(array) {
    var join = '';
    for (var i = 0; i < array.length; ++i) {
      join += array[i] + " ";
    }
    return join;
  }


  /**
   * buildQuery - Contructs the query string to sned to the database.
   *
   * @return {String} The queary string.
   */
  buildQuery() {
    const joinVal = this.buildStatement(this.join);
    const columnVal = this.buildStatement(this.columns);
    const whereVal = this.buildStatement(this.where);
    var queryString = `${ this.statement } ${ columnVal } FROM ${ this.table } ${ joinVal } ${ whereVal };`;
    return queryString;
  }

  getByName(name, col) {
    this.setStatement('SELECT');
    this.setColumns(['*']);
    this.setWhere(["where " + col + " like \'%" + name + "%\'"]);
    return this.buildQuery();
  }

  getByID(id, col) {
    this.setStatement('SELECT');
    this.setColumns(['*']);
    this.setWhere(["where " + col + "=" + id]);
    return this.buildQuery();
  }
}

module.exports = Query;
