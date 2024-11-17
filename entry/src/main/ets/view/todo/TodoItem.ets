import { TodoStatus } from '../../common/constants/todo/TodoStatus';
import { TodoType } from '../../common/constants/todo/TodoType';
import TodoModel from '../../model/Todo';

@Component
@Reusable
export default struct TodoItem {
  private data: TodoModel = {} as TodoModel;

  build() {
    Row() {
      Column() {
        Row() {
          Checkbox()
            .select(this.data.id == 1)
            .width(30)
            .height(30)
            .margin({
              right: 10
            })
            .onChange((value) => {
              if (!value) {
                return
              }
              AlertDialog.show({
                title: '确定已经完成了吗？',
                message: '',
                autoCancel: true,
                alignment: DialogAlignment.Bottom,
                primaryButton: {
                  value: 'No',
                  action: () => {
                    console.info('Callback when the first button is clicked')
                  }
                },
                secondaryButton: {
                  value: 'Yes',
                  action: () => {
                    console.info('Callback when the second button is clicked')
                  }
                }
              })
            })

          Text(this.data.name)
            .width("100%")// .alignItems(VerticalAlign.Center)
            .margin({
              bottom: 10
            })

        }
      }
      .width('100%')
      .onClick(e => {
      })
    }
  }
}


