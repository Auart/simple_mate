@Component
export default struct TodoItemOperation {
  @State open: boolean = true

  @Builder
  MyMenu() {
    Menu() {
      MenuItem({ content: "菜单选项" })
      MenuItem({ content: "菜单选项" })
      MenuItem({ content: "菜单选项" })
      MenuItem({ content: "菜单选项" })
    }
  }

  build() {
    Row() {
      Column() {
        Text('click to show menu')
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
      }
      .bindMenu(this.MyMenu, {})
      .width('100%')
    }
    .height('100%')
  }
}