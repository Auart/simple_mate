import { CJCalendar, OptMode } from 'cjcalendar'
import promptAction from '@ohos.promptAction'
import { ToDoList } from '../view/ToDoList'

@Component
export struct Schedule {
  build() {
    Column(){
      CJCalendar({
        // 范围选择
        optMode: OptMode.MULTIPLE,
      })
      ToDoList()
      Row(){
        Text('选择日程模板')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 10, bottom: 5, left: 10 });
        Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
          Button('点击')
            .onClick(() => {
              ActionSheet.show({
                title: '日程模板',
                message: '请选择日程模板',
                autoCancel: true,
                confirm: {
                  defaultFocus: true,
                  value: '确认',
                  action: () => {
                    promptAction.showToast({
                      message:"确认成功"
                    })
                  }
                },
                alignment: DialogAlignment.Bottom,
                offset: { dx: 0, dy: -10 },
                sheets: [
                  {
                    title: '高效工作模板',
                    action: () => {
                      console.log('work')
                    }
                  },
                  {
                    title: '学习提升模板',
                    action: () => {
                      console.log('study')
                    }
                  },
                  {
                    title: '休闲娱乐模板',
                    action: () => {
                      console.log('leisure')
                    }
                  }
                ]
              })
            })
        }.width('100%')
        .height('100%')
      }
      Button() {
        Image($r('app.media.add'))
      }
      .width(50)
      .height(50)
      .position({x: '80%', y: 600})
      .shadow({radius: 10})
      .onClick(() => {

      })

    }
  }
}

