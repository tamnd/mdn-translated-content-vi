---
title: "SubmitEvent: hàm khởi tạo SubmitEvent()"
short-title: SubmitEvent()
slug: Web/API/SubmitEvent/SubmitEvent
page-type: web-api-constructor
browser-compat: api.SubmitEvent.SubmitEvent
---

{{APIRef("HTML DOM")}}

Hàm khởi tạo **`SubmitEvent()`** tạo và trả về đối tượng {{domxref("SubmitEvent")}} mới,
được dùng để đại diện cho sự kiện {{domxref("HTMLFormElement.submit_event", "submit")}}
được kích hoạt tại [biểu mẫu](/en-US/docs/Learn_web_development/Extensions/Forms) {{Glossary("HTML")}}.

## Cú pháp

```js-nolint
new SubmitEvent(type)
new SubmitEvent(type, options)
```

### Tham số

- `type`
  - : Một chuỗi với tên của sự kiện.
    Phân biệt chữ hoa chữ thường và trình duyệt luôn đặt là `submit`.
- `options` {{optional_inline}}
  - : Một đối tượng, _ngoài các thuộc tính được định nghĩa trong {{domxref("Event/Event", "Event()")}}_, có thể có các thuộc tính sau:
    - `submitter` {{optional_inline}}
      - : Một đối tượng {{domxref('HTMLElement')}} là nút submit đã kích hoạt việc submit biểu mẫu.

### Giá trị trả về

Một đối tượng {{domxref("SubmitEvent")}} được cấu hình bằng các đầu vào đã cho.

## Ví dụ

Đoạn code này tìm biểu mẫu trong tài liệu hiện tại, và sau đó một {{HTMLElement("button")}} HTML bên trong biểu mẫu với class `submit` trên đó.
Tiếp theo, một {{domxref("SubmitEvent")}} mới được tạo, được cấu hình với
{{domxref("SubmitEvent.submitter", "submitter")}} được đặt thành nút đã xác định
(hoặc `null` nếu nút không được tìm thấy). Sau đó sự kiện được gửi đến biểu mẫu,
thông báo cho biểu mẫu rằng nó đã được submit bởi nút.

```js
const form = document.querySelector("form");
const formTrigger = form.querySelector("button.submit");
const submitEvent = new SubmitEvent("submit", { submitter: formTrigger });

form.dispatchEvent(submitEvent);
```

Đây là một ví dụ hơi giả tạo, vì bạn có thể làm gần như tất cả những điều này dễ dàng hơn nhiều, nhưng điều này cho bạn kiểm soát sâu sắc quá trình có thể hữu ích.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
