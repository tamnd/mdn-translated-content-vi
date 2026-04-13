---
title: "UIEvent: UIEvent() constructor"
short-title: UIEvent()
slug: Web/API/UIEvent/UIEvent
page-type: web-api-constructor
browser-compat: api.UIEvent.UIEvent
---

{{APIRef("UI Events")}}

Hàm khởi tạo **`UIEvent()`** tạo một đối tượng {{domxref("UIEvent")}} mới.

> [!NOTE]
> Nếu bạn tạo sự kiện tổng hợp bằng hàm khởi tạo này, sự kiện đó sẽ không được _tin cậy_, vì lý do bảo mật.
> Chỉ các đối tượng `UIEvent` do trình duyệt tạo ra mới được tin cậy và chỉ các sự kiện được tin cậy mới kích hoạt các hành động mặc định.

## Cú pháp

```js-nolint
new UIEvent(type)
new UIEvent(type, options)
```

### Tham số

- `type`
  - : Chuỗi với tên của sự kiện.
    Phân biệt chữ hoa chữ thường và các trình duyệt đặt nó là `load`, `unload`, `abort`, `error` hoặc `select`.
- `options` {{optional_inline}}
  - : Đối tượng mà _ngoài các thuộc tính được định nghĩa trong {{domxref("Event/Event", "Event()")}}_, có thể có các thuộc tính sau:
    - `detail` {{optional_inline}}
      - : Số là giá trị phụ thuộc vào sự kiện liên kết với sự kiện.
        Mặc định là `0` và {{domxref("UIEvent.detail")}} liệt kê ngữ nghĩa cho các sự kiện tiêu chuẩn.
    - `view` {{optional_inline}}
      - : {{domxref("Window")}} liên kết với sự kiện. Giá trị mặc định là `null`.
    - `sourceCapabilities` {{optional_inline}} {{non-standard_inline}}
      - : Đối tượng {{domxref("InputDeviceCapabilities")}} cung cấp thông tin về thiết bị vật lý chịu trách nhiệm tạo ra sự kiện cảm ứng.

### Giá trị kết quả

Đối tượng {{domxref("UIEvent")}} mới.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("UIEvent")}}, giao diện của các đối tượng mà nó tạo ra.
