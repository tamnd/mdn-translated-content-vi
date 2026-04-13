---
title: URLPattern
slug: Web/API/URLPattern
page-type: web-api-interface
browser-compat: api.URLPattern
---

{{APIRef("URL Pattern API")}} {{AvailableInWorkers}}

Giao diện **`URLPattern`** của {{domxref("URL Pattern API", "", "", "nocode")}} khớp các URL hoặc một phần của URL với một mẫu. Mẫu có thể chứa các nhóm bắt giữ để trích xuất các phần của URL đã khớp.

Thông tin chi tiết hơn về cú pháp của các mẫu có thể xem trên trang tổng quan của API:
{{domxref("URL Pattern API", "", "", "nocode")}}.

## Hàm tạo

- {{domxref("URLPattern.URLPattern", "URLPattern()")}}
  - : Trả về một đối tượng `URLPattern` mới dựa trên mẫu và URL cơ sở đã cho.

## Thuộc tính thực thể

- {{domxref("URLPattern.hash", "hash")}} {{ReadOnlyInline}}
  - : Chuỗi chứa mẫu dùng để khớp phần _hash_ của một URL.
- {{domxref("URLPattern.hasRegExpGroups", "hasRegExpGroups")}} {{ReadOnlyInline}}
  - : Giá trị boolean cho biết một hay nhiều thành phần của `URLPattern` có chứa [nhóm bắt giữ của biểu thức chính quy](/en-US/docs/Web/JavaScript/Guide/Regular_expressions/Groups_and_backreferences) hay không.
- {{domxref("URLPattern.hostname", "hostname")}} {{ReadOnlyInline}}
  - : Chuỗi chứa mẫu dùng để khớp phần _hostname_ của một URL.
- {{domxref("URLPattern.password", "password")}} {{ReadOnlyInline}}
  - : Chuỗi chứa mẫu dùng để khớp phần _password_ của một URL.
- {{domxref("URLPattern.pathname", "pathname")}} {{ReadOnlyInline}}
  - : Chuỗi chứa mẫu dùng để khớp phần _pathname_ của một URL.
- {{domxref("URLPattern.port", "port")}} {{ReadOnlyInline}}
  - : Chuỗi chứa mẫu dùng để khớp phần _port_ của một URL.
- {{domxref("URLPattern.protocol", "protocol")}} {{ReadOnlyInline}}
  - : Chuỗi chứa mẫu dùng để khớp phần _protocol_ của một URL.
- {{domxref("URLPattern.search", "search")}} {{ReadOnlyInline}}
  - : Chuỗi chứa mẫu dùng để khớp phần _search_ của một URL.
- {{domxref("URLPattern.username","username")}} {{ReadOnlyInline}}
  - : Chuỗi chứa mẫu dùng để khớp phần _username_ của một URL.

## Phương thức thực thể

- {{domxref("URLPattern.exec", "exec()")}}
  - : Trả về một đối tượng chứa các phần đã khớp của URL hoặc `null` nếu URL không khớp với mẫu.
- {{domxref("URLPattern.test", "test()")}}
  - : Trả về `true` nếu URL khớp với mẫu đã cho, ngược lại trả về `false`.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Có một polyfill cho `URLPattern` trên
  [GitHub](https://github.com/kenchris/urlpattern-polyfill)
- Cú pháp mẫu được `URLPattern` sử dụng tương tự cú pháp của
  [path-to-regexp](https://github.com/pillarjs/path-to-regexp)
