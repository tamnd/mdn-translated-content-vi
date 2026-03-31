---
title: Content-Language header
short-title: Content-Language
slug: Web/HTTP/Reference/Headers/Content-Language
page-type: http-header
browser-compat: http.headers.Content-Language
sidebar: http
---

Tiêu đề HTTP **`Content-Language`** {{Glossary("representation header", "biểu diễn")}} được sử dụng để mô tả (các) ngôn ngữ dành cho đối tượng, để người dùng có thể phân biệt theo ngôn ngữ ưa thích của họ.

Ví dụ, `Content-Language: de-DE` chỉ ra rằng tài liệu dành cho người nói tiếng Đức. Tài liệu có thể được viết bằng tiếng Anh, không phải tiếng Đức, như một phần của khóa học ngôn ngữ dành cho người học tiếng Đức. Để chỉ ra ngôn ngữ tài liệu **được viết bằng**, hãy sử dụng thuộc tính [`lang`](/en-US/docs/Web/HTML/Reference/Global_attributes/lang) thay thế.

Nếu không có `Content-Language` nào được chỉ định, mặc định là nội dung dành cho tất cả đối tượng ngôn ngữ. Nhiều thẻ ngôn ngữ cũng có thể được sử dụng, cũng như áp dụng tiêu đề `Content-Language` cho nhiều kiểu phương tiện khác nhau và không chỉ cho các tài liệu văn bản.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>{{Glossary("Representation header", "Tiêu đề biểu diễn")}}</td>
    </tr>
    <tr>
      <th scope="row">{{Glossary("Forbidden request header", "Tiêu đề yêu cầu bị cấm")}}</th>
      <td>Không</td>
    </tr>
    <tr>
      <th scope="row">
        {{Glossary("CORS-safelisted response header")}}
      </th>
      <td>Có</td>
    </tr>
    <tr>
      <th scope="row">
        {{Glossary("CORS-safelisted request header")}}
      </th>
      <td>
        Có*
      </td>
    </tr>
  </tbody>
</table>

\* Giá trị chỉ có thể là `0-9`, `A-Z`, `a-z`, dấu cách, hoặc các ký tự `*,-.;=`.

## Cú pháp

```http
Content-Language: de-DE
Content-Language: en-US
Content-Language: de-DE, en-CA
```

## Chỉ thị

- `language-tag`
  - : Nhiều thẻ ngôn ngữ được phân tách bằng dấu phẩy. Mỗi thẻ ngôn ngữ là một chuỗi một hoặc nhiều thẻ con không phân biệt chữ hoa/thường, mỗi thẻ được phân tách bằng ký tự gạch ngang (`-`). Trong hầu hết các trường hợp, thẻ ngôn ngữ bao gồm thẻ con ngôn ngữ chính xác định một gia đình ngôn ngữ liên quan rộng lớn (ví dụ: `en` = tiếng Anh) và tùy chọn theo sau bởi một loạt các thẻ con thu hẹp phạm vi ngôn ngữ đó (ví dụ: `en-CA` = tiếng Anh như được sử dụng ở Canada).

> [!NOTE]
> Các ngôn ngữ được chỉ định sử dụng {{glossary("BCP 47 language tag", "thẻ ngôn ngữ BCP 47")}}, dựa vào tiêu chuẩn [ISO 639](https://en.wikipedia.org/wiki/ISO_639) (thường xuyên nhất là [danh sách mã ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes)) cho [các mã ngôn ngữ](https://en.wikipedia.org/wiki/Language_code) được sử dụng.

## Ví dụ

### Chỉ ra ngôn ngữ một tài liệu được viết bằng

Thuộc tính toàn cục [`lang`](/en-US/docs/Web/HTML/Reference/Global_attributes/lang) được sử dụng trên các phần tử HTML để chỉ ra ngôn ngữ của toàn bộ tài liệu [HTML](/en-US/docs/Web/HTML) hoặc các phần của nó.

```html
<html lang="de">
  …
</html>
```

**Không** sử dụng phần tử meta này để khai báo ngôn ngữ tài liệu, như được hiển thị bên dưới:

```html example-bad
<meta http-equiv="content-language" content="de" />
```

### Chỉ ra đối tượng mục tiêu cho tài nguyên

Tiêu đề `Content-Language` được sử dụng để chỉ định **đối tượng mục tiêu của trang** và có thể chỉ ra rằng đây là nhiều hơn một ngôn ngữ.

```http
Content-Language: de, en
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTTPHeader("Accept-Language")}}
- [HTTP headers, meta elements và thông tin ngôn ngữ](https://www.w3.org/International/questions/qa-http-and-lang.en)
- [Thuộc tính `lang` HTML](/en-US/docs/Web/HTML/Reference/Global_attributes/lang)
