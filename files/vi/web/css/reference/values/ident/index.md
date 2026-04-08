---
title: <ident>
slug: Web/CSS/Reference/Values/ident
page-type: css-type
spec-urls: https://drafts.csswg.org/css-values/#typedef-ident
sidebar: cssref
---

Kiểu dữ liệu **`<ident>`** của [CSS](/vi/docs/Web/CSS) biểu thị một chuỗi tùy ý được sử dụng như một {{glossary("identifier")}}.

## Cú pháp

Một định danh CSS bao gồm một hoặc nhiều ký tự, có thể là bất kỳ ký tự nào sau đây:

- bất kỳ ký tự {{glossary("ASCII")}} nào trong phạm vi `A-Z` và `a-z`
- bất kỳ chữ số thập phân nào (`0` đến `9`)
- dấu gạch nối (`-`)
- dấu gạch dưới (`_`)
- bất kỳ ký tự {{glossary("Unicode")}} nào từ `U+00A0` trở lên (tức là bất kỳ ký tự Unicode không phải ASCII nào)
- một [ký tự được thoát](#thoát_ký_tự)

Ngoài ra, một định danh không được bắt đầu bằng chữ số không được thoát, và không được bắt đầu bằng dấu gạch nối không được thoát theo sau là chữ số không được thoát.

Lưu ý rằng `id1`, `Id1`, `iD1` và `ID1` đều là các định danh khác nhau vì chúng [phân biệt chữ hoa chữ thường](https://en.wikipedia.org/wiki/Case_sensitivity). Mặt khác, vì có nhiều cách để thoát một ký tự, `toto\?` và `toto\3F` là cùng một định danh.

### Thoát ký tự

{{glossary("Escape character", "Thoát một ký tự")}} có nghĩa là biểu diễn nó theo cách thay đổi cách một hệ thống phần mềm diễn giải nó. Trong CSS, bạn có thể thoát một ký tự bằng cách thêm dấu gạch chéo ngược (`\`) trước ký tự. Bất kỳ ký tự nào, ngoại trừ các chữ số thập lục phân `0-9`, `a-f`, và `A-F`, đều có thể được thoát theo cách này. Ví dụ, `&` có thể được thoát thành `\&`.

Bạn cũng có thể thoát bất kỳ ký tự nào bằng dấu gạch chéo ngược theo sau là {{glossary("code point")}} {{glossary("Unicode")}} của ký tự được biểu diễn bởi một đến sáu chữ số thập lục phân. Ví dụ, `&` có thể được thoát thành `\26`. Trong cách dùng này, nếu ký tự được thoát theo sau là một chữ số thập lục phân, hãy thực hiện một trong những điều sau:

- Đặt khoảng trắng hoặc ký tự khoảng trắng khác sau điểm mã Unicode.
- Cung cấp điểm mã Unicode đầy đủ sáu chữ số của ký tự đang được thoát.

Ví dụ, chuỗi `&123` có thể được thoát thành `\26 123` (với khoảng trắng) hoặc `\000026123` (với điểm mã Unicode sáu chữ số cho `&`) để đảm bảo rằng `123` không được coi là một phần của mẫu thoát.

## Ví dụ

### Định danh hợp lệ

```plain example-good
nono79        /* Kết hợp ký tự chữ và số */
ground-level  /* Kết hợp ký tự chữ và dấu gạch nối */
-test         /* Dấu gạch nối theo sau là ký tự chữ */
--toto        /* Định danh giống thuộc tính tùy chỉnh */
_internal     /* Dấu gạch dưới theo sau là ký tự chữ */
\22 toto      /* Ký tự được thoát theo sau là ký tự chữ */
\000022toto   /* Giống như ví dụ trước */
scooby\.doo   /* Dấu chấm được thoát đúng cách */
🔥123         /* Ký tự không phải ASCII theo sau là chữ số */
```

### Định danh không hợp lệ

```plain example-bad
34rem     /* Không được bắt đầu bằng chữ số thập phân */
-12rad    /* Không được bắt đầu bằng dấu gạch nối theo sau là chữ số thập phân */
scooby.doo  /* Ký tự ASCII ngoài chữ và số phải được thoát */
'scoobyDoo' /* Được coi là chuỗi */
"scoobyDoo" /* Được coi là chuỗi */
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

_Vì kiểu này không phải là kiểu thực sự mà là kiểu tiện ích được sử dụng để đơn giản hóa định nghĩa cú pháp CSS khác, không có thông tin khả năng tương thích trình duyệt._

## Xem thêm

- [&lt;custom-ident&gt;](/vi/docs/Web/CSS/Reference/Values/custom-ident)
- [&lt;dashed-ident&gt;](/vi/docs/Web/CSS/Reference/Values/dashed-ident)
