@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)

        Button(){
          Text('Click Me')
            .fontSize(15)
            .padding(20)
            .fontColor( Color.White)
            .onClick(e=>{
              this.message="Clicked!"
            })
        }
      }
      .width('100%')
    }
    .height('100%')
  }
}