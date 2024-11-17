// type
import { TodoStatus } from '../common/constants/todo/TodoStatus';
import { TodoType } from "../common/constants/todo/TodoType";

interface TodoModel {
  id: number;
  name: string;
  desc: string;
  type: TodoType;
  status: TodoStatus;
  createTime: number;
  updateTime: number;
}

const a: TodoModel[] = [{
  id: 1,
  name: "TODO",
  desc: "TODO",
  type: TodoType.TODO,
  status: TodoStatus.UNFINISHED,
  createTime: Date.now(),
  updateTime: Date.now()
}]

export default TodoModel;
