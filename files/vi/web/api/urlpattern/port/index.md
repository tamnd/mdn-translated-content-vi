---
title: "URLPattern: port property"
short-title: port
slug: Web/API/URLPattern/port
page-type: web-api-instance-property
browser-compat: api.URLPattern.port
---

{{APIRef("URL Pattern API")}} {{AvailableInWorkers}}

Thuộc tính chỉ đọc **`port`** của giao diện {{domxref("URLPattern")}} là một chuỗi chứa [mẫu](/en-US/docs/Web/API/URL_Pattern_API#pattern_syntax) được dùng để khớp phần port của một URL.

Đây là [giá trị đã chuẩn hóa](/en-US/docs/Web/API/URL_Pattern_API#pattern_normalization) của mẫu port được truyền cho [hàm tạo](/en-US/docs/Web/API/URLPattern/URLPattern), hoặc một [giá trị được kế thừa từ `baseURL`](/en-US/docs/Web/API/URLPattern/URLPattern#inheritance_from_a_baseurl) được truyền cho hàm tạo, hoặc giá trị mặc định (`"*"`), khớp với mọi port.

Lưu ý rằng nó cũng có thể được đặt ngầm thành chuỗi rỗng (`""`) nếu mẫu được chỉ định bằng một chuỗi [`url` hoặc `baseURL` và port không được đặt rõ ràng](/en-US/docs/Web/API/URLPattern/URLPattern#hostname_in_url_or_baseurl_affects_default_port).
Chuỗi rỗng này khớp với các URL dùng port mặc định (`443`).

## Giá trị

Một chuỗi.

## Ví dụ

### Cách dùng cơ bản

Ví dụ sau tạo một đối tượng {{domxref("URLPattern")}} với `(80|443|8080)` cho phần `port` và ghi lại thuộc tính.
Mẫu này khớp với bất kỳ URL nào có port `80`, `443`, hoặc `8080`.

```js
const pattern = new URLPattern({ port: "(80|443|8080)" });
console.log(pattern.port); // "(80|443|8080)"
console.log(pattern.test("http://example.com:8080/")); // true
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
