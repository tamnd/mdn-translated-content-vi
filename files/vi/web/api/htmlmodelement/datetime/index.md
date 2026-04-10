---
title: "HTMLModElement: thuộc tính dateTime"
short-title: dateTime
slug: Web/API/HTMLModElement/dateTime
page-type: web-api-instance-property
browser-compat: api.HTMLModElement.dateTime
---

{{ APIRef("HTML DOM") }}

Thuộc tính **`dateTime`** của giao diện {{domxref("HTMLModElement")}} là một chuỗi chứa ngày ở định dạng máy đọc được với giá trị thời gian tùy chọn. Nó phản ánh thuộc tính HTML [`datetime`](/en-US/docs/Web/HTML/Reference/Elements/time#datetime) của các phần tử {{HTMLElement("del")}} và {{HTMLElement("ins")}}.

## Giá trị

Một chuỗi. Các định dạng chuỗi hợp lệ, xem phần [giá trị hợp lệ của `datetime`](/en-US/docs/Web/HTML/Reference/Elements/time#valid_datetime_values).

## Ví dụ

Cho đoạn HTML sau:

```html
<p>The paragraph <del datetime="2021-11-01">has been</del> changed</p>
```

Chúng ta có thể lấy giá trị của thuộc tính `dateTime` của phần tử `<del>`:

```js
const deletedText = document.querySelector("del");
console.log(deletedText.dateTime); // "2021-11-01"
```

Chúng ta cũng có thể thiết lập thuộc tính `dateTime`. Dưới đây, chúng ta tạo một phần tử `<ins>`, sau đó đặt thuộc tính `dateTime` của phần tử `<ins>` thành ngày hiện tại theo định dạng `YYYY-MM-DD` rồi chèn nó sau văn bản đã xóa:

```js
const insertedText = document.createElement("ins");
const now = new Date();
insertedText.dateTime = `${now.getFullYear()}-${now.getMonth() + 1}-${now.getDate()}`;
insertedText.appendChild(document.createTextNode("was"));
deletedText.insertAdjacentElement("afterend", insertedText);
```

Nếu script của chúng ta chạy vào ngày 9 tháng 1 năm 2025, HTML sẽ như sau:

```html
<p>
  The paragraph <del datetime="2021-11-01">has been</del
  ><ins datetime="2025-1-9">was</ins> changed
</p>
```

## Mô tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTMLElement("del")}}
- {{HTMLElement("ins")}}
- {{domxref("HTMLModElement")}}
- {{domxref("HTMLModElement.cite")}}
- {{domxref("HTMLTimeElement.dateTime")}}
- [Chuỗi ngày](/en-US/docs/Web/HTML/Guides/Date_and_time_formats#date_strings)
- [Chuỗi ngày và giờ cục bộ](/en-US/docs/Web/HTML/Guides/Date_and_time_formats#local_date_and_time_strings)
- {{jsxref("Date")}}
- {{domxref("Element.insertAdjacentElement()")}}
