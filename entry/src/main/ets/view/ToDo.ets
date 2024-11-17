//ToDo.ets
import { util } from '@kit.ArkTS'

export class ToDo {
  key: string = util.generateRandomUUID(true);
  name: string;

  constructor(name: string) {
    this.name = name;
  }
}