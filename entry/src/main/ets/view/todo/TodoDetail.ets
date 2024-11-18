import TodoModel from '../../model/Todo'

@CustomDialog
export  default  struct Detail {
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
      Text(this.data.desc)
        .fontSize(20)
        .margin({ top: 10, bottom: 10 })
    }
  }
}