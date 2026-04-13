---
title: "HTMLAnchorElement: thuộc tính port"
short-title: port
slug: Web/API/HTMLAnchorElement/port
page-type: web-api-instance-property
browser-compat: api.HTMLAnchorElement.port
---

{{ApiRef("HTML DOM")}}

Thuộc tính **`port`** của giao diện {{domxref("HTMLAnchorElement")}} là một chuỗi chứa số cổng của `href` thuộc phần tử `<a>`. Nếu cổng là mặc định cho giao thức (`80` cho `ws:` và `http:`, `443` cho `wss:` và `https:`, và `21` cho `ftp:`), thuộc tính này chứa một chuỗi rỗng, `""`.

Thuộc tính này có thể được đặt để thay đổi cổng của URL. Nếu URL không có {{domxref("HTMLAnchorElement.host", "tên máy chủ")}} hoặc giao thức của nó là `file:`, thì việc đặt thuộc tính này không có tác dụng. Nó cũng im lặng bỏ qua các số cổng không hợp lệ.

Xem {{domxref("URL.port")}} để biết thêm thông tin.

## Giá trị

Một chuỗi.

## Ví dụ

### Lấy cổng từ một liên kết neo

```js
// Một phần tử <a id="myAnchor" href="https://developer.mozilla.org:443/en-US/docs/HTMLAnchorElement"> có trong tài liệu
const anchor = document.getElementByID("myAnchor");
anchor.port; // trả về ''
```

```js
// Một phần tử <a id="myAnchor" href="https://developer.mozilla.org:8888/en-US/docs/HTMLAnchorElement"> khác có trong tài liệu
const anchor = document.getElementByID("myAnchor");
anchor.port; // Trả về: '8888'
```

## Đặc tả kỹ thuật

{{Specifications}}

## Trình duyệt hỗ trợ

{{Compat}}

## Xem thêm

- Giao diện {{domxref("HTMLAnchorElement")}} mà nó thuộc về.
