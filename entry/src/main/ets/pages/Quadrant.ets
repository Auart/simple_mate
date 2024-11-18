import { TodoStatus } from "../common/constants/todo/TodoStatus"
import { TodoType } from "../common/constants/todo/TodoType"
import TodoModel from "../model/TodoModel"
import TodoItem from "../view/todo/TodoItem"

// @Entry
@Component
export  struct Quadrant {
  @State numbers: String[] = ["重要且紧急","重要不紧急","不重要紧急","不重要不紧急"]
  scroller: Scroller = new Scroller()
  @State text: string = 'drag'
  @State gridItemColor:string='#79FFF7E0'


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


  //拖拽过程中展示的样式
  @Builder pixelMapBuilder() {
    Column() {
      Text(this.text)
        .fontSize(16)
        .backgroundColor(this.gridItemColor)
        .width(80)
        .height(80)
        .textAlign(TextAlign.Center)
    }
  }

  aboutToAppear() {
    for (let i = 0;i < 4; i++) {
      this.numbers.push(this.numbers[i])
    }
  }

  //交换数组中元素位置
  changeIndex(index1: number, index2: number) {
    let temp = this.numbers[index1];
    this.numbers[index1] = this.numbers[index2];
    this.numbers[index2] = temp;
  }

  build() {
    Column({ space: 5 }) {
      Grid(this.scroller) {
        ForEach(this.numbers, (day: string) => {
          GridItem() {
            // Text(day)
            //   .fontSize(16)
            //   .backgroundColor(this.gridItemColor)
            //   .width("80%")
            //   .height("80%")
            //   .textAlign(TextAlign.Center)
            //   .onTouch((event: TouchEvent) => {
            //     if (event.type === TouchType.Down) {
            //       this.text = day
            //     }
            //   })
            Row() {
              // Row() {
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
              // }
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
        )
      }
      .rowsTemplate(('1fr 1fr') as string)
      .columnsTemplate(('1fr 1fr') as string)
      .onScrollIndex((first: number) => {
        console.info(first.toString())
      })
      .width('100%')

      .height('100%')
      //设置Grid是否进入编辑模式，进入编辑模式可以拖拽Grid组件内部GridItem
      .editMode(true)
      //第一次拖拽此事件绑定的组件时，触发回调
      .onItemDragStart((event: ItemDragInfo, itemIndex: number) => {
        return this.pixelMapBuilder()
      })
      //绑定此事件的组件可作为拖拽释放目标，当在本组件范围内停止拖拽行为时，触发回调
      //itemIndex为拖拽起始位置，insertIndex为拖拽插入位置
      .onItemDrop((event: ItemDragInfo, itemIndex: number, insertIndex: number, isSuccess: boolean) => {
        //不支持拖拽到已有内容以外的位置
        if(insertIndex < this.numbers.length){
          this.changeIndex(itemIndex, insertIndex)
        }
      })
    }.width('100%')
  }
}