---
title: Giá trị chất lượng
slug: Glossary/Quality_values
page-type: glossary-definition
sidebar: glossarysidebar
---

**Giá trị chất lượng** (Quality values), hay _q-values_ và _q-factors_, được dùng để mô tả thứ tự ưu tiên của các giá trị trong danh sách phân cách bằng dấu phẩy. Đây là cú pháp đặc biệt được cho phép trong một số [HTTP header](/en-US/docs/Web/HTTP/Reference/Headers) và trong HTML.

Mức độ quan trọng của một giá trị được đánh dấu bằng hậu tố `';q='` ngay sau đó là một giá trị từ `0` đến `1` (bao gồm cả hai đầu), với tối đa ba chữ số thập phân, giá trị cao nhất biểu thị ưu tiên cao nhất. Khi không có mặt, giá trị mặc định là `1`.

## Ví dụ

Cú pháp sau:

```http
text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8
```

chỉ ra thứ tự ưu tiên:

| Giá trị                                | Độ ưu tiên |
| -------------------------------------- | ---------- |
| `text/html` và `application/xhtml+xml` | `1.0`      |
| `application/xml`                      | `0.9`      |
| `*/*`                                  | `0.8`      |

Nếu không có độ ưu tiên nào được xác định cho hai giá trị đầu tiên, thứ tự trong danh sách là không liên quan. Tuy nhiên, với cùng chất lượng, các giá trị cụ thể hơn được ưu tiên hơn các giá trị ít cụ thể hơn:

```http
text/html;q=0.8,text/*;q=0.8,*/*;q=0.8
```

| Giá trị     | Độ ưu tiên                            |
| ----------- | ------------------------------------- |
| `text/html` | `0.8` (nhưng được chỉ định hoàn toàn) |
| `text/*`    | `0.8` (được chỉ định một phần)        |
| `*/*`       | `0.8` (không được chỉ định)           |

Một số cú pháp, như cú pháp của {{HTTPHeader("Accept")}}, cho phép thêm các bộ xác định như `text/html;level=1`. Những điều này làm tăng mức độ cụ thể của giá trị. Việc sử dụng chúng cực kỳ hiếm.

## Xem thêm

- [HTTP header](/en-US/docs/Web/HTTP/Reference/Headers) sử dụng q-value trong cú pháp của chúng: {{HTTPHeader("Accept")}}, {{HTTPHeader("Accept-Encoding")}}, {{HTTPHeader("Accept-Language")}}, {{HTTPHeader("TE")}}.
- [Định nghĩa trường header.](https://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html)
