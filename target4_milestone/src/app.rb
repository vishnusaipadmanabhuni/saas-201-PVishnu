require 'sinatra'

def get_todos
  @@todos ||= []
end

def get_todo
  get_todos()[@id.to_i - 1]
end

def add_todo(todo)
  get_todos().push(todo)
end

def update_todo(title)
 get_todos()[@id.to_i-1]={title => get_todos()[@id.to_i-1].values[0]}
end

def delete_todo
	get_todos().slice!(@id.to_i-1)
end

#create main page for each todo
get "/todos" do
  @todos = get_todos()
  erb :todos
end

#create the todo content
post "/todos" do
  add_todo(params[:title] => params[:date])
  redirect "/todos"
end

#display todo content
get "/todos/:id" do
  @id = params[:id]
  @todo = get_todo()
  erb :todo
end

#update the todo content
put "/todos/:id" do
	@id=params[:id]
	update_todo(params[:title])
	redirect "/todos"
end

#delete the todo content
delete "/todos/:id" do
	@id=params[:id]
	delete_todo()
	redirect "/todos"
end