import dayjs from 'dayjs'
import TodoModel from '../../model/TodoModel'

@CustomDialog
export default struct Detail {
  @State data: TodoModel = {} as TodoModel
  @State open: boolean = false
  controller: CustomDialogController = new CustomDialogController({
    builder: Detail({}),
  })

  openDialog() {
    this.controller.open()

  }

  build() {
    Column() {

      Flex() {
        Text(dayjs().format("YYMM-DD"))
          .fontSize(40)
          .fontWeight(FontWeight.Bolder)
          .margin({ top: 10, bottom: 10 })

        Text(this.data.type.toString())
          .fontSize(20)
          .margin({ top: 10, bottom: 10 })

        Text(this.data.desc)
          .fontSize(20)
          .margin({ top: 10, bottom: 10 })
      }
    }
  }
}