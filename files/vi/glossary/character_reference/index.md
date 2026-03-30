---
title: Character reference (Tham chiếu ký tự)
slug: Glossary/Character_reference
page-type: glossary-definition
sidebar: glossarysidebar
---

**Tham chiếu ký tự** {{glossary("HTML")}} là một {{glossary("escape character", "chuỗi thoát")}} của {{glossary("character", "ký tự")}} được sử dụng để biểu thị một ký tự khác trong trang web được kết xuất.

Tham chiếu ký tự được sử dụng để thay thế cho các ký tự được dành riêng trong HTML, như các ký hiệu nhỏ hơn (`<`) và lớn hơn (`>`) được trình phân tích HTML sử dụng để nhận dạng {{Glossary('tag','thẻ')}} phần tử, hoặc `"` hay `'` trong các thuộc tính, có thể được đặt trong các ký tự đó.
Chúng cũng có thể được sử dụng cho các ký tự vô hình mà nếu không sẽ không thể gõ được, bao gồm khoảng trắng không ngắt, các ký tự điều khiển như dấu từ trái sang phải và phải sang trái, và các ký tự khó gõ trên bàn phím tiêu chuẩn.

Có ba loại tham chiếu ký tự:

- **Tham chiếu ký tự được đặt tên**
  - : Những tham chiếu này sử dụng một chuỗi tên giữa dấu và (`&`) và dấu chấm phẩy (`;`) để tham chiếu đến ký tự tương ứng.
    Ví dụ, `&lt;` được sử dụng cho ký hiệu nhỏ hơn (`<`), và `&copy;` cho ký hiệu bản quyền (`©`).
    Chuỗi được sử dụng cho tham chiếu thường là {{glossary("Camel case","camel case")}} viết tắt hoặc rút gọn của tên ký tự.

- **Tham chiếu ký tự số thập phân**
  - : Các tham chiếu này bắt đầu bằng `&#`, theo sau là một hoặc nhiều chữ số ASCII biểu thị số nguyên cơ số mười tương ứng với {{glossary("code point", "điểm mã")}} {{glossary("Unicode")}} của ký tự, và kết thúc bằng `;`.
    Ví dụ, tham chiếu ký tự thập phân cho `<` là `&#60;`, vì điểm mã Unicode cho ký hiệu là `U+0003C`, và `3C` thập lục phân là 60 trong hệ thập phân.

- **Tham chiếu ký tự số thập lục phân**
  - : Các tham chiếu này bắt đầu bằng `&#x` hoặc `&#X`, theo sau là một hoặc nhiều chữ số hex ASCII, biểu thị số nguyên thập lục phân tương ứng với điểm mã Unicode của ký tự, và kết thúc bằng `;`.
    Ví dụ, tham chiếu ký tự thập lục phân cho `<` là `&#x3C;` hoặc `&#X3C;`, vì điểm mã Unicode cho ký hiệu là `U+0003C`.

Một tập hợp rất nhỏ các tham chiếu ký tự được đặt tên hữu ích cùng với các điểm mã unicode của chúng được liệt kê dưới đây.

| Ký tự | Tham chiếu đặt tên | Điểm mã Unicode |
| ----- | ------------------ | --------------- |
| &     | `&amp;`            | U+00026         |
| <     | `&lt;`             | U+0003C         |
| >     | `&gt;`             | U+0003E         |
| "     | `&quot;`           | U+00022         |
| '     | `&apos;`           | U+00027         |
|       | `&nbsp;`           | U+000A0         |
| –     | `&ndash;`          | U+02013         |
| —     | `&mdash;`          | U+02014         |
| ©     | `&copy;`           | U+000A9         |
| ®     | `&reg;`            | U+000AE         |
| ™     | `&trade;`          | U+02122         |
| ≈     | `&asymp;`          | U+02248         |
| ≠     | `&ne;`             | U+02260         |
| £     | `&pound;`          | U+000A3         |
| €     | `&euro;`           | U+020AC         |
| °     | `&deg;`            | U+000B0         |

Danh sách đầy đủ các tham chiếu ký tự được đặt tên trong HTML [có thể tìm thấy trong đặc tả HTML tại đây](https://html.spec.whatwg.org/multipage/named-characters.html#named-character-references).

## Xem thêm

- Thuật ngữ liên quan:
  - {{glossary("Character", "Ký tự")}}
  - {{glossary("Escape character", "Ký tự thoát")}}
  - {{glossary("Code point", "Điểm mã")}}
  - {{glossary("Unicode")}}
