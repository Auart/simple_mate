import { TodoStatus } from '../../common/constants/todo/TodoStatus';
import { TodoType } from '../../common/constants/todo/TodoType';
import TodoModel from '../../model/Todo';
import Detail from './TodoDetail';

import TodoItemOperation from './TodoItemOperation';


@Component
export default struct TodoItem {
  @State data: TodoModel = {} as TodoModel;
  @State selected: boolean = false
  dialog: CustomDialogController = new CustomDialogController({
    builder: Detail({
      data: this.data
    })
  })

  changeStatus(status: boolean) {
    this.selected = status
  }

  openDetail(that: TodoItem) {
    that.dialog.open()
  }

  @Builder
  operations(e: ClickEvent) {
    // TodoItemOperation().build()
  }

  verifyIsFinished(that: TodoItem) {
    // const that=this
    AlertDialog.show({
      title: '确定已经完成了吗？',
      message: '',
      alignment: DialogAlignment.Bottom,
      primaryButton: {
        value: 'No',
        action: () => {
          that.changeStatus(true)
          that.changeStatus(false)
        }
      },
      secondaryButton: {
        value: 'Yes',
        action: () => {
          that.changeStatus(true)
        }
      }
    })
  }

  @Builder
  Card() {
    if (this.selected) {
      Row() {
        Text(this.data.name).margin({
          right: 10
        })

        Text("Done !").textAlign(TextAlign.Center)
      }

    } else {
      Column() {
        Flex() {
          Checkbox()
            .width(30)
            .height(30)
            .select(this.selected)
            .margin({
              right: 10
            })
            .onClick(() => this.verifyIsFinished(this))
          Row() {
            Flex({
              direction: FlexDirection.Column
            }) {
              Text(this.data.name)
                .fontWeight(FontWeight.Bold)
              Text(this.data.desc)
                .fontWeight(FontWeight.Bold)
                .fontSize(8)
                .fontColor(Color.Gray)
                .margin({
                  top: 2
                })
                .textOverflow({
                  overflow: TextOverflow.Ellipsis,
                })
            }.onClick(() => this.openDetail(this))

          }.justifyContent(FlexAlign.Start)
          .width("100%")


          Text("。。。")
            .fontSize(8)
            .fontColor(Color.Gray)
            .margin({
              top: 2
            })
            .onClick(this.operations)
        }

      }
      .justifyContent(FlexAlign.Center)
      .width('100%')
    }


  }

  build() {
    Row() {
      this.Card()
    }
  }
}








