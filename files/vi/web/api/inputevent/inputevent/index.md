---
title: "InputEvent: hàm tạo InputEvent()"
short-title: InputEvent()
slug: Web/API/InputEvent/InputEvent
page-type: web-api-constructor
browser-compat: api.InputEvent.InputEvent
---

{{APIRef("UI Events")}}

Hàm tạo **`InputEvent()`** tạo một đối tượng {{domxref("InputEvent")}} mới.

## Cú pháp

```js-nolint
new InputEvent(type)
new InputEvent(type, options)
```

### Tham số

- `type`
  - : Một chuỗi với tên của sự kiện.
    Phân biệt chữ hoa chữ thường và trình duyệt đặt thành `beforeinput`, hoặc `input`.
- `options` {{optional_inline}}
  - : Một đối tượng mà, _ngoài các thuộc tính được định nghĩa trong {{domxref("UIEvent/UIEvent", "UIEvent()")}}_, có thể có các thuộc tính sau:
    - `inputType` {{optional_inline}}
      - : Một chuỗi chỉ định loại thay đổi đối với nội dung có thể chỉnh sửa
        như, ví dụ, chèn, xóa hoặc định dạng văn bản.
    - `data` {{optional_inline}}
      - : Một chuỗi chứa các ký tự cần chèn.
        Đây có thể là một chuỗi rỗng nếu thay đổi không chèn văn bản
        (chẳng hạn khi xóa ký tự, ví dụ).
    - `isComposing` {{optional_inline}}
      - : Một boolean cho biết sự kiện là một phần của phiên soạn thảo,
        nghĩa là nó nằm sau sự kiện {{domxref("Element/compositionstart_event", "compositionstart")}} nhưng trước sự kiện {{domxref("Element/compositionend_event", "compositionend")}}. Giá trị mặc định là `false`.

### Giá trị trả về

Một đối tượng {{domxref("InputEvent")}} mới.

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("InputEvent")}}, giao diện của các đối tượng mà nó tạo ra.
