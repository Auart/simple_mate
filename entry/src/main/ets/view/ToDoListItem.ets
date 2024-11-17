//ToDoListItem.ets
import { ToDo } from './ToDo';
@Component
export struct ToDoListItem {
  @Link isEditMode: boolean
  @Link selectedItems: ToDo[]
  private toDoItem: ToDo = new ToDo("");

  build() {
    Flex({ justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
      // ...
    }
    .width('100%')
    .height(80)
    //.padding() 根据具体使用场景设置
    .borderRadius(24)
    //.linearGradient() 根据具体使用场景设置
    .gesture(
      GestureGroup(GestureMode.Exclusive,
        LongPressGesture()
          .onAction(() => {
            // ...
          })
      )
    )
  }
}