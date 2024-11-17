import { router } from '@kit.ArkUI';

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

        Button() {
          Text('Click Me')
            .fontSize(15)
            .padding(20)
            .fontColor(Color.White)
            .onClick(async e => {
              this.message = "Clicked!"
              await router.pushUrl(
                {
                  url: 'pages/Todo'
                }
              )
            })
        }
      }
      .width('100%')
    }
    .height('100%')
  }
}