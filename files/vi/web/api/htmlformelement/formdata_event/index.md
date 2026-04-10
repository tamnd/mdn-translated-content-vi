---
title: "HTMLFormElement: sự kiện formdata"
short-title: formdata
slug: Web/API/HTMLFormElement/formdata_event
page-type: web-api-event
browser-compat: api.HTMLFormElement.formdata_event
---

{{APIRef("HTML DOM")}}

Sự kiện **`formdata`** được kích hoạt sau khi danh sách entry đại diện cho dữ liệu của biểu mẫu được xây dựng. Điều này xảy ra khi biểu mẫu được gửi, nhưng cũng có thể được kích hoạt bởi việc gọi hàm khởi tạo {{domxref("FormData.FormData", "FormData()")}}.

Sự kiện này không thể hủy và không nổi bọt.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("formdata", (event) => { })

onformdata = (event) => { }
```

## Loại sự kiện

Một {{domxref("FormDataEvent")}}. Kế thừa từ {{domxref("Event")}}.

{{InheritanceDiagram("FormDataEvent")}}

## Thuộc tính sự kiện

_Kế thừa các thuộc tính từ giao diện cha của nó, {{domxref("Event")}}._

- {{domxref("FormDataEvent.formData")}}
  - : Chứa đối tượng {{domxref("FormData")}} đại diện cho dữ liệu contained trong biểu mẫu khi sự kiện được kích hoạt.

## Ví dụ

```js
// lấy tham chiếu đến biểu mẫu

const formElem = document.querySelector("form");

// trình xử lý gửi

formElem.addEventListener("submit", (e) => {
  // khi gửi biểu mẫu, ngăn chặn mặc định
  e.preventDefault();

  console.log(formElem.querySelector('input[name="field1"]')); // FOO
  console.log(formElem.querySelector('input[name="field2"]')); // BAR

  // xây dựng một đối tượng FormData, sẽ kích hoạt sự kiện formdata
  const formData = new FormData(formElem);
  // formdata được sửa đổi bởi sự kiện formdata
  console.log(formData.get("field1")); // foo
  console.log(formData.get("field2")); // bar
});

// trình xử lý formdata để lấy dữ liệu

formElem.addEventListener("formdata", (e) => {
  console.log("formdata đã được kích hoạt");

  // sửa đổi dữ liệu biểu mẫu
  const formData = e.formData;
  // formdata được sửa đổi bởi sự kiện formdata
  formData.set("field1", formData.get("field1").toLowerCase());
  formData.set("field2", formData.get("field2").toLowerCase());
});
```

Phiên bản `onformdata` sẽ trông như thế này:

```js
formElem.onformdata = (e) => {
  console.log("formdata đã được kích hoạt");

  // sửa đổi dữ liệu biểu mẫu
  const formData = e.formData;
  formData.set("field1", formData.get("field1").toLowerCase());
  formData.set("field2", formData.get("field2").toLowerCase());
};
```

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phần tử HTML {{htmlElement("form")}}
- {{domxref("FormDataEvent")}}
