package sql;

// This does nothing just forces the bean to use this basic functions
public interface BeanRepository<T> {
	
	public T create();
	
	public String getQueryVariables(String table);
	
	public int update(T bean);
	
}