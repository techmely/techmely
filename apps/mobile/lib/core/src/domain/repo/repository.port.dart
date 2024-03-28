class Paginated<T> {
  final int count;
  final int limit;
  final int page;
  final List<T> data;

  Paginated({
    required this.count,
    required this.limit,
    required this.page,
    required this.data,
  });
}

class PaginatedQueryParams {
  final int limit;
  final int page;
  final int offset;
  final OrderBy orderBy;

  PaginatedQueryParams({
    required this.limit,
    required this.page,
    required this.offset,
    required this.orderBy,
  });
}

class OrderBy {
  final String field;
  final OrderByDirection direction;

  OrderBy({
    required this.field,
    required this.direction,
  });
}

enum OrderByDirection {
  asc,
  desc,
}

abstract class Repository<Entity> {
  Future<Entity> findById(String id);
  Future<Entity> findByKey(key);
  Future<List<Entity>> findAll();
  Future<List<Entity>> findAllByIds(List<String> ids);
  Future<Paginated<Entity>> findAllPaginated(PaginatedQueryParams params);
  Future<bool> existsById(String id);
  Future<int> count();

  Future<void> insert(Entity entity);
  Future<void> insertBulk(Entity entity);
  Future<void> insertMany(List<Entity> entities);
  Future<void> update(Entity entity);
  Future<void> updateBulk(Entity entity);
  Future<void> updateMany(List<Entity> entities);
  Future<bool> delete(Entity entity);
  Future<bool> deleteById(String id);
  Future<bool> deleteAllByIds(List<String> ids);
  Future<void> deleteBulk(Entity entity);

  Future<T> transaction<T>(Future<T> Function() handler);
}
