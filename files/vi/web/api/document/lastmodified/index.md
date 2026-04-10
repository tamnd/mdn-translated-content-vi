---
title: "Document: thuộc tính lastModified"
short-title: lastModified
slug: Web/API/Document/lastModified
page-type: web-api-instance-property
browser-compat: api.Document.lastModified
---

{{APIRef("DOM")}}

Thuộc tính **`lastModified`** của giao diện {{domxref("Document")}} trả về một chuỗi chứa ngày và giờ địa phương mà tài liệu hiện tại được sửa đổi lần cuối.

## Giá trị

Một chuỗi.

## Ví dụ

### Sử dụng đơn giản

Ví dụ này hiển thị giá trị của `lastModified`.

```js
alert(document.lastModified);
// trả về: Tuesday, December 16, 2017 11:09:42
```

### Chuyển đổi lastModified thành đối tượng Date

Ví dụ này chuyển đổi `lastModified` thành một đối tượng {{jsxref("Date")}}.

```js
let oLastModif = new Date(document.lastModified);
```

### Chuyển đổi lastModified thành mili giây

Ví dụ này chuyển đổi `lastModified` thành số mili giây kể từ ngày 1 tháng 1 năm 1970, 00:00:00, giờ địa phương.

```js
let nLastModif = Date.parse(document.lastModified);
```

## Ghi chú

Lưu ý rằng dưới dạng chuỗi, `lastModified` không thể _dễ dàng_ được sử dụng để so sánh ngày sửa đổi của các tài liệu. Đây là một ví dụ có thể để hiển thị thông báo cảnh báo khi trang thay đổi (xem thêm: [JavaScript cookies API](/en-US/docs/Web/API/Document/cookie)):

```js
// Khớp 'timestamp' trong 'last_modif=timestamp'
// ví dụ: '1687964614822' trong 'last_modif=1687964614822'
const pattern = /last_modif\s*=\s*([^;]*)/;

if (
  Date.parse(document.lastModified) >
  (parseFloat(document.cookie.match(pattern)?.[1]) || 0)
) {
  document.cookie = `last_modif=${Date.now()}; expires=Fri, 31 Dec 9999 23:59:59 GMT; path=${
    location.pathname
  }`;
  alert("Trang này đã thay đổi!");
}
```

…cùng ví dụ đó, nhưng bỏ qua lần truy cập đầu tiên:

```js
const pattern = /last_modif\s*=\s*([^;]*)/;

const lastVisit = parseFloat(document.cookie.replace(pattern, "$1"));
const lastModif = Date.parse(document.lastModified);

if (Number.isNaN(lastVisit) || lastModif > lastVisit) {
  document.cookie = `last_modif=${Date.now()}; expires=Fri, 31 Dec 9999 23:59:59 GMT; path=${
    location.pathname
  }`;

  if (isFinite(lastVisit)) {
    alert("Trang này đã được thay đổi!");
  }
}
```

Nếu bạn muốn biết liệu một trang _bên ngoài_ có thay đổi hay không, bạn có thể tạo một yêu cầu {{HTTPMethod("HEAD")}} bằng cách sử dụng API {{domxref("Window/fetch", "fetch()")}}, và kiểm tra tiêu đề phản hồi {{HTTPHeader("Last-Modified")}}.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
