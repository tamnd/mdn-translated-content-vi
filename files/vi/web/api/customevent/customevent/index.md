---
title: "CustomEvent: constructor CustomEvent()"
short-title: CustomEvent()
slug: Web/API/CustomEvent/CustomEvent
page-type: web-api-constructor
browser-compat: api.CustomEvent.CustomEvent
---

{{APIRef("DOM")}}{{AvailableInWorkers}}

Constructor **`CustomEvent()`** tạo một đối tượng {{domxref("CustomEvent")}} mới.

## Cú pháp

```js-nolint
new CustomEvent(type)
new CustomEvent(type, options)
```

### Tham số

- `type`
  - : Một chuỗi cung cấp tên của sự kiện. Tên sự kiện có phân biệt chữ hoa chữ thường.
- `options` {{optional_inline}}
  - : Một đối tượng mà, _ngoài các thuộc tính được định nghĩa trong {{domxref("Event/Event", "Event()")}}_, có thể có các thuộc tính sau:
    - `detail` {{optional_inline}}
      - : Một giá trị phụ thuộc vào sự kiện được liên kết với sự kiện. Giá trị này sau đó khả dụng cho trình xử lý bằng cách sử dụng thuộc tính {{domxref("CustomEvent.detail")}}.
        Giá trị mặc định là `null`.

### Giá trị trả về

Một đối tượng {{domxref("CustomEvent")}} mới.

## Ví dụ

```js
// tạo các sự kiện tùy chỉnh
const catFound = new CustomEvent("animalfound", {
  detail: {
    name: "cat",
  },
});
const dogFound = new CustomEvent("animalfound", {
  detail: {
    name: "dog",
  },
});

const element = document.createElement("div"); // tạo một phần tử <div>

// thêm trình lắng nghe sự kiện phù hợp
element.addEventListener("animalfound", (e) => console.log(e.detail.name));

// dispatch các sự kiện
element.dispatchEvent(catFound);
element.dispatchEvent(dogFound);

// "cat" và "dog" được ghi ra console
```

Các ví dụ bổ sung có thể được tìm thấy tại [Tạo và dispatch sự kiện](/en-US/docs/Web/API/Document_Object_Model/Events#creating_and_dispatching_events).

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("CustomEvent")}}
- [Tạo và dispatch sự kiện](/en-US/docs/Web/API/Document_Object_Model/Events#creating_and_dispatching_events)
