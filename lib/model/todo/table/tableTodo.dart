class TableTodo {
  static const tableName = "todos";
  static const nameColumn = "name";
  static const idColumn = "id";
  static const statusColumn = "status";

  static create() {
    return "CREATE TABLE $tableName("
        "$nameColumn TEXT,"
        " $idColumn INTEGER PRIMARY KEY NOT NULL,"
        " $statusColumn INTEGER DEFAULT 0"
        ")";
  }
}
