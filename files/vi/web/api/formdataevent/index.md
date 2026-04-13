---
title: FormDataEvent
slug: Web/API/FormDataEvent
page-type: web-api-interface
browser-compat: api.FormDataEvent
---

{{APIRef("DOM")}}

Giao diện **`FormDataEvent`** đại diện cho [sự kiện `formdata`](/en-US/docs/Web/API/HTMLFormElement/formdata_event), được kích hoạt trên đối tượng {{domxref("HTMLFormElement")}} sau khi danh sách mục đại diện cho dữ liệu biểu mẫu được xây dựng. Điều này xảy ra khi biểu mẫu được gửi, nhưng cũng có thể được kích hoạt bởi lệnh gọi hàm khởi tạo {{domxref("FormData.FormData", "FormData()")}}.

Điều này cho phép đối tượng {{domxref("FormData")}} được lấy nhanh chóng để phản hồi với sự kiện `formdata`, thay vì cần phải tự tổng hợp khi muốn gửi dữ liệu biểu mẫu qua phương thức như {{domxref("Window/fetch", "fetch()")}} (xem [Sử dụng đối tượng FormData](/en-US/docs/Web/API/XMLHttpRequest_API/Using_FormData_Objects)).

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("FormDataEvent.FormDataEvent","FormDataEvent()")}}
  - : Tạo phiên bản đối tượng `FormDataEvent` mới.

## Thuộc tính phiên bản

_Kế thừa các thuộc tính từ giao diện cha, {{domxref("Event")}}._

- {{domxref("FormDataEvent.formData")}}
  - : Chứa đối tượng {{domxref("FormData")}} đại diện cho dữ liệu được chứa trong biểu mẫu khi sự kiện được kích hoạt.

## Phương thức phiên bản

_Kế thừa các phương thức từ giao diện cha, {{domxref("Event")}}._

## Ví dụ

```js
// grab reference to form

const formElem = document.querySelector("form");

// submit handler

formElem.addEventListener("submit", (e) => {
  // on form submission, prevent default
  e.preventDefault();

  console.log(form.querySelector('input[name="field1"]')); // FOO
  console.log(form.querySelector('input[name="field2"]')); // BAR

  // construct a FormData object, which fires the formdata event
  const formData = new FormData(formElem);
  // formdata gets modified by the formdata event
  console.log(formData.get("field1")); // foo
  console.log(formData.get("field2")); // bar
});

// formdata handler to retrieve data

formElem.addEventListener("formdata", (e) => {
  console.log("formdata fired");

  // modifies the form data
  const formData = e.formData;
  formData.set("field1", formData.get("field1").toLowerCase());
  formData.set("field2", formData.get("field2").toLowerCase());
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Window/fetch", "fetch()")}}
- {{domxref("FormData")}}
- [Sử dụng đối tượng FormData](/en-US/docs/Web/API/XMLHttpRequest_API/Using_FormData_Objects)
- {{HTMLElement("Form")}}
