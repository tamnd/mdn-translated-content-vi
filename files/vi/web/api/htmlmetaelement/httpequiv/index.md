---
title: "HTMLMetaElement: thuộc tính httpEquiv"
short-title: httpEquiv
slug: Web/API/HTMLMetaElement/httpEquiv
page-type: web-api-instance-property
browser-compat: api.HTMLMetaElement.httpEquiv
---

{{APIRef("HTML DOM")}}

Thuộc tính **`HTMLMetaElement.httpEquiv`** lấy hoặc đặt pragma directive hoặc tên tiêu đề phản hồi HTTP cho thuộc tính {{domxref("HTMLMetaElement.content")}}.
Để biết thêm chi tiết về các giá trị có thể, xem thuộc tính [http-equiv](/en-US/docs/Web/HTML/Reference/Elements/meta/http-equiv).

## Giá trị

Một chuỗi.

## Ví dụ

### Đọc giá trị `http-equiv` của một phần tử meta

Ví dụ sau truy vấn một phần tử `<meta>` có thuộc tính `http-equiv`.
Thuộc tính `http-equiv` được ghi vào bảng điều khiển cho thấy một [pragma directive](/en-US/docs/Web/HTML/Reference/Elements/meta/http-equiv) `refresh` hướng dẫn trình duyệt làm mới trang sau một số giây được định nghĩa bởi thuộc tính `content`:

```js
// given <meta http-equiv="refresh" content="10" />
const meta = document.querySelector("meta[http-equiv]");
console.log(meta.httpEquiv);
// refresh
console.log(meta.content);
// 10
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTMLElement("meta")}}
