import { Constants } from '../common/constants/Constants';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { Schedule } from '../pages/Schedule';

@Component
export  struct BottomTab {
  @State currentIndex: number = 0;
  private tabsController: TabsController = new TabsController();

  @Builder
  tabBuilder(index: number, selectedImg: Resource, normalImg: Resource) {
    Column() {
      Image(this.currentIndex === index ? selectedImg : normalImg)
        .width(24)
        .height(24)
        .objectFit(ImageFit.Contain)
    }
    .justifyContent(FlexAlign.Center)
    .height(52)
    .width('100%')
    .onClick(() => {
      this.currentIndex = index;
      this.tabsController.changeIndex(this.currentIndex);
    })
  }

  @Builder
  tabContentBuilder<T extends () => void>(content: T,index: number, selectedImg: Resource, normalImg: Resource) {
    TabContent() {

    }
    .padding({ left: 12, right: 12 })
    .backgroundColor(Color.White)
    .tabBar(this.tabBuilder( index, selectedImg, normalImg))
  }
  build() {
    Tabs({
      barPosition: BarPosition.End,
      controller: this.tabsController
    }) {
      // this.tabContentBuilder(this,
      //   Constants.TAB_INDEX_ZERO, $r('app.media.waitdone_selected'), $r('app.media.waitdone_normal'))
      // this.tabContentBuilder(this,
      //   Constants.TAB_INDEX_ONE, $r('app.media.calendar_selected'), $r('app.media.calendar_normal'))
      // this.tabContentBuilder(this,
      //   Constants.TAB_INDEX_TWO, $r('app.media.more_selected'), $r('app.media.more_normal'))
      // this.tabContentBuilder(this,
      //   Constants.TAB_INDEX_THREE, $r('app.media.set_selected'), $r('app.media.set_normal'))
    }
    .width('100%')
    .backgroundColor('#F3F4F5')
    .barHeight(52)
    .barMode(BarMode.Fixed)
    .onAnimationStart((index: number, targetIndex: number) => {
      hilog.info(0x0000, 'index', index.toString());
      this.currentIndex = targetIndex;
    })
  }
}


