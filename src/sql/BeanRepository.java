package sql;

// This does nothing just forces the bean to use this basic functions
public interface BeanRepository<T> {

	public T create();

	public String getResultSet(String table);

	public int update(T bean);

	public void insert(T bean);

}