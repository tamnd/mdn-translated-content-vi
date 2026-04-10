---
title: "CompositionEvent: phương thức initCompositionEvent()"
short-title: initCompositionEvent()
slug: Web/API/CompositionEvent/initCompositionEvent
page-type: web-api-instance-method
status:
  - deprecated
browser-compat: api.CompositionEvent.initCompositionEvent
---

{{deprecated_header}}{{APIRef("UI Events")}}

Phương thức **`initCompositionEvent()`** của giao diện {{domxref("CompositionEvent")}} khởi tạo các thuộc tính của một instance đối tượng `CompositionEvent`.

> [!NOTE]
> Cách đúng để tạo một {{domxref("CompositionEvent")}} là sử dụng hàm tạo {{domxref("CompositionEvent.CompositionEvent", "CompositionEvent()")}}.

## Cú pháp

```js-nolint
initCompositionEvent(type, canBubble, cancelable, view, data, locale)
```

### Tham số

- `type`
  - : Một chuỗi biểu diễn loại sự kiện soạn thảo; đây sẽ là một trong các giá trị `compositionstart`, `compositionupdate`, hoặc `compositionend`.
- `canBubble`
  - : Một giá trị boolean chỉ định sự kiện có thể nổi bong bóng hay không.
- `cancelable`
  - : Một giá trị boolean cho biết sự kiện có thể bị hủy hay không.
- `view`
  - : Đối tượng {{domxref("Window")}} mà từ đó sự kiện được tạo.
- `data`
  - : Một chuỗi biểu diễn giá trị của thuộc tính `data`.
- `locale`
  - : Một chuỗi biểu diễn giá trị của thuộc tính `locale`.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("CompositionEvent")}}
