---
title: OverconstrainedError
slug: Web/API/OverconstrainedError
page-type: web-api-interface
browser-compat: api.OverconstrainedError
---

{{APIRef("Media Capture and Streams")}}

Giao diện **`OverconstrainedError`** của [Media Capture and Streams API](/en-US/docs/Web/API/Media_Capture_and_Streams_API) chỉ ra rằng tập hợp các khả năng mong muốn cho {{domxref('MediaStreamTrack')}} hiện tại không thể đáp ứng được hiện tại. Khi sự kiện này được ném trên một MediaStreamTrack, nó bị tắt tiếng cho đến khi các ràng buộc hiện tại có thể được thiết lập hoặc cho đến khi các ràng buộc thỏa mãn được áp dụng.

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("OverconstrainedError.OverconstrainedError", "OverconstrainedError()")}}
  - : Tạo một đối tượng `OverconstrainedError` mới.

## Thuộc tính phiên bản

_Cũng kế thừa các thuộc tính từ giao diện cha, {{domxref('DOMException')}}._

- {{domxref("OverconstrainedError.constraint")}} {{ReadOnlyInline}}
  - : Trả về ràng buộc đã được cung cấp trong hàm khởi tạo, có nghĩa là ràng buộc không được thỏa mãn.

## Phương thức phiên bản

_Cũng kế thừa các phương thức từ giao diện cha, {{domxref('DOMException')}}._

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
