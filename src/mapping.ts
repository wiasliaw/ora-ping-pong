//@ts-ignore
import { require, console } from "@ora-io/cle-lib";
import { Account, Bytes, Block, Event, Slot } from "@ora-io/cle-lib";

let addr = Bytes.fromHexString('0x03A6D940390A0fd5630059558AfC2b6464b3cA02');
// event Request(uint256 _requestId);
let event_sig = Bytes.fromHexString("0x8b1295efbde7fffca82bb0c4436536b62729e0eb3df63145179c8588c704de0b");
// automation: fulfilled(uint256);
let func_sig = Bytes.fromHexString("0x1bc404d6");
// storage slot 0
let key = Bytes.fromHexString('0x0000000000000000000000000000000000000000000000000000000000000000');

export function handleBlocks(blocks: Block[]): Bytes {
  // get source Account object by address
  let acct: Account = blocks[0].account(addr);

  // get events
  let eventsByAcctEsig: Event[] = blocks[0].account(addr).eventsByEsig(event_sig);

  // require match event count > 0
  require(eventsByAcctEsig.length > 0, "Trigger condition failed.");

  // event data
  let data: Bytes = eventsByAcctEsig[0].data;

  // return
  let str: string = func_sig.concat(data).toHexString();
  console.log(str);
  let ret: Bytes = Bytes.fromHexString(str);

  return ret;
}
