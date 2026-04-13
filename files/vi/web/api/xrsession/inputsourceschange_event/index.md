---
title: "XRSession: sự kiện inputsourceschange"
short-title: inputsourceschange
slug: Web/API/XRSession/inputsourceschange_event
page-type: web-api-event
status:
  - experimental
browser-compat: api.XRSession.inputsourceschange_event
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Sự kiện **`inputsourceschange`** được gửi đến một {{domxref("XRSession")}} khi tập hợp các thiết bị đầu vào WebXR khả dụng thay đổi.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc thiết lập một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("inputsourceschange", (event) => { })

oninputsourceschange = (event) => { }
```

## Loại sự kiện

Một {{domxref("XRInputSourcesChangeEvent")}}. Kế thừa từ {{domxref("Event")}}.

{{InheritanceDiagram("XRInputSourcesChangeEvent")}}

## Thuộc tính sự kiện

_Ngoài các thuộc tính được liệt kê bên dưới, các thuộc tính từ giao diện cha, {{domxref("Event")}}, cũng có sẵn._

- {{domxref("XRInputSourcesChangeEvent.added", "added")}} {{ReadOnlyInline}}
  - : Một mảng gồm không hoặc nhiều đối tượng {{domxref("XRInputSource")}}, mỗi đối tượng biểu diễn một thiết bị đầu vào mới được kết nối hoặc kích hoạt.
- {{domxref("XRInputSourcesChangeEvent.removed", "removed")}} {{ReadOnlyInline}}
  - : Một mảng gồm không hoặc nhiều đối tượng {{domxref("XRInputSource")}} biểu diễn các thiết bị đầu vào mới bị ngắt kết nối hoặc vô hiệu hóa.
- {{domxref("XRInputSourcesChangeEvent.session", "session")}} {{ReadOnlyInline}}
  - : {{domxref("XRSession")}} mà sự kiện thay đổi nguồn đầu vào này đang được gửi đến.

## Mô tả

### Kích hoạt

Được kích hoạt khi tập hợp các thiết bị đầu vào WebXR khả dụng thay đổi.

### Trường hợp sử dụng

Bạn có thể sử dụng sự kiện này để phát hiện các thiết bị mới khả dụng hoặc khi các thiết bị trở nên không khả dụng.

## Ví dụ

Ví dụ sau đây cho thấy cách thiết lập một trình xử lý sự kiện sử dụng các sự kiện `inputsourceschange` để phát hiện các thiết bị trỏ mới khả dụng và tải mô hình của chúng để chuẩn bị hiển thị chúng trong khung hình hoạt ảnh tiếp theo.

```js
xrSession.addEventListener("inputsourceschange", onInputSourcesChange);

function onInputSourcesChange(event) {
  for (const input of event.added) {
    if (input.targetRayMode === "tracked-pointer") {
      loadControllerMesh(input);
    }
  }
}
```

Bạn cũng có thể thêm một trình xử lý cho các sự kiện `inputsourceschange` bằng cách thiết lập trình xử lý sự kiện `oninputsourceschange`:

```js
xrSession.oninputsourceschange = onInputSourcesChange;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
