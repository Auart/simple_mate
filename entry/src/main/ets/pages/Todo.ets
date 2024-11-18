import { TodoStatus } from '../common/constants/todo/TodoStatus'
import { TodoType } from '../common/constants/todo/TodoType'
import TodoModel from "../model/Todo"
import { CardRecognition } from '@hms.ai.CardRecognition'
import TodoItem from "../view/todo/TodoItem"

@Entry
@Component
struct Todo {
  fetchData(): TodoModel[] {
    let data: TodoModel[] = new Array<TodoModel>(100)

    for (let index = 0; index < data.length; index++) {
      data[index] = ({
        name: "TODO" + index,
        desc: "desc---" + index,
        type: TodoType.TODO,
        status: TodoStatus.UNFINISHED,
        createTime: Date.now(),
        updateTime: Date.now(),
        id: index
      } as TodoModel)

    }

    return data
  }

  aboutToAppear(): void {
    console.log("hiai")
  }

  build() {
    Row() {
      Scroll() {
        Column() {
          ForEach(this.fetchData() as TodoModel[], (item: TodoModel) => {
            TodoItem({
              data: item
            })
          },
            (item: TodoModel) => item.id.toString()
          )
        }

      }
      .scrollable(ScrollDirection.Vertical)
      .scrollBar(BarState.Auto)
      .scrollBarWidth(10)
    }
  }
}