---
title: "KeyboardEvent: phương thức initKeyboardEvent()"
short-title: initKeyboardEvent()
slug: Web/API/KeyboardEvent/initKeyboardEvent
page-type: web-api-instance-method
status:
  - deprecated
browser-compat: api.KeyboardEvent.initKeyboardEvent
---

{{APIRef("UI Events")}}{{Deprecated_Header}}

Phương thức **`KeyboardEvent.initKeyboardEvent()`** khởi tạo
các thuộc tính của một đối tượng sự kiện bàn phím. Phương thức này đã được giới thiệu trong bản nháp của DOM
Level 3 Events, nhưng bị loại bỏ trong bản nháp mới hơn. Gecko sẽ không hỗ trợ tính năng này kể từ
việc triển khai phương thức này dưới dạng thử nghiệm đã phá vỡ các ứng dụng web hiện có (xem [lỗi Firefox 999645](https://bugzil.la/999645)).
Các ứng dụng web nên sử dụng constructor thay thế nếu có sẵn.

## Cú pháp

```js-nolint
initKeyboardEvent(type, canBubble, cancelable,
                  view, key, location, ctrlKey,
                  altKey, shiftKey, metaKey)
```

### Tham số

- `type`
  - : Loại sự kiện bàn phím; trình duyệt luôn đặt nó thành một trong các giá trị `keydown`,
    `keypress`, hoặc `keyup`.
- `canBubble` {{optional_inline}}
  - : Cho biết sự kiện có thể nổi bọt hay không. Mặc định là `false`.
- `cancelable` {{optional_inline}}
  - : Cho biết sự kiện có thể bị hủy hay không. Mặc định là `false`.
- `view` {{optional_inline}}
  - : {{glossary("WindowProxy")}} mà nó được liên kết. Mặc định là `null`.
- `key` {{optional_inline}}
  - : Giá trị của thuộc tính key. Mặc định là `""`.
- `location` {{optional_inline}}
  - : Giá trị của thuộc tính location. Mặc định là `0`.
- `ctrlKey` {{optional_inline}}
  - : Cho biết bổ trợ control có đang hoạt động hay không. Mặc định là `false`.
- `altKey` {{optional_inline}}
  - : Cho biết bổ trợ alt có đang hoạt động hay không. Mặc định là `false`.
- `shiftKey` {{optional_inline}}
  - : Cho biết bổ trợ shift có đang hoạt động hay không. Mặc định là `false`.
- `metaKey` {{optional_inline}}
  - : Cho biết bổ trợ meta có đang hoạt động hay không. Mặc định là `false`.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Đặc điểm kỹ thuật

{{Specifications}}

Đặc tả giao diện `KeyboardEvent` đã trải qua nhiều phiên bản nháp, đầu tiên là DOM Events Level 2 nơi nó bị loại bỏ do không có sự đồng thuận, sau đó là DOM Events Level 3. Điều này dẫn đến việc triển khai các phương thức khởi tạo không chuẩn, phiên bản DOM Events Level 2 ban đầu, `KeyboardEvent.initKeyEvent()` bởi các trình duyệt Gecko và phiên bản DOM Events Level 3 ban đầu, `KeyboardEvent.initKeyboardEvent()` bởi các trình duyệt khác. Cả hai đã được thay thế bằng cách sử dụng constructor hiện đại: {{domxref("KeyboardEvent.KeyboardEvent", "KeyboardEvent()")}}.

## Tương thích trình duyệt

{{Compat}}
