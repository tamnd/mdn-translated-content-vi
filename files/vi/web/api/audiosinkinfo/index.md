---
title: AudioSinkInfo
slug: Web/API/AudioSinkInfo
page-type: web-api-interface
status:
  - experimental
browser-compat: api.AudioSinkInfo
---

{{APIRef("Web Audio API")}}{{SeeCompatTable}}

Giao diện **`AudioSinkInfo`** của {{domxref("Web Audio API", "Web Audio API", "", "nocode")}} biểu diễn thông tin mô tả sink ID của một {{domxref("AudioContext")}}, được truy xuất thông qua {{domxref("AudioContext.sinkId")}}.

{{InheritanceDiagram}}

## Instance properties

- {{domxref("AudioSinkInfo.type", "type")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về kiểu của thiết bị đầu ra âm thanh.

## Examples

Nếu một {{domxref("AudioContext")}} mới được tạo với giá trị `sinkId` là `{ type: 'none' }`, việc gọi {{domxref("AudioContext.sinkId")}} ở phần sau của mã sẽ trả về một đối tượng `AudioSinkInfo` chứa `type: 'none'`. Hiện tại đây là giá trị duy nhất khả dụng.

```js
audioCtx = new window.AudioContext({
  sinkId: { type: "none" },
});

// …

audioCtx.sinkId;
```

## Specifications

{{Specifications}}

## Browser compatibility

{{Compat}}

## See also

- [Ví dụ kiểm thử SetSinkId](https://mdn.github.io/dom-examples/audiocontext-setsinkid/) (xem [mã nguồn](https://github.com/mdn/dom-examples/tree/main/audiocontext-setsinkid))
- {{domxref("AudioContext.setSinkId()")}}
- {{domxref("AudioContext.sinkId")}}
- {{domxref("AudioContext/sinkchange_event", "sinkchange")}}
