---
title: SourceBufferList
slug: Web/API/SourceBufferList
page-type: web-api-interface
browser-compat: api.SourceBufferList
---

{{APIRef("Media Source Extensions")}}{{AvailableInWorkers("window_and_dedicated")}}

Giao diện **`SourceBufferList`** đại diện cho một danh sách đơn giản chứa nhiều đối tượng {{domxref("SourceBuffer")}}.

Danh sách source buffer chứa các `SourceBuffer` được thêm vào một `MediaSource` cụ thể có thể được lấy bằng thuộc tính {{domxref("MediaSource.sourceBuffers")}}.

Các source buffer riêng lẻ có thể được truy cập bằng [ký hiệu ngoặc vuông](/en-US/docs/Web/JavaScript/Reference/Operators/Property_accessors#bracket_notation) `[]`.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

- {{domxref("SourceBufferList.length")}} {{ReadOnlyInline}}
  - : Trả về số đối tượng {{domxref("SourceBuffer")}} trong danh sách.

## Phương thức phiên bản

_Kế thừa các phương thức từ giao diện cha, {{domxref("EventTarget")}}._

## Sự kiện

- {{domxref("SourceBufferList.addsourcebuffer_event", "addsourcebuffer")}}
  - : Được kích hoạt khi một {{domxref("SourceBuffer")}} được thêm vào danh sách.
- {{domxref("SourceBufferList.removesourcebuffer_event", "removesourcebuffer")}}
  - : Được kích hoạt khi một {{domxref("SourceBuffer")}} bị xóa khỏi danh sách.

## Ví dụ

Ví dụ này cho thấy cách truy cập các source buffer đang hoạt động của {{domxref("MediaSource")}} được kết nối với một {{domxref("HTMLVideoElement")}} đang phát.

```js
// Video is an already playing video using a MediaSource srcObject
const video = document.querySelector("video");
const mediaSource = video.srcObject;
const sourceBufferList = mediaSource.activeSourceBuffers;
for (const sourceBuffer of sourceBufferList) {
  // Do something with each SourceBuffer, such as call abort()
  sourceBuffer.abort();
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("MediaSource")}}
- {{domxref("SourceBuffer")}}
