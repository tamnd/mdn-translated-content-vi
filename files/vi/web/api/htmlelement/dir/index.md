---
title: "HTMLElement: thuộc tính dir"
short-title: dir
slug: Web/API/HTMLElement/dir
page-type: web-api-instance-property
browser-compat: api.HTMLElement.dir
---

{{ApiRef("HTML DOM")}}

Thuộc tính **`HTMLElement.dir`** cho biết hướng viết văn bản của nội dung phần tử hiện tại. Nó phản ánh thuộc tính [`dir`](/en-US/docs/Web/HTML/Reference/Global_attributes/dir) của phần tử.

Lưu ý rằng nếu thuộc tính `dir` không được chỉ định, bản thân phần tử vẫn có thể kế thừa hướng từ phần tử cha. Tuy nhiên, hướng kế thừa đó không được phản ánh bởi giá trị của thuộc tính này.

Hướng viết văn bản của một phần tử là hướng mà văn bản đi (để hỗ trợ các hệ thống ngôn ngữ khác nhau). Tiếng Ả Rập và tiếng Hebrew là các ngôn ngữ điển hình sử dụng hướng RTL (từ phải sang trái).

## Giá trị

Một trong các giá trị sau:

- `"ltr"`
  - : Hướng viết từ trái sang phải.
- `"rtl"`
  - : Hướng viết từ phải sang trái.
- `"auto"`
  - : Hướng của phần tử phải được xác định dựa trên nội dung của phần tử.
- `""`
  - : Giá trị mặc định; hướng được kế thừa từ phần tử cha.

## Ví dụ

```js
const para = document.getElementById("para1");
para.dir = "rtl";
// thay đổi hướng văn bản trên một đoạn văn bản có id là "para1"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("document.dir")}}
- Thuộc tính toàn cục HTML [`dir`](/en-US/docs/Web/HTML/Reference/Global_attributes/dir)
- Thuộc tính CSS {{cssxref("direction")}}
- Lớp giả CSS {{cssxref(":dir")}}
