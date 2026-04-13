---
title: "FormDataEvent: FormDataEvent() constructor"
short-title: FormDataEvent()
slug: Web/API/FormDataEvent/FormDataEvent
page-type: web-api-constructor
browser-compat: api.FormDataEvent.FormDataEvent
---

{{APIRef("DOM")}}

Hàm khởi tạo **`FormDataEvent()`** tạo đối tượng {{domxref("FormDataEvent")}} mới.

## Cú pháp

```js-nolint
new FormDataEvent(type, formEventInit)
```

### Tham số

- `type`
  - : Một chuỗi chứa tên của sự kiện.
    Nó phân biệt chữ hoa chữ thường và các trình duyệt luôn đặt nó thành `formdata`.
- `options`
  - : Một đối tượng mà, _ngoài các thuộc tính được xác định trong {{domxref("Event/Event", "Event()")}}_, có thể có các thuộc tính sau:
    - `formData`
      - : Đối tượng {{domxref("FormData")}} để điền trước vào {{domxref("FormDataEvent")}}.
        Sau đó có thể truy cập qua thuộc tính {{domxref("FormDataEvent.formData")}}.

### Giá trị trả về

Đối tượng {{domxref("FormDataEvent")}} mới.

## Ví dụ

```js
const fd = new FormData();
fd.append("test", "test");

const fdEv = new FormDataEvent("formdata", { formData: fd });

for (const value of fdEv.formData.values()) {
  console.log(value);
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("FormDataEvent")}}
