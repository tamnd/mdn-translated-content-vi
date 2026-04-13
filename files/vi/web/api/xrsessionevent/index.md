---
title: XRSessionEvent
slug: Web/API/XRSessionEvent
page-type: web-api-interface
browser-compat: api.XRSessionEvent
---

{{APIRef("WebXR Device API")}}{{SecureContext_Header}}

Giao diện **`XRSessionEvent`** của [WebXR Device API](/en-US/docs/Web/API/WebXR_Device_API) mô tả một sự kiện cho biết sự thay đổi trạng thái của {{domxref("XRSession")}}. Các sự kiện này xảy ra, ví dụ, khi phiên kết thúc hoặc trạng thái hiển thị của ngữ cảnh thay đổi.

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("XRSessionEvent.XRSessionEvent", "XRSessionEvent()")}}
  - : Tạo và trả về một đối tượng `XRSessionEvent` mới.

## Thuộc tính phiên bản

_Ngoài các thuộc tính được kế thừa từ giao diện cha {{domxref("Event")}}, `XRSessionEvent` cung cấp thêm:_

- {{domxref("XRSessionEvent.session", "session")}} {{ReadOnlyInline}}
  - : {{domxref("XRSession")}} mà sự kiện tham chiếu đến.

## Phương thức phiên bản

_Mặc dù `XRSessionEvent` không định nghĩa phương thức nào, nó kế thừa các phương thức từ giao diện cha {{domxref("Event")}}._

## Các loại sự kiện phiên

_Các sự kiện sau đây được đại diện bằng giao diện `XRSessionEvent` và là các giá trị hợp lệ cho thuộc tính `type` của nó._

- {{domxref("XRSession.end_event", "end")}}
  - : Được kích hoạt trên phiên khi nó đã kết thúc, sau khi được chấm dứt bởi ứng dụng hoặc {{Glossary("user agent")}}.
- {{domxref("XRSession.visibilitychange_event", "visibilitychange")}}
  - : Được kích hoạt trên phiên bất cứ khi nào trạng thái hiển thị của nó thay đổi.

## Ví dụ

Ví dụ này tạo một listener theo dõi sự thay đổi trạng thái hiển thị của phiên. Nó phản ứng bằng cách gọi hàm `mySessionVisible()` với giá trị Boolean cho biết phiên có hiển thị hay không; hàm này, chẳng hạn, có thể khởi động hoặc cấu hình lại một worker xử lý việc kết xuất cảnh.

```js
xrSession.addEventListener("visibilitychange", (e) => {
  switch (e.session.visibilityState) {
    case "visible":
    case "visible-blurred":
      mySessionVisible(true);
      break;
    case "hidden":
      mySessionVisible(false);
      break;
  }
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
