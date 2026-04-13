---
title: "HTMLFormElement: phương thức requestSubmit()"
short-title: requestSubmit()
slug: Web/API/HTMLFormElement/requestSubmit
page-type: web-api-instance-method
browser-compat: api.HTMLFormElement.requestSubmit
---

{{APIRef("HTML DOM")}}

Phương thức **`requestSubmit()`** của {{domxref("HTMLFormElement")}} yêu cầu biểu mẫu được gửi bằng một nút gửi cụ thể.

## Cú pháp

```js-nolint
requestSubmit()
requestSubmit(submitter)
```

### Tham số

- `submitter` {{optional_inline}}
  - : Một {{Glossary("submit button")}} là thành viên của biểu mẫu.

    Nếu `submitter` chỉ định các thuộc tính `form*`, chúng [sẽ ghi đè](/en-US/docs/Glossary/Submit_button#overriding_the_forms_behavior) hành vi gửi của biểu mẫu (ví dụ: `formmethod="POST"`).

    Nếu `submitter` có thuộc tính `name` hoặc là một `{{HtmlElement('input/image', '&lt;input type="image"&gt;')}}`, dữ liệu của nó [sẽ được bao gồm](/en-US/docs/Glossary/Submit_button#form_data_entries) trong việc gửi biểu mẫu (ví dụ: `btnName=btnValue`).

    Nếu bạn bỏ qua tham số `submitter`, chính phần tử biểu mẫu sẽ được sử dụng làm nút gửi.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném nếu `submitter` được chỉ định không phải là {{Glossary("submit button")}}.
- `NotFoundError` {{domxref("DOMException")}}
  - : Được ném nếu `submitter` được chỉ định không phải là thành viên của biểu mẫu mà `requestSubmit()` được gọi. Nút gửi phải là hậu duệ của phần tử biểu mẫu hoặc phải có thuộc tính [`form`](/en-US/docs/Web/HTML/Reference/Elements/input#form) trỏ đến biểu mẫu.

## Ghi chú sử dụng

Câu hỏi rõ ràng là: Tại sao phương thức này tồn tại, trong khi chúng ta đã có phương thức {{domxref("HTMLFormElement.submit", "submit()")}} từ thuở sơ khai?

Câu trả lời rất đơn giản. `submit()` gửi biểu mẫu, nhưng đó là tất cả những gì nó làm. `requestSubmit()`, mặt khác, hoạt động như thể một nút gửi đã được nhấp. Nội dung của biểu mẫu được xác thực và biểu mẫu chỉ được gửi nếu xác thực thành công. Sau khi biểu mẫu đã được gửi, sự kiện {{domxref("HTMLFormElement.submit_event", "submit")}} được gửi ngược lại đối tượng biểu mẫu.

## Ví dụ

Trong ví dụ dưới đây, biểu mẫu được gửi bằng cách cố gắng gửi yêu cầu bằng `requestSubmit()` nếu nó khả dụng. Nếu tìm thấy nút gửi có ID `main-submit`, nút đó sẽ được sử dụng để gửi biểu mẫu. Nếu không, biểu mẫu được gửi mà không có tham số `submitter`, do đó nó được gửi trực tiếp bởi chính biểu mẫu.

Mặt khác, nếu `requestSubmit()` không khả dụng, mã này sẽ chuyển sang gọi phương thức {{domxref("HTMLFormElement.submit", "submit()")}} của biểu mẫu.

```js
let myForm = document.querySelector("form");
let submitButton = myForm.querySelector("#main-submit");

if (myForm.requestSubmit) {
  if (submitButton) {
    myForm.requestSubmit(submitButton);
  } else {
    myForm.requestSubmit();
  }
} else {
  myForm.submit();
}
```

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
