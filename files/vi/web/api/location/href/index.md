---
title: "Location: thuộc tính href"
short-title: href
slug: Web/API/Location/href
page-type: web-api-instance-property
browser-compat: api.Location.href
---

{{ApiRef("Location")}}

Thuộc tính **`href`** của giao diện {{domxref("Location")}} là một {{Glossary("stringifier")}} trả về một chuỗi chứa toàn bộ URL, đồng thời cho phép cập nhật href.

Việc đặt giá trị `href` sẽ _điều hướng_ tới URL được cung cấp. Nếu bạn muốn _chuyển hướng_, hãy dùng {{domxref("Location/replace","location.replace()")}}. Điểm khác với việc đặt giá trị thuộc tính `href` là khi dùng phương thức `location.replace()`, sau khi điều hướng tới URL đã cho, trang hiện tại sẽ không được lưu trong phiên [lịch sử](/en-US/docs/Web/API/History_API) nghĩa là người dùng sẽ không thể dùng nút quay lại để điều hướng tới nó.

## Giá trị

Một chuỗi.

## Ví dụ

```js
// Giả sử có một phần tử <a id="myAnchor" href="https://developer.mozilla.org/en-US/Location/href"> trong tài liệu
const anchor = document.getElementById("myAnchor");
const result = anchor.href; // Trả về: 'https://developer.mozilla.org/en-US/Location/href'
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
